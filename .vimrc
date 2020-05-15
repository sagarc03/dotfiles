" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  can pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'benmills/vimux'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-dispatch' 
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'wikitopian/hardmode'
Plugin 'tomasr/molokai'
Plugin 'rakr/vim-one'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'Lokaltog/vim-powerline'
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
set encoding=utf-8

" Enable filetype plugins
filetype plugin indent on

" Auto Indent
"autocmd BufWritePre * normal gg=G

" Set to auto read when file is changed from outside
set autoread

" Set backspace behave in a regular manner
set backspace=indent,eol,start

" Tab control
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set clipboard=unnamed

" faster redrawing
set ttyfast

" code foldmethod settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=99

"Searching

set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw

set magic
set showmatch
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Theme
set rtp+=~/.vim/bundle/gruvbox
set rtp+=~/.vim/bundle/dracula
set rtp+=~/.vim/bundle/molokai
set rtp+=~/.vim/bundle/vim-one
set rtp+=~/.vim/bundle/onehalf.vim
set rtp+=~/.vim/bundle/palenight.vim
set rtp+=~/.vim/bundle/vim-colors-solarized

colorscheme solarized
let g:gruvbox_contrast_dark='hard'
set t_Co=256
let base16colorspace=256
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" Set background to adapt to dark mode
set background=dark
set number relativenumber 
set autoindent
set smartindent
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bbindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigations
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-l> :wincmd l<cr>

" Windows movement shortchaut
" Natural split direction
set splitright

" With map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
map <leader>w :w!<cr>
map <leader>ev :e! ~/.vimrc<cr>
map <leader>wc :wincmd q<cr>

nnoremap <silent>j gj
nnoremap <silent>k gk

nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>ls :ls<cr>

" Find Settings
set path+=**

set wildmenu
set wildignore+=**/node_modules/**,**/__pycache__/**
set wildcharm=<Tab>

noremap <leader>b :buffer<space><Tab>
noremap <leader>f :find<space>
noremap <leader>vf :vsplit <Bar> :find<space>


" Generate ctags in the current folder recursively
command! MakeTags !ctags -R .

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

map <leader>nn :NERDTreeToggle<cr>

let g:NERDTreeShowIgnoredStatus=1
let NERDTreeWinSize=31
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_popilate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['GCC']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>rp :call VimuxRunCommand("clear; python3  " . bufname("%"))<cr>
set mouse-=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
nnoremap <leader>tb :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
"nnoremap <leader>gc :Gcommit -S -v -q<CR>
"nnoremap <leader>gt :Gcommit -S -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
"nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
"nnoremap <leader>gps :Dispatch! git push<CR>
"nnoremap <leader>gpl :Dispatch! git pull<CR>
set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_leader_key='<C-Z>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Hard Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:HardMode_level = 'wannabe'
