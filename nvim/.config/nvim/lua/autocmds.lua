local kb = require("utils.map")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    -- Only in a zk notebook
    if require("zk.util").notebook_root(vim.api.nvim_buf_get_name(args.buf)) then
      local b = require("utils.map").buf(args.buf)
      b.n("<CR>", vim.lsp.buf.definition, "ZK: Follow link")
      b.n("K",    vim.lsp.buf.hover,      "ZK: Preview link")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    kb.n("q", ":q<CR>", 'Help: Quit help', { buffer = true })
  end,
})

