return {
  base = function()
    require('mason').setup({
      })
  end,

  lsp = function()
    local mlsp = require('mason-lspconfig')
    local lsp = require('lspconfig')

    mlsp.setup({
      automatic_installation = true,
    })

    mlsp.setup_handlers({
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
        lsp[server_name].setup {}
      end,
      -- Next, you can provide targeted overrides for specific servers.
      ["rust_analyzer"] = function ()
        require("rust-tools").setup {}
      end,
      ["sumneko_lua"] = function ()
        lsp.sumneko_lua.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        }
      end,
    })
  end
}
