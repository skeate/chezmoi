vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.cmdheight = 1

-- Hide (eg) " -- INSERT -- " in command line
vim.o.showmode = false

-- Hide buffers, don't unload
vim.o.hidden = true

-- Don't visualize whitespace
vim.o.list = false

-- Don't redraw executing macros
vim.o.lazyredraw = true

-- Fix split dirs
vim.o.splitbelow = true
vim.o.splitright = true

-- Autowrite modified files on leave (but not :q)
vim.o.autowrite = true

-- Round indentation to n*shiftwidth
vim.o.shiftround = true

-- update window title to match file
vim.o.title = true

-- wrap at word delimiters (see: breakat) instead of anywhere
vim.o.linebreak = true

-- shorten (a)ll messages, (t)runcate the filename, and don't show the (I)ntro
-- message
vim.o.shortmess = 'atI'

-- show line numbers
vim.o.number = true

-- don't softwrap, in general
vim.o.wrap = false

-- enable mouse in all modes
vim.o.mouse = 'a'

vim.o.timeout = true
vim.o.timeoutlen = 0

-- Save when losing focus
vim.cmd([[ au FocusLost * :silent! wall ]])

-- tabs, spaces, wrapping {{{
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.textwidth = 100
-- t = auto-wrap text
-- c = auto-wrap comments
-- r = insert comment leader on enter
-- q = format comments with gq
-- n = recognize numbered lists
-- 1 = don't break a line after a one-letter word
-- j = remove comment leader on line join
vim.o.formatoptions = 'tcrqn1j'
-- }}}
-- Backups and undo {{{
vim.o.swapfile = false
vim.o.directory = vim.env.XDG_CACHE_HOME .. '/nvim/swap//'

vim.o.undofile = true
vim.o.undodir = vim.env.XDG_CACHE_HOME .. '/nvim/undo//'

vim.o.backup = true
vim.o.backupskip = '/tmp/*,/private/tmp/*'
vim.o.backupdir = vim.env.XDG_CACHE_HOME .. '/nvim/backup//'
-- Make those folders automatically if they don't already exist.
vim.cmd([[
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
]])
-- }}}
-- Cursor line {{{

vim.o.cursorline = true
vim.cmd([[
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
]])

-- }}}
