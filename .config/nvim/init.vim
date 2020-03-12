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
" Status bar
Plug 'bling/vim-airline'
" Grep
Plug 'mileszs/ack.vim'
" File navigation
Plug 'junegunn/fzf' "installs the binary
Plug 'junegunn/fzf.vim'
" Colorschemes
Plug 'morhetz/gruvbox'
" Markdown
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
" Vue, handlebars, and other front-end dev
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Valloric/MatchTagAlways'
" NERDTree file explorer
Plug 'preservim/nerdtree'
call plug#end()

" Custom settings
"
if has('win32') || has('win64')
	let g:python3_host_prog = 'C:\Python38'
endif

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1

set nocompatible
syntax enable
filetype plugin on

set number " show line numbers
set ruler " show where you are
set showmatch
set ignorecase " case-insensitive search
set clipboard=unnamedplus " yank and pase with system clipboard
set background=dark
colorscheme gruvbox
set updatetime=200
set hlsearch
set expandtab
set tabstop=2 shiftwidth=2
set softtabstop=2
set noshowmode " hide default command bar at bottomn
set autoread " reload files on disk change
set list
set path+=** " Allow recursive search when using commands such as :find, gf,
set noswapfile

hi MatchTag ctermfg=black ctermbg=lightyellow guifg=black guibg=lightyellow

augroup commands
	autocmd!
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

	" <C-p>: Open file
	nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

	"cnoreabbrev Ack Ack!
	nnoremap <Leader>a :Ack!<Space>
augroup END

augroup nerdtree
  autocmd!

  " Allows closing of VIM if NERDTree is the only window left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  nnoremap <C-e> :NERDTreeToggle<CR>
augroup END
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3
