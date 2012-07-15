scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.
call pathogen#infect

syntax on
set hlsearch
if isdirectory(expand("$VIMRUNTIME/ftplugin"))
    filetype plugin on
    filetype indent on
endif
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set scrolloff=10
set t_Co=256
colorscheme herald
set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set showcmd
set smartindent
set incsearch
set modeline
filetype plugin on
filetype indent on
" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost ~/.vimrc source $MYVIMRC
endif
" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :
