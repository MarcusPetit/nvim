return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                emmet_language_server = {
                    filetypes = {
                        "html",
                        "blade",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "javascript",
                        "typescript",
                        "markdown",
                    },
                },
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "bitpoke/wordpress.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local wp = require("wordpress")

            -- Configuração do null-ls para o PHPCS e PHPCBF
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.phpcs.with(wp.null_ls_phpcs),
                    null_ls.builtins.formatting.phpcbf.with(wp.null_ls_phpcs),
                },
            })
        end,
    },
}
