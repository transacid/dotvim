scriptencoding utf-8
set encoding=utf-8
" ^^ Please leave the above line at the start of the file.

syntax on
set hlsearch

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'mattn/emmet-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'davidhalter/jedi-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'sjl/badwolf'
Plugin 'chrisbra/csv.vim'
Plugin 'blueshirts/darcula'
Plugin 'tpope/vim-fugitive'
Plugin 'deb.vim'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

set wildmenu
"set wildmode=list:longest,full
"set wildmode=list:longest"
set wildmode=longest:full,full
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set scrolloff=10
set t_Co=256
"colorscheme herald
colorscheme darcula
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
set expandtab
set tabstop=4
set shiftwidth=4
set showcmd
set title
set smartindent
set incsearch
set modeline
set linebreak
set wrap
"set textwidth=72
" paste in X11
set cb=unnamed
set autoread
set number
set noswapfile
let mapleader = ","
set mouse=ni

set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

if v:version > 704 || (v:version == 704 && has("patch338"))
  set breakindent
endif

let g:miniBufExplForceSyntaxEnable = 1

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

" number toggles
nnoremap <F2> :set nonumber!<CR>
nnoremap <F3> :set norelativenumber!<CR>

if version >=703
set relativenumber
" persistant undo
set undodir=$HOME/.vim/undodir " where to save undo histories
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
endif

" remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" save with sudo
noremap <Leader>W :w !sudo tee % > /dev/null
" Source the vimrc file after saving it
autocmd! bufwritepost ~/.vim/vimrc nested :source ~/.vim/vimrc
" vim: set fenc=utf-8 tw=80 sw=4 sts=4 et foldmethod=marker :
