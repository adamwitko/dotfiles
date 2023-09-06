hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

let g:coc_global_extensions=[ 'coc-tsserver', 'coc-css', 'coc-prettier', 'coc-json', 'coc-lists', 'coc-snippets', 'coc-vetur', 'coc-flow', 'coc-git', 'coc-svelte', 'coc-highlight', 'coc-explorer', 'coc-emmet', 'coc-pairs']

augroup coc
	autocmd!
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Show all diagnostics.
  nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>

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
  nmap <silent> <c-space> <Plug>(coc-codeaction-line)

  " Traverse through errors
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  nnoremap <space>e :CocCommand explorer<CR>

augroup END
