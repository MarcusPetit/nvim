local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<leader>gd", function()
    Util.float_term(
        { "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
        { cwd = Util.get_root(), esc_esc = false }
    )
end, { desc = "LazyDocker (root dir)" })
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local discipline = require("craftzdog.discipline")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local api = require("remote-sshfs.api")

vim.keymap.set("n", "<leader>rc", api.connect, {})
vim.keymap.set("n", "<leader>rd", api.disconnect, {})
vim.keymap.set("n", "<leader>re", api.edit, {})

map("n", "<A-q>", ":Neotree toggle<CR>", { noremap = true, silent = true })
-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')
keymap.set("n", "<M-q>", ":NvimTreeToggle<CR>")
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Copiar o texto selecionado em modo visual
keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo normal
keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo visual
keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo de inserção
-- Copiar o texto selecionado em modo visual
keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo normal
keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo visual
keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Colar a partir do registro do sistema em modo de inserção
keymap.set("i", "<C-v>", '<Esc>"+p', { noremap = true, silent = true })
-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

keymap.set("n", "<C-o>", "l", { noremap = true, silent = true })

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Pula 15 linhas para cima
keymap.set("n", "<S-Up>", "15k", { noremap = true, silent = true })

-- Pula 15 linhas para baixo
keymap.set("n", "<S-Down>", "15j", { noremap = true, silent = true })

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "<C-e>", "$", { noremap = true, silent = true })
keymap.set("n", "<C-z>", "<Cmd>undo<CR>", { noremap = true, silent = true })
keymap.set("i", "<C-z>", "<Esc>:undo<CR>a", { noremap = true, silent = true })

-- Diagnostics
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
    require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
    require("craftzdog.lsp").toggleInlayHints()
end)
vim.api.nvim_set_keymap("n", "<C-d>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-d>", "<Nop>", { noremap = true, silent = true })

-- Mover linha para cima com Alt + seta para cima
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Mover linha para baixo com Alt + seta para baixo
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
