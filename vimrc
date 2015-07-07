" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" color theme
Plugin 'tomasr/molokai'
" statusline utility 
Plugin 'bling/vim-airline'
" show a small vertical line when tap indent
Plugin 'Yggdroot/indentLine'
" directory and file tree
Plugin 'scrooloose/nerdtree'
" ctag based utility
Plugin 'majutsushi/tagbar'

" vim script library, provide commands and functions
Plugin 'L9'
" a git wrapper
Plugin 'tpope/vim-fugitive'

" comment utility
Plugin 'scrooloose/nerdcommenter'
" augment the parentheses matching with colors
Plugin 'kien/rainbow_parentheses.vim'
" easily add, delete and change surroundings like () [] or tags
Plugin 'tpope/vim-surround'
" augment '.' repeat
Plugin 'tpope/vim-repeat'
" automatic closing of surroundings
Plugin 'Raimondi/delimitMate'
" a replacement for grep
Plugin 'mileszs/ack.vim'
" define own text object
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'

" syntastic check
Plugin 'scrooloose/syntastic'
" great but complicated utility for auto-completion
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

" edit vimrc handily
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" forbid direction keys
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>

colorscheme molokai 

" switch between windows
nnoremap <tab><tab> <c-w>W:cd %:p:h<cr>:<cr>

" close window
nnoremap <esc><esc> :q<cr>
nnoremap <c-esc> :wq<cr>
nnoremap <leader><esc><esc> :q!<cr>

" save/load session
nnoremap <leader>s :mksession! ~/.vimsession<cr>
nnoremap <leader>l :source ~/.vimsession<cr>

" NERDTree Config
nnoremap <f1> :NERDTreeToggle<cr>

" TagBar Config
nnoremap <f8> :TagbarToggle<cr>

" rainbow_parentheses Config
nnoremap <c-p> :RainbowParenthesesToggleAll<cr>

" airline Config
let g:airline_powerline_fonts = 1
" codes below is for macvim airline
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
endif

" nerdcommenter mappings 
" <leader>cc comment on
" <leader>cu uncomment

" vim-surround mappings, take [ok] for instance
" cs['      change [] to ''              'ok'
" cs'<i>    change '' to <i></i>         <i>ok</i>
" cst[      change <i></i> to []         [ok]
" ds[       delete []                    ok
" yss]      add []                       [ok]

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
nnoremap <leader>gd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<cr>


" Compile tool functions
func! CompileRunGcc()
    exec "w"
    exec "!gcc -std=c99 % -o %<"
    exec "! ./%<"
endfunc
nnoremap <f5> :call CompileRunGcc()<cr>

func! CompileRunGpp()
    exec "w"
    exec "!g++ -std=c++11 % -o %<"
    exec "! ./%<"
endfunc
nnoremap <f6> :call CompileRunGpp()<cr>

func! CompileRunPython()
    exec "w"
    exec "!python %"
endfunc
nnoremap <f7> :call CompileRunPython()<cr>
