-- Caminho para o Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verifique se o Lazy.nvim está instalado
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- Adicione o Lazy.nvim ao runtime path do Neovim
vim.opt.rtp:prepend(lazypath)

-- Requer e configura o Lazy.nvim
require("lazy").setup({
    spec = {
        -- LazyVim e outros plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        {
            "mg979/vim-visual-multi",
            branch = "master",
            config = function()
                -- Configuração opcional do plugin
                vim.g.VM_maps = {
                    ["Find Under"] = "<C-n>",
                    ["Find Subword Under"] = "<C-n>",
                    ["Select All"] = "\\A",
                    ["Start Regex Search"] = "\\/",
                    ["Add Cursor Down"] = "<C-Down>",
                    ["Add Cursor Up"] = "<C-Up>",
                    ["Add Cursor At Pos"] = "\\\\",
                }
            end,
        },
        {
            "simrat39/symbols-outline.nvim",
            config = function()
                require("symbols-outline").setup()
            end,
        },
        {
            "rebelot/kanagawa.nvim",
            priority = 1000,
            config = function()
                require("kanagawa").setup({
                    transparent = true,
                    terminal_colors = true,
                })
                vim.cmd("colorscheme kanagawa")
            end,
        },

        {
            "nvim-lua/plenary.nvim", -- Plugin plenary.nvim
            lazy = true, -- Carregamento preguiçoso
        },
        {
            "nosduco/remote-sshfs.nvim",
            dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
            config = function()
                require("remote-sshfs").setup({
                    connections = {
                        ssh_configs = {
                            vim.fn.expand("$HOME") .. "/.ssh/config",
                            "/etc/ssh/ssh_config",
                        },
                    },
                    mounts = {
                        base_dir = vim.fn.expand("$HOME") .. "/.sshfs/",
                        unmount_on_exit = true,
                    },
                    handlers = {
                        on_connect = { change_dir = true },
                        on_disconnect = { clean_mount_folders = false },
                    },
                    ui = { confirm = { connect = true, change_dir = false } },
                })
                require("telescope").load_extension("remote-sshfs")
            end,
        },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = { colorscheme = { "kanagawa" } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
