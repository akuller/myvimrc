set nu

set ts=4 expandtab shiftwidth=4 shiftround
set softtabstop=4 copyindent preserveindent autoindent autowriteall autoread
set nocompatible
filetype off 

set undofile
set backup
set backupcopy=auto
set backupdir=~/.vimundo
set undodir=~/.vimundo
set directory=~/temp

set incsearch ignorecase hlsearch smartcase
inoremap jk <esc>
inoremap kj <esc>

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
"Plugin 'kien/ctrlp.vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'sjl/gundo.vim'
"Plugin 'vcscommand.vim'


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
set t_Co=256


" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"open vimrc from vimcast 24 
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
