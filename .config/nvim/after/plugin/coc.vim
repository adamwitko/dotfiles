hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

let g:coc_global_extensions=[ 'coc-tsserver', 'coc-css', 'coc-prettier', 'coc-json', 'coc-lists', 'coc-snippets', 'coc-vetur', 'coc-go', 'coc-flow' ]

augroup coc
	autocmd!
	" https://github.com/neoclide/coc.nvim#example-vim-configuration
	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
	" Coc only does snippet and additional edit on confirm.
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	inoremap <silent><expr> <c-space> coc#refresh()

	" gd - go to definition of word under cursor
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gtd <Plug>(coc-type-definition)

	" gi - go to implementation
	nmap <silent> gi <Plug>(coc-implementation)

	" gr - find references
	nmap <silent> gr <Plug>(coc-references)

	" K - get hint on whatever's under the cursor
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if &filetype == 'vim'
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

	nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
	nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

	" List errors
	nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

	" list commands available in tsserver (and others)
	nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>

	" restart when tsserver gets wonky
	nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

	" manage extensions
	nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

	" rename the current word in the cursor
	nmap <leader>cr  <Plug>(coc-rename)
  " Fix current line
  nmap <leader>cf  <Plug>(coc-fix-current)

	" run code actions
	vmap <leader>ca  <Plug>(coc-codeaction-selected)
	nmap <leader>ca  <Plug>(coc-codeaction-selected)

  " Traverse through errors
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
augroup END
