scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.
call pathogen#infect()

syntax on
set hlsearch
if isdirectory(expand("$VIMRUNTIME/ftplugin"))
    filetype plugin on
    filetype indent on
endif
set wildmenu
set wildmode=longest:full"
"set wildmode=list:longest"
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set scrolloff=10
set t_Co=256
colorscheme herald
set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set showmatch
set ignorecase
set viminfo='20,\"500   " Keep a .viminfo file.
set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set showcmd
set smartindent
set incsearch
set modeline
set linebreak
set wrap
set relativenumber 
" Don't use Ex mode, use Q for formatting
map Q gq
" When doing tab completion, give the following files lower priority. You may
" wish to set 'wildignore' to completely ignore files, and 'wildmenu' to enable
" enhanced tab completion. These can be done in the user vimrc file.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
filetype plugin on
filetype indent on
if v:version >= 700
	set numberwidth=3
endif

" encoding
if &fileencodings !~? "ucs-bom"
	set fileencodings^=ucs-bom
endif
if &fileencodings !~? "utf-8"
	let g:added_fenc_utf8 = 1
	set fileencodings+=utf-8
endif
if &fileencodings !~? "default"
	set fileencodings+=default
endif

"  Terminal fixes
if &term ==? "xterm"
	set t_Sb=^[4%dm
	set t_Sf=^[3%dm
	set ttymouse=xterm2
endif
if &term ==? "gnome" && has("eval")
	exec "set <C-Left>=\eO5D"
	exec "set <C-Right>=\eO5C"
endif
if "" == &shell
	if executable("/bin/bash")
		set shell=/bin/bash
	elseif executable("/bin/sh")
		set shell=/bin/sh
	endif
endif
if has("eval")
	let is_bash=1
endif

" persistant undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Source the vimrc file after saving it
autocmd! bufwritepost ~/.vim/vimrc source $MYVIMRC
" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :
