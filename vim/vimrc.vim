"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
set encoding=utf-8

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when file is changed from outside
set autoread

" Set backspace behave in a sane manner
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
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

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
colorscheme monokai
set t_Co=256
let base16colorspace=256
" Set background to adapt to dark mode
set background=dark
set number
set autoindent
set smartindent
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bbindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" HardNMode
"""""""""""
" Normal Mode Remap
nnoremap <Up> :echo "Dont be stup! Use K"<CR>
nnoremap <Down> :echo "Dont be stup! Use J"<CR>
nnoremap <Left> :echo "Dont be stup! Use H"<CR>
nnoremap <Right> :echo "Dont be stup! Use L"<CR>
" Visual Mode Remap
vnoremap <Up> :<C-u>echo "Dont be stup! Use K"<CR>
vnoremap <Down> :<C-u>echo "Dont be stup! Use J"<CR>
vnoremap <Left> :<C-u>echo "Dont be stup! Use H"<CR>
vnoremap <Right> :<C-u>echo "Dont be stup! Use L"<CR>
" Insert Mode Remap
inoremap <Up> <C-o>:echo "Dont be stup! Use K"<CR>
inoremap <Down> <C-o>:echo "Dont be stup! Use J"<CR>
inoremap <Left> <C-o>:echo "Dont be stup! Use H"<CR>
inoremap <Right> <C-o>:echo "Dont be stup! Use L"<CR>

" Navigations
nnoremap <C-j> :call WinMove("j")<cr>
nnoremap <C-k> :call WinMove("k")<cr>
nnoremap <C-h> :call WinMove("h")<cr>
nnoremap <C-l> :call WinMove("l")<cr>

" Windows movement shortcut
" move to the pane in the given direction or create one
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key, '[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" Natural split direction
set splitbelow
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
nnoremap <leader>b :b
nnoremap <leader>bd :bd
"
