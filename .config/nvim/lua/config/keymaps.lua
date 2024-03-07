-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>z", ":bd<CR>", { silent = true, desc = "Close the current file" })
vim.keymap.set("n", "<leader>d", ":Neotree<CR>", { noremap = true, silent = true, desc = "Focus the sidebar" })
vim.keymap.set("n", "<leader>h", ":Dashboard<CR>", { noremap = true, silent = true, desc = "Show the dashboard" })
