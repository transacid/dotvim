scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.
call pathogen#infect()

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
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTree<CR>
" Source the vimrc file after saving it
autocmd! bufwritepost ~/.vim/vimrc source $MYVIMRC
" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :
