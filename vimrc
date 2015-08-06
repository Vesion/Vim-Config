
" Vundle and plugins load start ---------- {{{

set nocompatible
filetype off

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
" augment the parentheses matching with colors
Plugin 'kien/rainbow_parentheses.vim'

" vim script library, provide commands and functions
Plugin 'L9'

" a git wrapper
Plugin 'tpope/vim-fugitive'
" comment utility
Plugin 'scrooloose/nerdcommenter'
" easily add, delete and change surroundings like () [] or tags
Plugin 'tpope/vim-surround'
" augment '.' repeat
Plugin 'tpope/vim-repeat'
" automatic closing of surroundings
Plugin 'Raimondi/delimitMate'
" a replacement for grep
Plugin 'mileszs/ack.vim'
" true Sublime Text style multiple selections for Vim 
Plugin 'terryma/vim-multiple-cursors'
" a simple way to use motions
Plugin 'easymotion/vim-easymotion'

" define own text object
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'bps/vim-textobj-python'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'Vesion/vim-textobj-restline'
Plugin 'Vesion/vim-textobj-surrounding'

" a tool for drawing some patterns 
Plugin 'DrawIt'
"a tool for drawing ascii art text
Plugin 'Figlet.vim'

" syntastic check
Plugin 'scrooloose/syntastic'
" great but complicated utility for auto-completion
Plugin 'Valloric/YouCompleteMe'

" local test plugins
"Plugin 'file:///Users/Xiang/Workspace/Vim/xx'
"Plugin 'file:///Users/Xiang/Workspace/Vim/vim-textobj-restline'
"Plugin 'file:///Users/Xiang/Workspace/Vim/vim-textobj-surrounding'


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
set selectmode=mouse,key
" for multiple-cursors plugin available in macvim
set selection=inclusive 

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

" get back to normal mode swiftly
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

" move lines up and down
nnoremap <c-j> :m .+1<cr>==
nnoremap <c-k> :m .-2<cr>==
inoremap <c-j> <esc>:m .+1<cr>==gi
inoremap <c-k> <esc>:m .-2<cr>==gi
vnoremap <c-j> :m '>+1<cr>gv=gv
vnoremap <c-k> :m '<-2<cr>gv=gv

" switch between windows
nnoremap <tab><tab> <c-w>W:cd %:p:h<cr>:<cr>

" close window
nnoremap <esc><esc> :q<cr>
nnoremap <c-esc> :wq<cr>
nnoremap <leader><esc><esc> :q!<cr>

" save/load session
nnoremap <leader>ss :mksession! ~/.vimsession<cr>
nnoremap <leader>ls :source ~/.vimsession<cr>

" put the cursor on the column of a mark
nnoremap ' `

" go to the alternate file
nnoremap g3 :e#<cr>

"}}}

" Non-plugin stuff end }}}

" Plugin stuff start ---------- {{{

" NERDTree Config
nnoremap <f1> :execute ":NERDTreeToggle " . expand('%:p:h')<cr>

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

" quick Ack! with tex object
nnoremap <leader>k :set operatorfunc=AckOperator<cr>g@
vnoremap <leader>k :<c-u>call AckOperator(visualmode())<cr>

function! AckOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]ly
    else
        return
    endif
    silent execute "Ack! " . shellescape(@@) . ' ' . expand('%:p:h')
    let @@ = saved_unnamed_register
endfunction

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

function! CompileRun()
    execute 'w'
    let c_ft = &filetype
    if c_ft ==? 'c'
        execute '!gcc -std=c99 % -o %<'
        execute '! %<'
    elseif c_ft ==? 'cpp'
        execute '!g++ -std=c++11 % -o %<'
        execute '! %<'
    elseif c_ft ==? 'python'
        execute '!python %'
    elseif c_ft ==? 'scheme'
        execute '!gosh %'
    endif
endfunction
nnoremap <f5> :call CompileRun()<cr>

" Compile tool functions end }}}
