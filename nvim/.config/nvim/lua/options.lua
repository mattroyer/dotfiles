local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
opt.numberwidth = 6
opt.number = true
opt.relativenumber = true
opt.statuscolumn = '%s%r %l '

-- tabs & indentation
opt.tabstop = 2 -- tab width
opt.shiftwidth = 2 -- indent width
opt.softtabstop = 2 -- soft tab stop
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- smart auto-indenting
opt.autoindent = true -- copy indent from current line

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive if uppercase in search
opt.hlsearch = false -- don't highlight search results
opt.incsearch = true -- show matches as you type

-- cursor line
opt.cursorline = true -- highlight the line the cursor is on

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes" -- show the sign column
opt.showmatch = true -- highlight matching brackets
opt.matchtime = 2 -- how long to show matching brackets
opt.cmdheight = 1 -- command line height
opt.completeopt = "menuone,noinsert,noselect" -- completion options
opt.showmode = false -- don't show mode in command line
opt.pumheight = 10 -- popup menu height
opt.pumblend = 0 -- popup menu transparency
opt.winblend = 0 -- floating window transparency
opt.conceallevel = 0 -- don't hide markup
opt.concealcursor = "" -- don't hide cursor line markup
opt.lazyredraw = true -- don't redraw during macros
opt.synmaxcol = 300 -- syntax highlighting limit
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
vim.o.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true


-- Save undo history
opt.undofile = true

-- misc
opt.iskeyword:append("-")
opt.scrolloff = 10
opt.sidescrolloff = 8

