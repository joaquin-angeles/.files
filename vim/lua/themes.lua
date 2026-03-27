-- lua/fzf_themes.lua
local M = {}

local SAMPLE = [[-- NvChad theme preview
local M = {}

---@param opts table
local function setup(opts)
  opts = vim.tbl_deep_extend("force", {
    theme      = "onedark",
    ui         = { border = "rounded" },
    lsp        = { inlay_hints = true },
  }, opts or {})
  return opts
end

local config = setup {
  theme = "catppuccin",
  ui    = { border = "solid", winblend = 5 },
}

vim.api.nvim_set_hl(0, "Normal",       { bg = "NONE" })
vim.api.nvim_set_hl(0, "Comment",      { fg = "#7f848e", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticOk", { fg = "#98c379" })

local function greet(name)
  if not name or name == "" then
    vim.notify("no name given", vim.log.levels.WARN)
    return nil
  end
  local msgs = { "Hello", "Hi", "Hey" }
  return msgs[math.random(#msgs)] .. ", " .. name .. "!"
end

for i = 1, 3 do
  print(greet("user" .. tostring(i)))
end

return M
]]

local preview_file = vim.fn.stdpath("cache") .. "/nvchad_theme_preview.lua"

local function ensure_preview_file()
	if vim.fn.filereadable(preview_file) == 0 then
		local f = io.open(preview_file, "w")
		if f then
			f:write(SAMPLE)
			f:close()
		end
	end
end

local function get_themes()
	local dir = vim.fn.stdpath("data") .. "/lazy/base46/lua/base46/themes"
	local names = {}
	if vim.fn.isdirectory(dir) == 1 then
		for _, f in ipairs(vim.fn.readdir(dir)) do
			local n = f:match("^(.+)%.lua$")
			if n then
				names[#names + 1] = n
			end
		end
	end
	table.sort(names)
	return names
end

local function apply_theme(name)
	local ok, nvcfg = pcall(require, "nvconfig")
	if ok and nvcfg.base46 then
		nvcfg.base46.theme = name
	end
	vim.g.nvchad_theme = name
	require("base46").load_all_highlights()
end

local function save_theme(name)
	local path = vim.fn.stdpath("config") .. "/lua/chadrc.lua"
	local lines = vim.fn.readfile(path)
	for i, line in ipairs(lines) do
		if line:match('%f[%w]theme%s*=%s*"[^"]*"') then
			lines[i] = line:gsub('theme%s*=%s*"[^"]*"', ('theme = "%s"'):format(name))
			break
		end
	end
	vim.fn.writefile(lines, path)
end

local function make_previewer()
	local builtin = require("fzf-lua.previewer.builtin")

	local ThemePreviewer = setmetatable({}, { __index = builtin.buffer_or_file })
	ThemePreviewer.__index = ThemePreviewer

	function ThemePreviewer.new(o, opts, fzf_win)
		local self = builtin.buffer_or_file.new(o, opts, fzf_win)
		return setmetatable(self, ThemePreviewer)
	end

	function ThemePreviewer:populate_preview_buf(entry_str)
		pcall(apply_theme, entry_str)
		builtin.buffer_or_file.populate_preview_buf(self, preview_file)
	end

	function ThemePreviewer:preview_buf_post(_entry, _min_winopts)
		local buf = self.preview_bufnr
		if not buf or not vim.api.nvim_buf_is_valid(buf) then
			return
		end

		vim.bo[buf].filetype = "lua"

		local ok, ts = pcall(require, "nvim-treesitter.highlight")
		if ok then
			ts.attach(buf, "lua")
		else
			pcall(vim.treesitter.start, buf, "lua")
		end

		if self.win and self.win:validate_preview() then
			vim.wo[self.win.preview_winid].number = true
			vim.wo[self.win.preview_winid].cursorline = false
		end
	end

	return ThemePreviewer
end

function M.open()
	ensure_preview_file()

	local themes = get_themes()
	local original = vim.g.nvchad_theme or vim.g.colors_name or "onedark"

	require("fzf-lua").fzf_exec(themes, {
		prompt = "  Theme › ",

		winopts = {
			title = "  NvChad Themes ",
			title_pos = "center",
			height = 0.80,
			width = 0.85,
			row = 0.50,
			col = 0.50,
			border = "rounded",
			preview = {
				horizontal = "right:55%",
				border = "rounded",
			},
		},

		previewer = make_previewer(),

		actions = {
			["default"] = function(selected)
				if selected and selected[1] then
					apply_theme(selected[1])
					save_theme(selected[1])
					vim.notify("Theme → " .. selected[1], vim.log.levels.INFO)
				else
					apply_theme(original)
				end
			end,
			["esc"] = function(_)
				apply_theme(original)
			end,
		},
	})
end

return M
