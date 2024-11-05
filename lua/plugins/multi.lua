return {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
        -- Ativando mapeamentos padrão
        vim.g.VM_default_mappings = 1

        -- Definindo mapeamentos personalizados
        vim.g.VM_maps = {
            ["Find Under"] = "<C-n>",
            ["Find Subword Under"] = "<C-n>",
            ["Select All"] = "\\A",
            ["Start Regex Search"] = "\\/",
            ["Add Cursor Down"] = "<C-Down>",
            ["Add Cursor Up"] = "<C-Up>",
            ["Add Cursor At Pos"] = "\\\\",
            ["Visual Regex"] = "\\/",
            ["Visual All"] = "\\A",
            ["Visual Add"] = "\\a",
            ["Visual Find"] = "\\f",
            ["Visual Cursors"] = "\\c",
        }
    end,
}
