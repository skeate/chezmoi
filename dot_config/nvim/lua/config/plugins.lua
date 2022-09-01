return require('packer').startup(function(use)
	use {
		'wbthomason/packer.nvim',
		config = function ()
			vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
		end
	}

	use 'norcalli/nvim_utils'

	use 'tpope/vim-sensible'
	use 'tpope/vim-repeat'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'

	use 'b4winckler/vim-angry'
	use 'vim-scripts/camelcasemotion'
	use 'tommcdo/vim-lion'

	use {
		'windwp/nvim-autopairs',
		config = function()
			require'nvim-autopairs'.setup {
				disable_filetype = { "TelescopePrompt" , "vim" },
			}
			require'nvim-autopairs.completion.compe'.setup {
				map_cr = true,
				map_complete = true,
			}
		end
	}

	use 'euclidianAce/BetterLua.vim'
	use 'tjdevries/manillua.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'kabouzeid/nvim-lspinstall',
		config = function()
			require 'config.lsp-setup'
		end
	}
	use {
		'hrsh7th/nvim-compe',
		config = function()
			vim.o.completeopt = "menuone,noselect"
			vim.cmd([[
				inoremap <silent><expr> <C-Space> compe#complete()
				inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
				inoremap <silent><expr> <C-e>     compe#close('<C-e>')
				inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
				inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
			]])
		end
	}

	use 'tjdevries/nlua.nvim'

	use {
		'tpope/vim-vinegar',
		config = function()
			vim.g.netrw_altfile = 1
		end
	}

	use {
		'sheerun/vim-polyglot',
		config = function()
			vim.g.polyglot_disabled = { 'latex' }
		end
	}

	use {
		'joshdick/onedark.vim',
		config = require 'config.colorscheme'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				}
			}
		end
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			vim.g.indent_blankline_char = '▏'
		end
	}

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require'lualine'.setup {
				options = {
					theme = 'onedark'
				}
			}
		end
	}

	use {
		'osyo-manga/vim-over',
		config = function()
			vim.cmd([[
				function! VisualFindAndReplace()
						:OverCommandLine%s/
						:w
				endfunction
				function! VisualFindAndReplaceWithSelection() range
						:'<,'>OverCommandLine s/
						:w
				endfunction

				nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
				xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
				]])
		end
	}

	use 'airblade/vim-gitgutter'

	use {
		'alvarosevilla95/luatab.nvim',
		requires='kyazdani42/nvim-web-devicons',
		config = function()
			require('luatab').setup{}
		end
	}

	use 'svermeulen/vimpeccable'

	use {
		'simnalamburt/vim-mundo',
		config = function()
			vim.cmd([[
				nnoremap <leader>u :MundoToggle<CR>
			]])
		end
	}

	use 'editorconfig/editorconfig-vim'
end)
