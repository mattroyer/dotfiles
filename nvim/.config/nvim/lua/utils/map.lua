local M = {}

-- Wrap an Ex command as a mapping: M.cmd("update | source $MYVIMRC")
function M.cmd(cmd) return ("<cmd>%s<cr>"):format(cmd) end

-- Core mapper. mode can be "n" or {"n","v"} etc.
function M.map(mode, keys, func, desc_or_opts, maybe_opts)
  local opts = {}
  if type(desc_or_opts) == "string" then
    opts = maybe_opts or {}
    opts.desc = desc_or_opts
  else
    opts = desc_or_opts or {}
  end

  if opts.remap then
    opts.noremap = nil  -- allow remap to work
  elseif opts.noremap == nil then
    opts.noremap = true
  end
  if opts.silent == nil then opts.silent = true end

  vim.keymap.set(mode, keys, func, opts)
end

-- Conveniences
function M.n(keys, func, desc, opts) M.map("n", keys, func, desc, opts) end
function M.v(keys, func, desc, opts) M.map("v", keys, func, desc, opts) end
function M.x(keys, func, desc, opts) M.map("x", keys, func, desc, opts) end
function M.i(keys, func, desc, opts) M.map("i", keys, func, desc, opts) end
function M.t(keys, func, desc, opts) M.map("t", keys, func, desc, opts) end

-- Create a buffer-scoped mapper table: km.buf(0).n("K", ..., ..., { })
function M.buf(bufnr)
  local function bmap(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    opts.buffer = bufnr
    M.map(mode, lhs, rhs, desc, opts)
  end
  return {
    map = function(...) bmap(...) end,
    n   = function(lhs, rhs, desc, opts) bmap("n", lhs, rhs, desc, opts) end,
    v   = function(lhs, rhs, desc, opts) bmap("v", lhs, rhs, desc, opts) end,
    x   = function(lhs, rhs, desc, opts) bmap("x", lhs, rhs, desc, opts) end,
    i   = function(lhs, rhs, desc, opts) bmap("i", lhs, rhs, desc, opts) end,
    t   = function(lhs, rhs, desc, opts) bmap("t", lhs, rhs, desc, opts) end,
  }
end

return M

