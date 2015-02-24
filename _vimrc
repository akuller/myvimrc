
set nu

set ts=4 expandtab shiftwidth=4 shiftround
set softtabstop=4 copyindent preserveindent autoindent autowriteall autoread
set nocompatible
filetype off 

set incsearch ignorecase hlsearch smartcase
inoremap jk <esc>
inoremap kj <esc>

set undofile
set backup
set backupcopy=auto
set backupdir=~/vimfiles/vimundo
set undodir=~/vimfiles/vimundo
set directory=~/vimfile/temp
set noswapfile

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

call vundle#end(path)



syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
set t_Co=256


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif


"!if has("autocmd")
"    autocmd bufwritepost _vimrc source $MYVIMRC
"endif
