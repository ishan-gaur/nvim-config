" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

"" Vim-Plug setup 
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin(expand('~/.config/nvim/plugged'))
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'ayu-theme/ayu-vim'
" Plug 'octol/vim-cpp-enhanced-highlight'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
call plug#end()

" For plugins to load correctly
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Security
set modelines=0

" Show line numbers
set number relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Whitespace
set nowrap
set textwidth=79
set tabstop=4
set shiftwidth=2
set expandtab
set smartindent

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

" Allow hidden buffers
set hidden

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remap Opening Tagbar to <F8>
nmap <F8> :TagbarToggle<CR>

" Editting conveniences/habit reinforcment
let mapleader = "<Space>"
nnoremap ev :vsplit ~/.config/nvim/init.vim<cr> 
nnoremap sv :source ~/.config/nvim/init.vim<cr> 

inoremap kj <Esc>
inoremap <Esc> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set termguicolors
let ayucolor="mirage"
colorscheme ayu

" IndentLine
let g:indentLine_char = '|'
let g:indentLine_setColors = 0 

" Airline
" let g:airline#extensions#tabline#enabled=1
" let g:airline_statusline_ontop=1
let g:airline_theme='dark'
