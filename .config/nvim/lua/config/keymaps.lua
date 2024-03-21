-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local os_name = vim.loop.os_uname().sysname

local modifier_key = os_name == "Darwin" and "D" or "C"

local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand("%"))
    vim.api.nvim_buf_delete(0, { force = true })
  end
end

vim.keymap.set("n", "<leader>z", ":bd<CR>", { silent = true, desc = "Close the current file" })
vim.keymap.set("n", "<leader>d", ":Neotree<CR>", { noremap = true, silent = true, desc = "Focus the sidebar" })
vim.keymap.set("n", "<leader>h", ":Dashboard<CR>", { noremap = true, silent = true, desc = "Show the dashboard" })
vim.keymap.set("n", "<leader>df", confirm_and_delete_buffer)
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
