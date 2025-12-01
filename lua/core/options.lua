-- * Hint: use `:h <option>` to figure out the meaning if needed
-- Core settings:
vim.opt.encoding = "utf-8"
vim.opt.guicursor = "" -- use a block cursor in normal mode
vim.opt.termguicolors = true -- true colors support
vim.opt.background = "dark" -- set UI theme background to light
vim.opt.mouse = "a" -- allow the mouse to be used in nvim
vim.opt.scrolloff = 8 -- keep 8 lines visible above/below cursor

-- Tabs and indentation:
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.shiftwidth = 4 -- spaces used for indentation
vim.opt.softtabstop = 4 -- spaces inserted when pressing TAB
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true -- smart auto-indenting
vim.opt.wrap = false -- no line wrapping

-- UI configuration:
vim.opt.number = true -- show absolute line numbers
vim.opt.relativenumber = true -- show relative line numbers for movement
vim.opt.showmode = false
vim.opt.cursorline = true -- highlight current line
vim.opt.splitright = true -- vertical splits to the right
vim.opt.splitbelow = true -- horizontal splits below

-- Searching:
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true
vim.opt.inccommand = "split" -- live preview for :substitute changes
vim.opt.incsearch = true -- show matches while typing
vim.opt.hlsearch = true -- highlight all search matches

-- File handling & persistence:
vim.opt.swapfile = false -- disable swap file creation
vim.opt.backup = false -- no backups
vim.opt.undofile = true -- persistent undo across sessions
vim.opt.isfname:append("@-@") -- include @-@ in file names

-- Enable editorconfig support:
vim.g.editorconfig = true
