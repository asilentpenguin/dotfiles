
" if filereadable(expand("$VIM/_vimrc"))
" 	so $VIM/_vimrc
" endif


if has('gui_running')

	set guifont=Anonymice_Powerline:h11

	" set guifont=Consolas:h10

	set linespace=0
	" set linespace=-1


	" Removes the menubar.
	set guioptions -=m
	" Removes the toolbar.
	set guioptions -=T
	" Removes the left+right-hand scroll bars
	set guioptions -=L
	set guioptions -=r
	" Use text drawing for tabs
	set guioptions-=e

let b:colorscheme = get(g:, 'colors_name', 'default')
if b:colorscheme == 'default'
	" colorscheme rdark
	" colorscheme min
	" colorscheme oxeded
	" colorscheme hilal # ?
	" colorscheme herokudoc-gvim
	colorscheme summerfruit
	" colorscheme anderson
	" hi SpecialKey guifg=#496054 guibg=#262422
	" hi SpecialKey guifg=#334036 guibg=#262422
	" hi SpecialKey guifg=#445248 guibg=#262422
	" hi SpecialKey guifg=#7ba092 guibg=#262422
	" hi SpecialKey guifg=#333333 guibg=#262422
	" colorscheme PaperColor
	" colorscheme molokai
	" colorscheme solarized8_dark_high

	let g:airline_theme = 'serene'
	" " let g:airline_theme = 'powerlineish'
	" " let g:airline_theme = 'solarized'
	" " let g:airline_theme = 'papercolor'
	" " let g:airline_theme = 'badwolf'
endif

	" start maximized
	au GUIEnter * simalt ~x

	" [https://github.com/derekmcloughlin/gvimfullscreen_win32]: copy gvimfullscreen.dll to the directory that has gvim.exe
	map <F11> <Esc>:call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>

endif   " if has('gui_running')


if has('nvim')

	map <silent> <F11>   <Esc>:call GuiWindowFullScreen(1)<CR>
	map <silent> <S-F11> <Esc>:call GuiWindowFullScreen(0)<CR>

	GuiTabline 0

	GuiFont! Anonymice Powerline:h11
	" GuiFont! DejaVu Sans Mono:h10
	" GuiFont! Source Code Pro:h10

	" GuiFont Consolas:h10
	" GuiFont Ubuntu Mono derivative Powerline:h9
	" GuiFont Inconsolata:h11
	" GuiFont Monofur for Powerline:h11
	" GuiFont NovaMono for Powerline:h9
	" GuiFont D2Coding for Powerline:h11
	" GuiFont Fira Mono for Powerline:h10

	GuiLinespace 0

	" diacritics test: Să vezi și să nu crezi, îți spun întâi / Șah îți dă întâi șui

	"
	" colorscheme iceberg
	colorscheme behelit
	" colorscheme underwater-mod
	set background=dark

	" hi link MBEVisibleChanged Error

	" colorscheme Benokai
	" colorscheme nord
	" colorscheme PaperColor
	" let g:nord_italic_comments = 1
	" colorscheme molokai
	" colorscheme wombat, znake, tangoshady, ...
	" colorscheme solarized8_dark_high
	" set background=light

	" let g:airline_theme = 'behelit'
	" let g:airline_theme = 'jellybeans'
	" let g:airline_theme = 'molokai'
	" let g:airline_theme = 'nord'
	" let g:airline_theme = 'powerlineish'
	" let g:airline_theme = 'solarized'
	" let g:airline_theme = 'papercolor'


	" start maximized
	" au GUIEnter * simalt ~x


	call BufstopSpeedToggle()
	" au GUIEnter * call BufstopSpeedToggle()

endif

