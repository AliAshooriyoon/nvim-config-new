-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New Tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<CR>", opts)

-- Switch between tabs
-- keymap.set("n", "<A-l>", ":tabnext<CR>", opts) -- Alt + l for next tab
-- keymap.set("n", "<A-h>", ":tabprev<CR>", opts) -- Alt + h for previous tab
-- Switch between tabs
-- keymap.set("n", "<C-l>", ":tabnext<CR>", opts) -- Ctrl + l for next tab
-- keymap.set("n", "<C-h>", ":tabprev<CR>", opts) -- Ctrl + h for previous tab

-- Split Window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move Window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize Window
keymap.set("n", "<C-w><Left>", "<C-w><")
keymap.set("n", "<C-w><Right>", "<C-w>>")
keymap.set("n", "<C-w><Up>", "<C-w>+")
keymap.set("n", "<C-w><Down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
