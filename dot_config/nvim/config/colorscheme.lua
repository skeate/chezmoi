return function()
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.onedark_terminal_italics = 1

  -- local colors = vim.api.nvim_call_function'onedark#GetColors()'

  -- require'nvim-utils'.nvim_create_augroups {
  --   colorextend = {
  --     {
  --       'ColorScheme',
  --       '*',
  --       [[call onedark#set_highlight("jsxAttrib", {
  --         "fg": ]] .. colors.yellow .. [[,
  --         "cterm": "italic",
  --         "gui": "italic"
  --       }) ]] },
  --     {
  --       'ColorScheme',
  --       '*',
  --       [[call onedark#set_highlight('typescriptIdentifier', {
  --         "fg": ]] .. colors.red .. [[,
  --         "cterm": "italic",
  --         "gui": "italic"
  --       }) ]] },
  --   },
  -- }

  vim.cmd 'colorscheme onedark'
end
