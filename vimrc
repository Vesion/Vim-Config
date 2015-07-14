
" Vundle and plugins load start ---------- {{{

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" local test plugins
" Plugin 'file:///Users/Xiang/Workspace/Vim/xx'

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


call vundle#end()
filetype plugin indent on

" Vundle and plugins load end }}}

" Non-plugin stuff start ---------- {{{

" Vimscript autocommand settings ---------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Vim common config ---------- {{{

colorscheme molokai 
set guioptions-=r
set guioptions-=L

syntax on

let mapleader=","

set encoding=utf-8

set number
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
set smartcase
set incsearch
set nohlsearch

" }}}

" Vim maps ---------- {{{

" edit and save vimrc handily
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" get back to normal mode when in insert mode swiftly
inoremap jk <esc>
inoremap <esc> <nop>

" forbid direction keys
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>

inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>

" switch between windows
nnoremap <tab><tab> <c-w>W:cd %:p:h<cr>:<cr>

" close window
nnoremap <esc><esc> :q<cr>
nnoremap <c-esc> :wq<cr>
nnoremap <leader><esc><esc> :q!<cr>

" save/load session
nnoremap <leader>s :mksession! ~/.vimsession<cr>
nnoremap <leader>l :source ~/.vimsession<cr>

" put the cursor on the column of a mark
nnoremap ' `

"}}}

" Non-plugin stuff end }}}

" Plugin stuff start ---------- {{{

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

" Plugin stuff end }}}

" Compile tool functions start ---------- {{{

function! CompileRunGcc()
    execute "w"
    execute "!gcc -std=c99 % -o %<"
    execute "! ./%<"
endfunction
nnoremap <f5> :call CompileRunGcc()<cr>

function! CompileRunGpp()
    execute "w"
    execute "!g++ -std=c++11 % -o %<"
    execute "! ./%<"
endfunction
nnoremap <f6> :call CompileRunGpp()<cr>

function! CompileRunPython()
    execute "w"
    execute "!python %"
endfunction
nnoremap <f7> :call CompileRunPython()<cr>

" Compile tool functions end }}}
