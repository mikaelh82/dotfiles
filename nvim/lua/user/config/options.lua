-- Essential clipboard and mouse support
vim.opt.clipboard = "unnamedplus" -- system clipboard integration
vim.opt.mouse = "a" -- enable mouse support

-- Search settings
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- override ignorecase when using uppercase

-- Split behavior
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- File handling
vim.opt.swapfile = false -- no swap file
vim.opt.undofile = true -- persistent undo
vim.opt.backup = false -- no backup files
vim.opt.writebackup = false -- no backup during write

-- Indentation
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- spaces for indentation
vim.opt.tabstop = 2 -- spaces for tab
vim.opt.smartindent = true -- smarter indentation

-- Visual
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.wrap = false -- no line wrapping
vim.opt.termguicolors = true -- true color support

-- Performance
vim.opt.updatetime = 100 -- faster completion
vim.opt.timeoutlen = 1000 -- time for mapped sequence

-- Completion
vim.opt.completeopt = { "menuone", "noselect" } -- better completion

-- Allow moving past line ends
vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim3/bin/python")
vim.g.node_host_prog = vim.fn.expand("~/.volta/tools/image/packages/neovim/bin/neovim-node-host")
