return function ()
  require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
end
