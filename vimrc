" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

Plugin 'Valloric/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required


" Other settings
syntax on

let mapleader=","

set encoding=utf-8

set nu

set cursorline
set cursorcolumn

set showcmd
set showmode
set wildmenu

set nowrap

set laststatus=2

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set autoindent
set smartindent
set cindent

set backspace=2
set whichwrap+=<,>,h,l

set nobackup
set nowritebackup
set noswapfile

set noerrorbells
set novisualbell

set mouse=a 
set selection=exclusive 
set selectmode=mouse,key

set showmatch
set matchtime=5
set ignorecase
set incsearch
set nohlsearch

colorscheme molokai 

map <Tab><Tab> <C-W>W:cd %:p:h<CR>:<CR>

" NERDTree Config
map <F1> :NERDTreeToggle<CR>

" TagBar Config
nmap <F8> :TagbarToggle<CR>

" rainbow_parentheses Config
map <c-p> :RainbowParenthesesToggleAll<CR>

" PowerLine Config
let g:Powerline_symbols = 'fancy'

" nerdcommenter Config
" <leader>cc comment on
" <leader>cu uncomment

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_cpp_compiler             = 'clang++'
let g:syntastic_cpp_compiler_options     = ' -std=c++11 -stdlib=libc++'

" YCM Config                    
let g:ycm_confirm_extra_conf = 0
map <leader>gd :YcmCompleter GoToDefinition<CR>
map <leader>gc :YcmCompleter GoToDeclaration<CR>


" Compile tool functions
func! CompileRunGcc()
    exec "w"
    exec "!gcc -std=c99 % -o %<"
    exec "! ./%<"
endfunc
nmap <F5> :call CompileRunGcc()<CR>

func! CompileRunGpp()
    exec "w"
    exec "!g++ -std=c++11 % -o %<"
    exec "! ./%<"
endfunc
nmap <F6> :call CompileRunGpp()<CR>

func! CompileRunPython()
    exec "w"
    exec "!python %"
endfunc
