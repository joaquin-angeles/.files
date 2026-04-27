local options = {
	formatters_by_ft = {
		bash = { "beautysh" },
		dash = { "beautysh" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		sh = { "beautysh" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
