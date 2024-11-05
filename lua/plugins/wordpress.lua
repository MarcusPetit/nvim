-- ~/.config/nvim/lua/plugins/wordpress.lua
return {
    "bitpoke/wordpress.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
        local wp = require("wordpress")
        local lspconfig = require("lspconfig")
        local null_ls = require("null-ls")

        -- Configuração do Intelephense para WordPress e WooCommerce
        lspconfig.intelephense.setup(wp.intelephense)

        -- Configuração do PHPCS e PHPCBF com null-ls
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.phpcs.with(wp.null_ls_phpcs),
                null_ls.builtins.formatting.phpcbf.with(wp.null_ls_phpcs),
            },
        })

        -- Desabilitar a instalação automática do PHPCS pelo Mason
        require("mason-null-ls").setup({
            automatic_installation = {
                exclude = { "phpcs", "phpcbf" },
            },
        })
    end,
}
