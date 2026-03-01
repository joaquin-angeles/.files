require("nvchad.configs.lspconfig").defaults()
local servers = { "html", "cssls", "lua_ls", "nixd", "hyprls" }

vim.lsp.config("nixd", {
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> {}",
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake "/home/joaquin/.files/nixos").nixosConfigurations.nixos-btw.options',
                },
            },
        },
    },
})

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
