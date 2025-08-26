-- kill transparency that hides text
vim.opt.pumblend = 0
vim.opt.winblend = 0

-- readable completion menu
vim.api.nvim_set_hl(0, "Pmenu",      { bg = "#1f2335", fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "PmenuSel",   { bg = "#33467C", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = "#2a2e3f" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#515a7b" })

-- readable LSP/Treesitter floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335", fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1f2335", fg = "#515a7b" })

