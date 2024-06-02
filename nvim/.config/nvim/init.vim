set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.local/share/nvim/plugged')

" Plugins
" Conquer of Completion that has extensions for TSness
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Javascript
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
" Interface changes
Plug 'Shougo/denite.nvim'
" Editing
Plug 'scrooloose/nerdcommenter'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Grep
Plug 'mileszs/ack.vim'
" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "installs the binary
Plug 'junegunn/fzf.vim'
" Colorschemes
Plug 'folke/tokyonight.nvim'
" Markdown
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
" Vue, handlebars, and other front-end dev
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Valloric/MatchTagAlways'
Plug 'evanleck/vim-svelte'
" net-rw enhancement
Plug 'tpope/vim-vinegar'
" Graphql
Plug 'jparise/vim-graphql'
" Editor config
Plug 'editorconfig/editorconfig-vim'
" Diffing
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" Tabs + tab nav
Plug 'romgrk/barbar.nvim'
" Terraform
Plug 'hashivim/vim-terraform'
" Icons 
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Custom settings
"
if has('win32') || has('win64')
	let g:python3_host_prog = 'C:\Python38'
endif

let g:ackprg = 'ag --nogroup --column --ignore .git'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

filetype plugin on

let g:one_allow_italics = 1 " I love italic for comments
let g:airline_theme='nord_minimal'

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme tokyonight

let mapleader="#"

" TEXT RENDERING OPTIONS
syntax enable
set softtabstop=2
set encoding=utf-8    " use an encoding that supports unicode
set linebreak         " avoid wrapping a line in the middle of a word
set scrolloff=1       " the number of screen lines to keep above and below the cursor

" USER INTERFACE OPTIONS
set termguicolors
set number                    " show line numbers
set ruler                     " show where you are
set noshowmode                " disable vim mode being displayed on the last line, we are using powerline for this
set mouse+=a                  " enable mouse for scrolling and resizing
set cursorline                " highlight the line currently under cursor
set background=dark
set splitright               " split new window to the right of the current window
set title

" MISC OPTIONS
set showmatch                 " jump to matching bracket
set clipboard=unnamedplus     " yank and pase with system clipboard
set autoread                  " autoread/load the files changed externally
set noswapfile
set nocompatible
set list
set path+=** " Allow recursive search when using commands such as :find, gf,

" PERFORMANCE OPTIONS 
set lazyredraw     " don't update the screen during macro and script execution
set updatetime=300 " default milisecond for swapfile write on idle

" SEARCH OPTIONS
set hlsearch                      " Search highlighting
set smartcase                     " Smart case switching if search term contains uppercase
set ignorecase                    " Ignore case when searching
set incsearch                     " incremental search that shows partial matches

" INDENTATION OPTIONS
set autoindent                    " new lines inherit the indentation of previous lines
set tabstop=2                     " indent using two spaces
set shiftwidth=2                  " when shifting, indent using two spaces
set smarttab                      " insert 'tabstop' number of spaces when the 'tab' key is pressed
set expandtab                     " converts tabs to spaces
filetype indent on                " enable indentation rules that are file-type specific
set shiftround                    " when shifting lines, round the indentation to the nearest multiple of 'shiftwidth'

set undodir=~/.vim/undodir
set undofile

hi MatchTag ctermfg=black ctermbg=lightyellow guifg=black guibg=lightyellow

augroup commands
  autocmd!

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
  nnoremap <Leader>r :Rg<CR>
  nnoremap <Leader>h :History<CR>

  "cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>
  nnoremap <Leader>w :Ack!<C-R><C-W><cr>

  " barbar.nvim
  " Move to previous/next
  " Move to previous/next
  nnoremap <silent>    <A-,> :BufferPrevious<CR>
  nnoremap <silent>    <A-.> :BufferNext<CR>
  " Re-order to previous/next
  nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>    <A->> :BufferMoveNext<CR>
  " Goto buffer in position...
  nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  nnoremap <silent>    <A-9> :BufferLast<CR>
  " Pin/unpin buffer
  nnoremap <silent>    <A-p> :BufferPin<CR>
  " Close buffer
  nnoremap <silent>    <A-c> :BufferClose<CR>
  nnoremap <silent>    <Leader>gg :LazyGit<CR>

  " Disable arrow keys
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>
  inoremap <Up> <Nop>
  inoremap <Down> <Nop>
  inoremap <Left> <Nop>
  inoremap <Right> <Nop>
augroup END

if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

