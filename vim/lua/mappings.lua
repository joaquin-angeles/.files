require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle UndoTree" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>th", function()
	require("themes").open()
end, { desc = "Theme Switcher (fzf-lua)" })

-- fzf-lua
map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "fzf live grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "fzf find buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "fzf help page" })
map("n", "<leader>ma", "<cmd>FzfLua marks<CR>", { desc = "fzf find marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "fzf find oldfiles" })
map("n", "<leader>fz", "<cmd>FzfLua grep_curbuf<CR>", { desc = "fzf find in current buffer" })
map("n", "<leader>cm", "<cmd>FzfLua git_commits<CR>", { desc = "fzf git commits" })
map("n", "<leader>gt", "<cmd>FzfLua git_status<CR>", { desc = "fzf git status" })
map("n", "<leader>pt", "<cmd>FzfLua terms<CR>", { desc = "fzf pick hidden term" })
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "fzf find files" })
map("n", "<leader>fa", function()
	require("fzf-lua").files({ fd_opts = "--no-ignore --hidden --follow" })
end, { desc = "fzf find all files" })

-- File management
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
