" This must be first, because it changes other options as side effect
set nocompatible		" required
filetype off			" required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all plugins/ bundle here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on 	" required

" specify different areas of the screen to split
set splitbelow
set splitright

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with spacebar
nnoremap <space> za

" see docstrings for folded code
let g:SimplyFold_docstring_preview=1

" auto complete with YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g	:YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""" Python config """"""""""""""""""""""""""""""""""""""""""""""""
" PEP8 indentation
au BufNewFile,BufRead *.p 
   \ set tabstop=4
   \ set softtabstop=4
   \ set shiftwidth=4
   \ set textwidth=79
   \ set expandtab
   \ set autoindent
   \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
   \ set tabstop=2
   \ set softtabstop=2
   \ set shiftwidth=2 

" flagging unnecessary whitespace
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pwc,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 support
set encoding=utf-8

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" make code look pretty
let python_highlight_all=1
syntax on

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM in the shell - make vim everywhere
" set editing-mode vi

" Powerline config
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Set line number
set number

" Don't write backup file
set nobackup
set noswapfile

" map leader key
let mapleader=","
