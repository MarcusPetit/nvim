return {
    "neovim/nvim-lspconfig",
    config = function()
        local nvim_lsp = require("lspconfig")

        nvim_lsp.intelephense.setup({
            settings = {
                intelephense = {
                    stubs = {
                        "bcmath",
                        "bz2",
                        "calendar",
                        "Core",
                        "curl",
                        -- Outros stubs necessários
                        "zip",
                        "zlib",
                        "wordpress",
                        "woocommerce",
                        "acf-pro",
                        "wordpress-globals",
                        "wp-cli",
                        "genesis",
                        "polylang",
                    },
                    environment = {
                        includePaths = { "/home/marcus/.composer/vendor/php-stubs/" },
                    },
                    files = {
                        maxSize = 5000000,
                    },
                },
            },
        })
    end,
}
