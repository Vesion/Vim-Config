
" Vundle and plugins load start ---------- {{{

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" color theme
Plugin 'tomasr/molokai'
" an enhanced cpp highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
" enhance statusline
Plugin 'bling/vim-airline'
" show a small vertical line when tap indent
Plugin 'Yggdroot/indentLine'
" directory and file tree
Plugin 'scrooloose/nerdtree'
" ctag based utility
Plugin 'majutsushi/tagbar'
" add a sign to bookmark
Plugin 'kshenoy/vim-signature'

" comment utility
Plugin 'scrooloose/nerdcommenter'
" easily add, delete and change surroundings like () [] or tags
Plugin 'tpope/vim-surround'
" enhance '.' repeat
Plugin 'tpope/vim-repeat'
" automatic closing of surroundings
Plugin 'Raimondi/delimitMate'
" true Sublime Text style multiple selections for Vim 
Plugin 'terryma/vim-multiple-cursors'
" a simple way to use motions
Plugin 'easymotion/vim-easymotion'
" a powerful file finder
Plugin 'kien/ctrlp.vim'
" a snippet engine, ultimate
Plugin 'SirVer/ultisnips'
" snippets
Plugin 'Vesion/vim-snippets'

" define own text object
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'bps/vim-textobj-python'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'gcmt/wildfire.vim'

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

" for saving folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" }}}

" Vim common config ---------- {{{

colorscheme molokai 
set guioptions-=r
set guioptions-=L

syntax on

set encoding=utf-8

set autoread

set lazyredraw

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

set pastetoggle=<F2>

" }}}

" Vim maps ---------- {{{

" define the <leader> key
let mapleader=";"

" edit and save vimrc handily
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" let's fly
inoremap jk <esc>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" forward delete
inoremap <c-d> <esc>lxi

" ^ and $ 
noremap - ^
noremap + $

" yank and paste with + register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" jump between pairs
nnoremap <leader>m %

" use ALT+jk to move lines up and down
nnoremap <c-j> :m .+1<cr>==
nnoremap <c-k> :m .-2<cr>==
inoremap <c-j> <esc>:m .+1<cr>==gi
inoremap <c-k> <esc>:m .-2<cr>==gi
vnoremap <c-j> :m '>+1<cr>gv=gv
vnoremap <c-k> :m '<-2<cr>gv=gv

" switch between windows
nnoremap <tab><tab> <c-w><c-w>
nnoremap <tab>h <c-w><c-h>
nnoremap <tab>j <c-w><c-j>
nnoremap <tab>k <c-w><c-k>
nnoremap <tab>l <c-w><c-l>

" close window
nnoremap <esc><esc> :q<cr>
nnoremap <leader><esc><esc> :q!<cr>

" save/load session
nnoremap <leader>ss :mksession! ~/.vimsession<cr>
nnoremap <leader>es :source ~/.vimsession<cr>

"}}}

" Non-plugin stuff end }}}

" Plugin stuff start ---------- {{{

" NERDTree config
nnoremap <f1> :execute ":NERDTreeToggle " . expand('%:p:h')<cr>

" TagBar config
nnoremap <f8> :TagbarToggle<cr>

" airline config
let g:airline_powerline_fonts = 1
" for macvim airline
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
endif

" easymotion config
nmap s <plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1

" wildfire config 
map <space> <plug>(wildfire-fuel)
vmap <s-space> <plug>(wildfire-water)

" ultisnips trigger configuration.
let g:UltiSnipsExpandTrigger="<leader>f"
let g:UltiSnipsJumpForwardTrigger="<leader>f"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
"let g:syntastic_enable_signs             = 0
let g:syntastic_cpp_compiler             = 'clang++'
let g:syntastic_cpp_compiler_options     = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []}

" YCM config                    
let g:ycm_autoclose_preview_window_after_insertion = 1
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
        execute '!./%<'
    elseif c_ft ==? 'cpp'
        execute '!g++ -std=c++11 % -o %<'
        execute '!./%<'
    elseif c_ft ==? 'python'
        execute '!python %'
    elseif c_ft ==? 'scheme'
        execute '!racket %'
    endif
endfunction
nnoremap <f5> :call CompileRun()<cr>

" Compile tool functions end }}}

