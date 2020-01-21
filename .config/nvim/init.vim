set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.local/share/nvim/plugged')

" Plugins
" Conquer of Completion that has extensions for TSness
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
call plug#end()

" Custom settings
"
if has('win32') || has('win64')
	let g:python3_host_prog = 'C:\Python38'
endif

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1

syntax enable " syntax highlighting
syntax on
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

hi MatchTag ctermfg=black ctermbg=lightyellow guifg=black guibg=lightyellow

augroup commands
	autocmd!
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

	" <C-p>: Open file
	"nnoremap <C-p> :Files<Cr>
	nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

	" <C-f>: Fix suggest
	nnoremap <C-f> :TSGetCodeFix
	" <F12>: Go to Typescript Definition
	nnoremap <F12> :TSDef<CR>
	" <S-f>: Show all references
	"nnoremap <S-f> :TSRefs<CR>

	"cnoreabbrev Ack Ack!
	nnoremap <Leader>a :Ack!<Space>
augroup END

if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3
