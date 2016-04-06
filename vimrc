"from the pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin indent on

"Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

"from the solarized plugin
if has('gui_running')
	set background=light
else
	set background=dark
endif

colorscheme solarized

set number
set showcmd
set wildmenu
set lazyredraw
set showmatch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set smarttab

set incsearch
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10
"set foldmethod=indent
set foldmethod=syntax

""YCM bindings
"let g:ycm_filetype_whitelist = {
"      \ 'cpp' : 1,
"      \ 'sh' : 1,
"      \ 'python' : 1
"      \}
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
	let snippet = UltiSnips#ExpandSnippetOrJump()
	if g:ulti_expand_or_jump_res > 0
		return snippet
	else
		return "\<CR>"
	endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"from fugitive http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"show invisible characters:
set list
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"from http://vimcasts.org/episodes/undo-branching-and-gundo-vim/ and
"http://sjl.bitbucket.org/gundo.vim/#installation
nnoremap <F5> :GundoToggle<CR>


"for vimtex
let maplocalleader = ","
