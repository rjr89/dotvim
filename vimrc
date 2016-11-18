"from the pathogen plugin
execute pathogen#infect()
set nocompatible
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
set relativenumber
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

set modifiable
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
set listchars=tab:▸\ ,eol:¬,space:·

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

"for Nvim-R
let r_syntax_folding = 1 
let R_assign = 0


" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <C-e> <C-o>$

let g:vimwiki_folding='expr'


" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Set region to American English
set spelllang=en_us

nnoremap <leader>b :ls<cr>:b<space>
