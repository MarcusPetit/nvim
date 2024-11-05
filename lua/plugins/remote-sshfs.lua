return {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("remote-sshfs").setup({
            connections = {
                ssh_configs = {
                    vim.fn.expand("$HOME") .. "/.ssh/config", -- Config padrão de SSH
                    "/etc/ssh/ssh_config",
                },
            },
            mounts = {
                base_dir = vim.fn.expand("$HOME") .. "/.sshfs/", -- Diretório base para montagens
                unmount_on_exit = true, -- Desmontar automaticamente ao sair do Neovim
            },
            handlers = {
                on_connect = {
                    change_dir = true, -- Mudar o diretório de trabalho para o ponto de montagem
                },
                on_disconnect = {
                    clean_mount_folders = false, -- Não remover a pasta de montagem ao desconectar
                },
            },
            ui = {
                confirm = {
                    connect = true, -- Confirmar ao conectar
                    change_dir = false, -- Não confirmar ao mudar o diretório de trabalho
                },
            },
        })
        require("telescope").load_extension("remote-sshfs")
    end,
}
