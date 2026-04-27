local options = {
	formatters_by_ft = {
		-- Shell formatters
		sh = { "beautysh" },
		bash = { "beautysh" },
		dash = { "beautysh" },

		-- Prettier formatters
		css = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },

		-- Per-filetype formatters
		lua = { "stylua" },
		nix = { "nixfmt" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
