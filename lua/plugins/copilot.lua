return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        cmd = "CopilotChat",
        opts = {
            auto_insert_mode = true,
            question_header = "  User ",
            answer_header = "  Copilot ",
            window = { width = 0.4 },
        },
        keys = {
            { "<leader>cca", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Chat" },
        },
        config = function(_, opts)
            require("CopilotChat").setup(opts)
        end,
    },
}
