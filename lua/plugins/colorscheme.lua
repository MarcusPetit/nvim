return {
    {
        "drebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        opts = function()
            return {
                transparent_background = true,
                terminal_colors = true,
                transparent = true,
                highlight = {
                    normal = { guibg = "#000000b3" }, -- #000000b3 representa preto com 70% de opacidade
                },
            }
        end,
    },
}
