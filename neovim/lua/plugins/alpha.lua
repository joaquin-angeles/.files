return {
    {
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            local status_ok, alpha = pcall(require, "alpha")
            if not status_ok then
                vim.notify("Alpha-nvim failed to load!", vim.log.levels.ERROR)
                return
            end

            local status_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")
            if not status_dashboard then
                vim.notify("Alpha dashboard theme failed to load!", vim.log.levels.ERROR)
                return
            end

            local base16 = require("base46").get_theme_tb("base_16")
            local base30 = require("base46").get_theme_tb("base_30")

            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = base30.green })

            dashboard.section.header.val = {
                [[      ) )        /\                 ]],
                [[     =====      /  \                ]],
                [[    _|___|_____/ __ \____________   ]],
                [[   |::::::::::/ |  | \:::::::::::|  ]],
                [[   |:::::::::/  ====  \::::::::::|  ]],
                [[   |::::::::/__________\:::::::::|  ]],
                [[   |_________|  ____  |__________|  ]],
                [[    | ______ | / || \ | _______ |   ]],
                [[    ||  |   || ====== ||   |   ||   ]],
                [[    ||--+---|| |    | ||---+---||   ]],
                [[    ||__|___|| |   o| ||___|___||   ]],
                [[    |========| |____| |=========|   ]],
                [[   (^^-^^^^^-|________|-^^^--^^^)   ]],
                [[   (,, , ,, ,/________\,,,, ,, ,)   ]],
                [[  ','',,,,' /__________\,,,',',;;   ]],
            }

            dashboard.section.header.opts.hl = "AlphaHeader"

            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = base16.base03 })
            dashboard.section.buttons.val = {
                (function()
                    local b = dashboard.button("fn", "  New File", "<cmd>enew | startinsert<CR>")
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("ff", "  Find File", "<cmd>Telescope find_files hidden=true cwd=~/<CR>")
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("fo", "󱋡  Recent Files", "<cmd>Telescope oldfiles<CR>")
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("fw", "󱎸  Find Text", "<cmd>Telescope live_grep<CR>")
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("th", "󱥚  Themes", function()
                        require("nvchad.themes").open()
                    end)
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("M", "󰚥  Mason", "<cmd>Mason<cr>")
                    b.opts.hl_shortcut = "alphashortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("L", "󰒲  Lazy", "<cmd>Lazy<cr>")
                    b.opts.hl_shortcut = "alphashortcut"
                    return b
                end)(),
                (function()
                    local b = dashboard.button("Q", "  Quit", "<cmd>qa<CR>")
                    b.opts.hl_shortcut = "AlphaShortcut"
                    return b
                end)(),
            }

            local function footer()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
                return "󱐋 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
            end

            dashboard.section.footer.val = footer()

            dashboard.opts.layout = {
                { type = "padding", val = 3 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }

            alpha.setup(dashboard.opts)

            -- Optional: Update stats after everything has loaded
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy", -- triggered after all lazy-loaded plugins finish
                callback = function()
                    dashboard.section.footer.val = footer()
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "alpha",
                callback = function()
                    vim.opt.laststatus = 0
                    vim.api.nvim_create_autocmd("BufUnload", {
                        buffer = 0,
                        callback = function()
                            vim.opt.laststatus = 3 -- Or 2, depending on your preference
                        end,
                    })
                end,
            })
        end,
    },
}
