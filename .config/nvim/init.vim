set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.local/share/nvim/plugged')

" Plugins
"
" Linting/Fixing
"Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
" Javascript
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'commit': '10a93d8ebd8524418479c4e4814d45ddc5d360ef' }
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
" fzf is required as a binary install on the host machine https://github.com/junegunn/fzf/wiki/Windows
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Npm
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
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
let g:deoplete#enable_at_startup = 1

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
set tabstop=2 shiftwidth=2
set softtabstop=2
set noshowmode " hide default command bar at bottomn
set autoread " reload files on disk change


hi MatchTag ctermfg=black ctermbg=lightyellow guifg=black guibg=lightyellow

augroup commands
	autocmd!
	" Command maps
	"
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

	" <F5> Toggle Undotree
	nnoremap <F5> :UndotreeToggle<cr>

	"cnoreabbrev Ack Ack!
	nnoremap <Leader>a :Ack!<Space>
augroup END

if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" neoformatter
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:standard_prettier_settings={
              \ 'exe': 'prettier',
              \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--prose-wrap', 'always'],
              \ 'stdin': 1,
              \ }

let g:standard_tslint_settings={
        \ 'exe': 'tslint',
        \ 'args': ['--fix', '-c tslint.json'],
        \ 'replace': 1
        \ }

let g:neoformat_typescriptreact_prettier=g:standard_prettier_settings
let g:neoformat_enabled_typescriptreact=['prettier']

let g:neoformat_typescript_prettier=g:standard_prettier_settings
let g:neoformat_enabled_typescript=['prettier']

let g:neoformat_javascript_prettier=g:standard_prettier_settings
let g:neoformat_enabled_javascript=['prettier']

let g:neoformat_enabled_vue=['prettier']

let g:neoformat_markdown_prettier = g:standard_prettier_settings
let g:neoformat_enabled_markdown = ['prettier']

let g:neoformat_json_prettier = g:standard_prettier_settings
let g:neoformat_enabled_json = ['prettier']

let g:neoformat_scss_prettier = g:standard_prettier_settings
let g:neoformat_enabled_scss = ['prettier']

let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
set list

let g:netrw_banner = 0
let g:netrw_liststyle = 3
