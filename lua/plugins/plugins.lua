
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'terroo/vim-simple-emoji'

--  use 'sheerun/vim-polyglot'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'  -- optional, for file icon
    }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'williamboman/nvim-lsp-installer' -- lsp cpm
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim' 
  use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp', }
  -- use 'feline-nvim/feline.nvim'
   -- use "nvim-lualine/lualine.nvim" -- Status line
use {
    'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
      
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'stephenway/postcss.vim'
  use 'alexlafroscia/postcss-syntax.vim'
  --use 'neoclide/coc.nvim'
--   use {'neoclide/coc.nvim', branch = 'release'}
use 'htacg/tidy-html5'
  use 'nvim-treesitter/nvim-treesitter'

use 'lewis6991/impatient.nvim'

use 'rhysd/vim-gfm-syntax'

  -- config editor
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use 'navarasu/onedark.nvim'
  use 'EdenEast/nightfox.nvim'  
  use 'vimwiki/vimwiki'
  use 'morhetz/gruvbox'-- If you are using Packer
  use 'marko-cerovac/material.nvim'
  use 'haya14busa/incsearch.vim'
  use 'nvim-lua/lsp-status.nvim'
  use 'nvim-lua/popup.nvim'
  use 'windwp/nvim-autopairs'
use {
  "ur4ltz/surround.nvim",
  config = function()
    require"surround".setup {mappings_style = "surround"}
  end
}
use "terrortylor/nvim-comment"
require('nvim_comment').setup()


use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}


use {
	"SmiteshP/nvim-gps",
	requires = "nvim-treesitter/nvim-treesitter"
}

  --use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
  --require("toggleterm").setup():
  --end}
  use 'norcalli/nvim-colorizer.lua'
--  use 'MunifTanjim/eslint.nvim'
use 'xenoterracide/html.vim'
--use 'mfussenegger/nvim-lint'
use {'w0rp/ale',
  ft = { 'sh', 'fish', 'html'},
  cmd = 'ALEEnableBuffer',
  config = 'vim.cmd [[ALEEnableBuffer]]'
}
use "tpope/vim-fugitive"
end)
