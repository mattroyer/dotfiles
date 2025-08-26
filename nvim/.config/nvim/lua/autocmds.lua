local kb = require("utils.map")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    kb.n("q", ":q<CR>", 'Help: Quit help', { buffer = true })
  end,
})

