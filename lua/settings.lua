vim.cmd([[
set bg=dark
colorscheme onedark
set nocompatible
syntax enable
let g:mapleader = " "

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set showcmd
set cmdheight=1
set scrolloff=999
set splitbelow
set splitright
set conceallevel=0
set title
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set signcolumn=yes
set smarttab
set expandtab
set noshowmode
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus
set number
set relativenumber 
set ruler
set cursorline
set hidden
set wrap
set backspace=start,eol,indent
set mouse=a
set background=dark 
set guifont=JetBrainsMono_NF:h15 
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
let g:vimwiki_list = [{'path': '~/vimwiki/', 
      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext=1
nmap <silent> <C-C> :silent noh<CR>
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
"nmap <c-v> "+p
imap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
set breakindent
"set showbreak=>>>﬌
set showbreak=﬌

nmap <TAB> :BufferLineCycleNext<CR>
nmap <S-TAB> :BufferLineCyclePrev<CR>
set expandtab
set smarttab
set ignorecase
set hlsearch 
set incsearch 
nmap <CR> :noh<CR>
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter [/\?] :set hlsearch
  autocmd CmdlineLeave [/\?] :set nohlsearch
augroup END
set ttyfast
let g:neovide_cursor_vfx_mode = "ripple"

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = 'ƛ'

function Term()
  split | terminal
endfunction
map <c-t> :caLl Terminal()<cr>:resize 8<cr>:set nobuflisted<cr>

     
if has("autocmd")
  au TermOpen * if  &buftype == 'term' | set nobuflisted | endif
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap , :NvimTreeFocus<cr>
]])
--let g:neovide_cursor_vfx_mode = "ripple"
--set laststatus=0
--set lazyredraw
--set guifont=Hack:h12
--set termguicolors
--set termguicolors
--set highlight

--set wildignore+=*/node_modules/*
--set shell=pwsh.exe
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------- -
--
--
--
-- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}
