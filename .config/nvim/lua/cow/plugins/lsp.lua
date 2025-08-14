return {
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        'saghen/blink.cmp',
                        {
                                "folke/lazydev.nvim",
                                opts = {
                                        library = {
                                                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                                        },
                                },
                        },
                },
                config = function()
                        -- ========================
                        -- Set up Nerd Font icons for diagnostics
                        -- ========================
                        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                        for type, icon in pairs(signs) do
                                local hl = "DiagnosticSign" .. type
                                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                        end

                        -- ========================
                        -- Blink capabilities with Telescope fuzzy matching
                        -- ========================
                        local capabilities = require('blink.cmp').get_lsp_capabilities({
                                fuzzy = "telescope"
                        })

                        -- ========================
                        -- LSP setup
                        -- ========================
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup { capabilities = capabilities }
                        lspconfig.pyright.setup { capabilities = capabilities }
                        lspconfig.clangd.setup { capabilities = capabilities }
                        lspconfig.fortls.setup { capabilities = capabilities }
                        lspconfig.texlab.setup { capabilities = capabilities }

                        -- Optional: format Lua on save
                        vim.api.nvim_create_autocmd('LspAttach', {
                                callback = function(args)
                                        local c = vim.lsp.get_client_by_id(args.data.client_id)
                                        if not c then return end

                                        if vim.bo.filetype == "lua" then
                                                vim.api.nvim_create_autocmd('BufWritePre', {
                                                        buffer = args.buf,
                                                        callback = function()
                                                                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                                                        end,
                                                })
                                        end
                                end,
                        })
                end,
        }
}
