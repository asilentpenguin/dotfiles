

" nvim only
if has('nvim')

	set ruler              " show the cursor position all the time
	set showcmd            " display incomplete commands

	" Don't use Ex mode, use Q for formatting
	noremap Q gq

	" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
	" so that you can undo CTRL-U after inserting a line break.
	inoremap <C-U> <C-G>u<C-U>

	" Switch syntax highlighting on
	syntax on

	" Also switch on highlighting the last used search pattern.
	set hlsearch

	" I like highlighting strings inside C comments.
	let c_comment_strings=1

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		autocmd!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		autocmd BufReadPost *
					\ if line("'\"") >= 1 && line("'\"") <= line("$") |
					\   execute "normal! g`\"" |
					\ endif

	augroup END

	" Convenient command to see the difference between the current buffer and the
	" file it was loaded from, thus the changes you made.
	" Only define it when not defined already.
	if !exists(":DiffOrig")
		command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
					\ | wincmd p | diffthis
	endif

endif
" nvim only


" start own config

"

let mapleader=" "

" nvim only?
if has('nvim')
	let g:python3_host_prog='C:/Python33/python'
	" let g:python3_host_prog='C:/Python36/python'
endif


if has('gui_running') || has('nvim')


" Plugins: vim-plug
call plug#begin()

" let g:ctrlp_working_path_mode = 'wra'   " nvim: active

" sessions / projects
Plug 'tpope/vim-obsession'
" Plug 'mhinz/vim-startify'

" very nice file browser
Plug 'scrooloose/nerdtree'
let g:NERDTreeCopyCmd="cp -r"

Plug 'vim-scripts/nerdtree-ack'
Plug 'mileszs/ack.vim'
let g:ackprg='rg -H --no-heading --vimgrep'
" let g:ackprg='ag --vimgrep'

" comments
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'

" ...?
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump = ''
Plug 'jiangmiao/auto-pairs'

"
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" snippets - optional:
Plug 'honza/vim-snippets'

" ...
Plug 'alvan/vim-closetag'
Plug 'gregsexton/matchtag'
" Plug 'vim-scripts/matchit.zip'

"
Plug 'mihaifm/bufstop'
" call BufstopSpeedToggle()
au GUIEnter * call BufstopSpeedToggle()   " gvim: active

" Plug 'fholgado/minibufexpl.vim'

"
" Plug 'moll/vim-bbye'

" ...
Plug 'bkad/camelcasemotion'

" ...
Plug 'terryma/vim-multiple-cursors'

" ...
" Plugin 'qpkorr/vim-bufkill'

" full path fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'wra'
let g:ctrlp_prompt_mappings = { 'PrtAdd("/")': ['<space>'], 'PrtAdd(" ")': ['/'] }
let g:ctrlp_root_markers = [ 'dist.git' ]

Plug 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" The Silver Searcher
" if executable('ag')
" ripgrep
if executable('rg')
	" Use ag over grep
	" set grepprg=ag\ --nogroup\ --nocolor
	set grepprg=rg\ -H\ --no-heading\ --vimgrep
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	" let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
	let g:ctrlp_user_command = 'rg --files %s'
	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0
	let g:ctrlp_use_caching = 1   " nvim only
	let g:ctrlp_clear_cache_on_exit = 0
endif

Plug 'mhinz/vim-grepper'
" runtime plugin/grepper.vim
let g:grepper = {}
let g:grepper.tools = ['rg', 'ag', 'ack', 'grep', 'findstr', 'git']
let g:grepper.next_tool = '<leader>g'
" nvim only: (1)
nnoremap <leader>g :Grepper<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)


" ...
Plug 'KabbAmine/zeavim.vim'
" Plug 'KabbAmine/zeavim.vim', {'on': [
" 		\	'Zeavim', 'Docset',
" 		\	'<Plug>Zeavim',
" 		\	'<Plug>ZVVisSelection',
" 		\	'<Plug>ZVKeyDocset',
" 		\	'<Plug>ZVMotion'
" 		\ ]}
let g:zv_zeal_executable = 'd:/usr/zeal/zeal.exe'
let g:zv_docsets_dir = 'd:/usr/zeal/docsets/'

" ...
" Plug 'vim-scripts/phpfolding.vim'
nmap <Leader>pf <Esc>:EnableFastPHPFolds<CR>
nmap <Leader>pF <Esc>:EnablePHPFolds<CR>
nmap <Leader>pdf <Esc>:DisablePHPFolds<CR>
" Plug 'swekaj/php-foldexpr.vim'
Plug 'shawncplus/phpcomplete.vim'

"
Plug 'jeetsukumaran/vim-markology'
let g:markology_enable = 0

"
if has('python3')
	Plug 'vim-vdebug/vdebug'
endif

"
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

"
Plug 'chrisbra/recover.vim'

"
Plug 'sjl/gundo.vim'

" Plug 'brettanomyces/nvim-terminus'

" ...
Plug 'godlygeek/tabular'

" ...
Plug 'plasticboy/vim-markdown'

"
Plug 'elzr/vim-json'

"
Plug 'vim-scripts/sql.vim--Stinson'
" Plug 'vim-scripts/SQLUtilities'

"
Plug 'rodjek/vim-puppet'

"
Plug 'chr4/nginx.vim'

"
Plug 'maksimr/vim-jsbeautify'

"
" Plug 'junegunn/rainbow_parentheses.vim'

"
" Plug 'ap/vim-css-color'

"
Plug 'tyru/open-browser.vim'
nmap <C-Cr> <Plug>(openbrowser-open)

" swap two windows
let g:windowswap_map_keys = 0
Plug 'wesQ3/vim-windowswap'
nnoremap <silent> <leader>W :call WindowSwap#EasyWindowSwap()<CR>

"
" Plug 'blueyed/vim-qf_resize'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
			\ '__' : '-',
			\ 'n'  : 'N',
			\ 'i'  : 'I',
			\ 'R'  : 'R',
			\ 'c'  : 'C',
			\ 'v'  : 'V',
			\ 'V'  : 'V-L',
			\ '' : 'V-B',
			\ 's'  : 'S',
			\ 'S'  : 'S',
			\ '' : 'S',
			\ }
let g:airline_section_b = '%{winnr()}%{airline#extensions#windowswap#get_status()}'
let g:airline_inactive_collapse=0
" " the next two lines seem to do nothing
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#windowswap#indicator_text = 'WS'

" one colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
let g:colors_name = 'falcon' | Plug 'fenetikm/falcon'
Plug 'felipesousa/rupza'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sindresorhus/focus', {'rtp': 'vim'}
Plug 'reedes/vim-thematic'
"
Plug 'felixhummel/setcolors.vim'

" Plug 'vim-scripts/HJKL'
" Plug 'mmisono/snake.vim'
" Plug 'uguu-org/vim-matrix-screensaver'

" Initialize Plug system
call plug#end()


endif   " if has('gui_running') || has('nvim')


"

set number

set tabstop=2
set shiftwidth=2

" autoread +
set autoread
" if has('nvim')
	autocmd FocusGained * silent! checktime   " nvim only
" endif

set undofile
set backup
if has('nvim')
	set undodir=~/.vim.nvim/.undo//
	set backupdir=~/.vim.nvim/.backup//
	set dir=~/.vim.nvim/.swap//
else

	set undodir=~/.vim.gvim/.undo//
	set backupdir=~/.vim.gvim/.backup//
	set dir=~/.vim.gvim/.swap//

	" tried and failed:
	" set undodir=d:/vim/gvim/undo//
	" set backupdir=d:/vim/gvim/backup//
	" set dir=d:/vim/gvim/swap//

	" tried and failed:
	" set undodir=c:/vim/gvim/undo//
	" set backupdir=c:/vim/gvim/backup//
	" set dir=c:/vim/gvim/swap//

	set noundofile

endif

" if has('nvim')
" 	set shell=bash   " nvim only
" endif
set shellslash

set ignorecase

set hlsearch
set incsearch

set encoding=utf-8
set fileformats=unix,dos

if &history < 10000
	set history=10000
endif

set laststatus=2

set wildmenu

" set listchars=eol:⏎,tab:\|\ ,
set listchars=eol:⏎,tab:»\ ,trail:·,nbsp:·

set list

set scrolloff=6

" set fillchars=vert:\|,fold:-,stlnc:_

set cursorline

set splitbelow
set splitright

set completeopt+=menuone
set infercase   " Try to adjust insert completions for case.

set hidden

set title

set showtabline=2

"
set tags=./.tags-y;,./.git/tags-y


" gvim only
augroup PHP
	" Clear all autocmd's in this group before running them again
	autocmd!

	" autocomplete
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP

	" Check for PHP syntax errors after saving a file
	" autocmd BufWritePost {*.php} echom system("php -l ".expand('%'))

	" autocmd BufEnter *.html :setlocal filetype=php

augroup END
" gvim only

" autocomplete
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP   " nvim only?  (gvim uses it in an `augroup`)

" nvim only
" Quickfix is always bottom, on its own 'row'
autocmd FileType qf wincmd J
" Quickfix - alternative to <CR>
" autocmd FileType qf nmap <buffer> o :let g:MyQfLine = line('.')<CR>:wincmd p<CR>:exe("cc " . g:MyQfLine)<CR>
" Quickfix - fix [attempt] for <CR>
autocmd FileType qf nmap <buffer> <CR> :let g:MyQfLine = line('.')<CR>:wincmd p<CR>:exe("cc " . g:MyQfLine)<CR>


"
nnoremap =+ =i}


"
inoremap jk <Esc>

" save
nnoremap <C-s> :w<CR>
nnoremap <CR> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" comment
nnoremap <Leader>q :TComment<CR>
vnoremap <Leader>q :TComment<CR>
" nnoremap <Leader>q :Commentary<CR>
" vnoremap <Leader>q :Commentary<CR>

"
nnoremap <leader>g :Grepper<cr>

" move line(s)
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

"
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>
map <C-h> <C-w><C-h>
nmap <Leader>r <C-w>p

"
nmap <silent> <A-1> :setlocal foldlevel=0<CR>
nmap <silent> <A-2> :setlocal foldlevel=1<CR>
nmap <silent> <A-3> :setlocal foldlevel=2<CR>
nmap <silent> <A-4> :setlocal foldlevel=3<CR>
nmap <silent> <A-5> :setlocal foldlevel=4<CR>
nmap <silent> <A-6> :setlocal foldlevel=5<CR>
nmap <silent> <A-7> :setlocal foldlevel=6<CR>
nmap <silent> <A-8> :setlocal foldlevel=7<CR>
nmap <silent> <A-9> :setlocal foldlevel=8<CR>
nmap <silent> <A-0> :setlocal foldlevel=99<CR>

nmap <Leader>pf <Esc>:EnableFastPHPFolds<CR>
nmap <Leader>pF <Esc>:EnablePHPFolds<CR>
nmap <Leader>pdf <Esc>:DisableFastPHPFolds<CR>

"
" nnoremap <silent> <c-w>= :wincmd =<cr>:QfResizeWindows<cr>

"
vnoremap // y/<C-R>"<CR>

"
vnoremap < <gv
vnoremap > >gv

"
nnoremap <silent> <C-S-tab> :tabprevious<CR>
nnoremap <silent> tp :tabprevious<CR>
nnoremap <silent> <C-tab> :tabnext<CR>
nnoremap <silent> tn :tabnext<CR>
let g:lasttab = 1 | nmap <silent> <Leader>a :exe "tabn ".g:lasttab<CR> | au TabLeave * let g:lasttab = tabpagenr()

"
map <silent> <Leader>l :redraw!<CR>

"
map <silent> <Leader>t :NERDTreeToggle<CR>
map <silent> <Leader>T :NERDTreeFind<CR>

"
nmap <Leader>d yyP
vmap <Leader>d yP

"
nmap <silent> <Leader>` <C-^>
"
" ; use `exe` to prevent trailing whitespace
exe "nmap <silent> <Leader><Tab> :ls<CR>:b "
nmap <silent> <Leader>b :BufstopFast<CR>

"
map <silent> <Leader>w <Plug>CamelCaseMotion_w
map <silent> <Leader>B <Plug>CamelCaseMotion_b

"
nnoremap <silent> <Space> :noh<CR>:<backspace>

" Copy file path to system clipboard
nnoremap <silent> <Leader>cp :let @+=expand("%:p")<CR>

" Switch &shell: cmd|bash
nnoremap <silent> <Leader>s :let &shell=eval("(&shell == 'cmd' ? 'bash' : 'cmd')")<CR>

"
nnoremap <silent> <Leader>E :set expandtab!<CR>

"
nnoremap <silent> <Leader>L :set list!<CR>

:nnoremap <silent> <F7> "=strftime("%A, %B %d, %Y, %H:%M") . printf(" - %.2f%%", str2float(strftime("%j")) / 365 * 100)<CR>P
:inoremap <silent> <F7> <C-r>=strftime("%A, %B %d, %Y, %H:%M") . printf(" - %.2f%%", str2float(strftime("%j")) / 365 * 100)<CR>

" F5 in command-line window: run and return to the same line
autocmd CmdwinEnter * nnoremap <buffer> <F5> :let g:CmdWindowLineMark=line(".")<CR><CR>q::execute "normal ".g:CmdWindowLineMark."G"<CR>

" neovim :terminal
if has('nvim')
	" Make escape work in the Neovim terminal.
	tnoremap <Esc> <C-\><C-n>

	" Make navigation into and out of Neovim terminal splits nicer.
	tnoremap <C-h> <C-\><C-N><C-w>h
	tnoremap <C-j> <C-\><C-N><C-w>j
	tnoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <C-l> <C-\><C-N><C-w>l

	" I like relative numbering when in normal mode.
	autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

	" Prefer Neovim terminal insert mode to normal mode.
	autocmd BufEnter term://* startinsert
endif


" utils
function! LoadSession()
	let g:LoadSessionFilePath = fnamemodify(input('Session file: ', '~/Documents/editor.sessions/vim/', 'file'), ':p')
	set titlestring=%{fnamemodify(g:LoadSessionFilePath,\":t:r\")}:\ %t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
	exec 'source ' . g:LoadSessionFilePath
endfunction
command! LoadSession call LoadSession()

function! DeleteInactiveBufs()
	"From tabpagebuflist() help, get a list of all buffers in all tabs
	let tablist = []
	for i in range(tabpagenr('$'))
		call extend(tablist, tabpagebuflist(i + 1))
	endfor
	let nWipeouts = 0
	for i in range(1, bufnr('$'))
		if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
			"bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
			silent exec 'bwipeout' i
			" echom bufname(i)
			let nWipeouts = nWipeouts + 1
		endif
	endfor
	echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()


" looks
" moved to ginit.vim

au GUIEnter * simalt ~x

