-- setup packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end



-- PACKER.USE OPTIONS
-- disable = boolean,           -- Mark a plugin as inactive
-- as = string,                 -- Specifies an alias under which to install the plugin
-- installer = function,        -- Specifies custom installer. See "custom installers" below.
-- updater = function,          -- Specifies custom updater. See "custom installers" below.
-- after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
-- rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
-- opt = boolean,               -- Manually marks a plugin as optional.
-- branch = string,             -- Specifies a git branch to use
-- tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
-- commit = string,             -- Specifies a git commit to use
-- lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
-- run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
-- requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
-- rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
-- config = string or function, -- Specifies code to run after this plugin is loaded.
-- -- The setup key implies opt = true
-- setup = string or function,  -- Specifies code to run before this plugin is loaded.
-- -- The following keys all imply lazy-loading and imply opt = true
-- cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
-- ft = string or list,         -- Specifies filetypes which load this plugin.
-- keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
-- event = string or list,      -- Specifies autocommand events which load this plugin.
-- fn = string or list          -- Specifies functions which load this plugin.
-- cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
-- module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                              -- with one of these module names, the plugin will be loaded.
-- module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
-- requiring a string which matches one of these patterns, the plugin will be loaded.

require('general')

-- setup reload of packer config on any changes
vim.cmd([[
  let nvim_path = system('chezmoi source-path') . '/dot_config/nvim'
  let postsource_action = 'PackerCompile | system("chezmoi apply")'
  augroup packer_user_config
    autocmd!
    execute 'autocmd BufWritePost ' . nvim_path . '/init.lua source <afile> | ' . postsource_action
    execute 'autocmd BufWritePost ' . nvim_path . '/lua/plugins/*.lua source ' . nvim_path . '/init.lua | ' . postsource_action
  augroup end
]])

-- install/configure plugins
return require('packer').startup(function(use)
  -- packer tracks itself
  use 'wbthomason/packer.nvim'

  -- optimize loading lua modules
  use 'lewis6991/impatient.nvim'

  -- COLORSCHEME
  -- use 'rebelot/kanagawa.nvim'
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   tag = 'v1.*',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  use { 'catppuccin/nvim', as = 'catppuccin', config = require('plugins/catppuccin') }

  -- sensible defaults
  use 'tpope/vim-sensible'
  -- fix . repeat for plugins
  use 'tpope/vim-repeat'
  -- add pairwise operators
  -- use 'tpope/vim-unimpaired'
  -- use - and clean netrw for file nav
  use 'tpope/vim-vinegar'

  -- commenting aids
  -- use { 'numToStr/Comment.nvim', config = require('plugins/comment') }

  -- LSP
  use {
    'williamboman/mason.nvim',
    config = require('plugins/mason').base,
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    config = require('plugins/mason').lsp,
  }
  use 'neovim/nvim-lspconfig'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = require('plugins/null-ls'),
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Debug-Adapter Protocol
  use 'mfussenegger/nvim-dap'

  use {
    'nvim-treesitter/nvim-treesitter',
    -- update installed modules on install/update
    -- without issue of `:TSUpdate` the first run
    run = function()
      require('nvim-treesitter.install').update({
        with_sync = true,
      })
    end,
    config = require('plugins/treesitter'),
  }

  -- Show the current scope context at top of window if scrolled off-screen
  use 'nvim-treesitter/nvim-treesitter-context'

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Git decorations
  use 'lewis6991/gitsigns.nvim'

  -- Show key binding suggestions popup
  use {
    'folke/which-key.nvim',
    config = require('plugins/which-key'),
  }

  -- Completion
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = require('plugins/coq'),
  }

  -- Surround
  use {
    'kylechui/nvim-surround',
    config = require('plugins/nvim-surround'),
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
