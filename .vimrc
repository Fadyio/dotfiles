" Written by @Fadynagh from http://fadyio.com
" Email:me@fadyio.com
" Github:@fady0
" NOTE: I'm only using vim for bloging.
"" ----------------------------------------------------------------------------------------
""                                						      settings
"" ----------------------------------------------------------------------------------------
"  Basic Settings
set nocompatible              						    " be iMproved, required
filetype off                  								    " required
set backspace=indent,eol,start               " make the backspace work like in most other programs
set modelines=0   										" Disable modelines as a security precaution
set autowrite     											" Automatically :write before running commands
set autoread      											" reload files when changed
set clipboard+=unnamed          				" Yank and paste with system clipboard.
filetype plugin indent on							" It turns on detection, plugin and indent
set lazyredraw											    " redraw only when we need to.
set complete+=kspell 									" Autocomplete with dictionary words when spell check is on

" UI Conﬁg
set number												    " show line numbers
syntax enable                           				    " Enable syntax processing
set fileencoding=utf-8                               " Set encoding and fileencoding to utf-8
set encoding=UTF-8									" Set encoding UTF-8
set t_Co=256													" set color to 256
set showcmd      											" show command in bottom bar
set ruler                                                         " show the cursor position all the time
set laststatus=2  											" Always display the status line
set wildmenu                    							" visual autocomplete for command menu
colorscheme gruvbox 								" colorscheme 

" Tabs and Indentation
set tabstop=4												" number of visual spaces per TAB
set softtabstop=4                                        " number of spaces in tab when editing
set expandtab                                              " tabs are spaces
set autoindent											    " automatically indent when editing a file in Vim

" Search Settings
set ignorecase											    " ignorecase
set hlsearch												    " Highlighting Search Pattern Matches
set smartcase 												"search for uppercase characters, it will do a case sensitive, lowercase case insensitive search.
set incsearch 										        " search as characters are entered
set showmatch                                            " highlight matching [{()}]

" Window Settings
set splitbelow												" Open new split panes to bottom
set splitright													" Open new split panes to right
set winwidth=84
set winheight=5
set winheight=5
set winheight=999

" Folding Settings
set foldenable                                              " enable folding
set foldlevelstart=10									" open most folds by default
set foldnestmax=10										" 10 nested fold max

" Movement Settings

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" move to beginning/end of line
nnoremap B ^
nnoremap E $


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l




""" relativenumber
set number relativenumber 
  augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

" set the runtime path to include Vundle and initialize

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'sirver/ultisnips'
Plug 'valloric/matchtagalways'
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-startify'  
Plug 'ryanoasis/vim-devicons'
Plug 'Rigellute/rigel'
Plug 'junegunn/goyo.vim'
Plug 'mg979/vim-visual-multi' 
Plug 'tmux-plugins/vim-tmux'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'wakatime/vim-wakatime'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"change leader key to (,,)
let mapleader = ","

" don't show the mode bar
set noshowmode

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	    

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
