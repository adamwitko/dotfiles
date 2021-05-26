set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.local/share/nvim/plugged')

" Plugins
" Conquer of Completion that has extensions for TSness
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Scala Metal
Plug 'scalameta/metals'
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
" Status bar
Plug 'bling/vim-airline'
" Grep
Plug 'mileszs/ack.vim'
" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "installs the binary
Plug 'junegunn/fzf.vim'
" Colorschemes
Plug 'rakr/vim-one'
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
Plug 'jparise/vim-graphql'

call plug#end()

" Custom settings
"
if has('win32') || has('win64')
	let g:python3_host_prog = 'C:\Python38'
endif

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

set nocompatible
syntax enable
filetype plugin on

set number " show line numbers
set ruler " show where you are
set showmatch
set ignorecase " case-insensitive search
set clipboard=unnamedplus " yank and pase with system clipboard

let g:one_allow_italics = 1 " I love italic for comments
let g:airline_theme='one'
colorscheme one
set background=dark

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

set updatetime=200
set hlsearch    " Search highlighting
set ignorecase  " Ignore case when searching
set smartcase  " Smart case switching if search term contains uppercase
set expandtab
set tabstop=2 shiftwidth=2
set softtabstop=2
set noshowmode " hide default command bar at bottomn
set autoread " reload files on disk change
set list
set path+=** " Allow recursive search when using commands such as :find, gf,
set noswapfile
set cursorline

hi MatchTag ctermfg=black ctermbg=lightyellow guifg=black guibg=lightyellow

augroup commands
	autocmd!
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

	" <C-p>: Open file
	nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
  nnoremap <Leader>r :Rg<CR>
  nnoremap <Leader>h :History<CR>

  nnoremap <Leader>b :Buffers<CR>
  nnoremap <C-b>n :bn<CR>
  nnoremap <C-b>p :bp<CR>

	"cnoreabbrev Ack Ack!
	nnoremap <Leader>a :Ack!<Space>
  nnoremap <Leader>w :Ack!<C-R><C-W><cr>
augroup END

if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3

