vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.hidden = true
vim.o.visualbell = true
vim.o.list = false
vim.o.lazyredraw = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.autowrite = true
vim.o.shiftround = true
vim.o.title = true
vim.o.linebreak = true
vim.o.shortmess = 'atI'
vim.o.number = true
vim.o.wrap = false
vim.o.mouse = 'a'

-- Time out on key codes but not mappings.
-- Basically this makes terminal Vim work sanely.
vim.o.timeout = false


-- Save when losing focus
vim.cmd([[ au FocusLost * :silent! wall ]])

-- tabs, spaces, wrapping {{{
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.textwidth = 80
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
