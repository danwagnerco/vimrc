set nocompatible
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
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Begin Vundle
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Bundles
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
" set background=dark
" colorscheme solarized
" colorscheme Tomorrow-Night-Bright
" colorscheme Molokai

" Settings
syntax on
set relativenumber
set number
set smarttab
set splitbelow
set splitright
set clipboard=unnamed
set laststatus=2
set scrolloff=5
let g:netrw_liststyle=3

" Airline-specific settings
" set guifont=Powerline\ Consolas:h10:b
" set guifont=Meslo\ LG\ M\ for\ Powerline:h9
" set encoding=utf-8
" let g:airline_powerline_fonts=1
" let g:airline_theme = 'tomorrow-night'

" Leader customization
let mapleader=" "

" Configure tabstop softtabstop and expand or not by filetype
if has("autocmd")
  filetype on

  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

endif