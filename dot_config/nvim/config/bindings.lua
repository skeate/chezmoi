local vimp = require('vimp')

vimp.nnoremap('<leader>to', ':tabnew<cr>')

vimp.nnoremap('<leader>r', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("config.util").unload_lua_namespace('config')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded vimrc!")
end)

vimp.noremap('Y', 'y$')

vimp.noremap('<F1>', ':checktime<cr>')
vimp.inoremap('<F1>', '<esc>:checktime<cr>')

vimp.nnoremap('<leader>s', 'vip:!sort<cr>')
vimp.vnoremap('<leader>s', ':!sort<cr>')

-- tabs
vimp.nnoremap('<C-Tab>', 'gt')
vimp.nnoremap('<C-S-Tab>', 'gT')
vimp.inoremap('<C-tab>', '<esc>gt')
vimp.inoremap('<C-s-tab>', '<esc>gT')

vimp.nnoremap('<leader>W', ':set wrap!<cr>')

vimp.nnoremap('vaa', 'ggvGg_')
vimp.nnoremap('Vaa', 'ggVG')

-- "Uppercase word" mapping.
--
-- This mapping allows you to press <c-u> in insert mode to convert the current
-- word to uppercase.  It's handy when you're writing names of constants and
-- don't want to use Capslock.
--
-- To use it you type the name of the constant in lowercase.  While your
-- cursor is at the end of the word, press <c-u> to uppercase it, and then
-- continue happily on your way:
--
--                            cursor
--                            v
--     max_connections_allowed|
--     <c-u>
--     MAX_CONNECTIONS_ALLOWED|
--                            ^
--                            cursor
--
-- It works by exiting out of insert mode, recording the current cursor location
-- in the z mark, using gUiw to uppercase inside the current word, moving back to
-- the z mark, and entering insert mode again.
--
-- Note that this will overwrite the contents of the z mark.  I never use it, but
-- if you do you'll probably want to use another mark.
vimp.inoremap('<C-u>', '<esc>mzgUiw`za')

-- zoom head level
vimp.nnoremap('zh', 'mzzt10<c-u>`z')

-- don't move cursor when joining lines
vimp.nnoremap('J', 'mzJ`z')

-- [S]plit line
vimp.nnoremap('S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w')

vimp.nnoremap('\'', '`')
vimp.nnoremap('æ', '\'')
vimp.nnoremap('`', '<C-^>')

vimp.cnoremap('w!!', 'w !sudo tee % >/dev/null')

vim.cmd([[
  command! -bang E e<bang>
  command! -bang Q q<bang>
  command! -bang W w<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Wq wq<bang>
  command! -bang WQ wq<bang>
  command! -bang Vsp vsp<bang>
]])

vimp.nnoremap('zl', ':let @z=@"<cr>x$p:let @"=@z<cr>')
vimp.nmap('<leader>a', 'gLi{:')

vimp.nnoremap('<leader>ev', function()
  vim.cmd('vsplit ~/.local/etc/base/nvim/init.lua')
end)
vimp.nnoremap('<leader>et', function()
  vim.cmd('vsplit ~/.local/etc/base/tmux/tmux.conf')
end)
vimp.nnoremap('<leader>ez', function() vim.cmd('vsplit ~/.local/etc/base/zsh') end)
vimp.nnoremap('<leader>ec', function() vim.cmd('vsplit ~/.local/etc') end)
