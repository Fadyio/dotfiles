"" http://github.com/fady0
"" ----------------------------------------------------------------------------------------
""                                         settings
"" ----------------------------------------------------------------------------------------
" Basic Settings
set nocompatible              						    " be iMproved, required
filetype off                  						    " required
set backspace=indent,eol,start                          " make the backspace work like in most other programs
set modelines=0   										" Disable modelines as a security precaution
set autowrite     										" Automatically :write before running commands
set autoread      										" reload files when changed
set clipboard+=unnamed          				        " Yank and paste with system clipboard.
filetype plugin indent on							    " It turns on detection, plugin and indent
set lazyredraw											" redraw only when we need to.
set complete+=kspell 									" Autocomplete with dictionary words when spell check is on
let mapleader = ","                                     " change leader key to (,,)
nnoremap Y y$                                           " make Y behave like the rest of vim cap 

" UI config 

set number												" show line numbers
syntax enable                           				" Enable syntax processing
set fileencoding=utf-8                                  " Set encoding and fileencoding to utf-8
set encoding=UTF-8									    " Set encoding UTF-8
set t_Co=256											" set color to 256
set showcmd      										" show command in bottom bar
set ruler                                               " show the cursor position all the time
set laststatus=2  										" Always display the status line
set wildmenu                    						" visual autocomplete for command menu

" Tabs and Indentation
set tabstop=4											" number of visual spaces per TAB
set softtabstop=4                                       " number of spaces in tab when editing
set expandtab                                           " tabs are spaces
set autoindent											" automatically indent when editing a file in Vim

" Search Settings
set ignorecase											" ignorecase
set hlsearch										    " Highlighting Search Pattern Matches
set smartcase 										    "search for uppercase characters, it will do a case sensitive, lowercase case insensitive search.
set incsearch 										    " search as characters are entered
set showmatch                                           " highlight matching [{()}]

" Window Settings
set splitbelow											" Open new split panes to bottom
set splitright											" Open new split panes to right
set winwidth=84
set winheight=5
set winheight=5
set winheight=999

" Folding Settings
set foldenable                                          " enable folding
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
call plug#begin("~/.config/nvim/Plugins")

"automatic closing of quotes, parenthesis, brackets, etc
Plug 'raimondi/delimitmate'
" Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"surroundings parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-surround'
" colorscheme rigel
Plug 'Rigellute/rigel'
" colorscheme gruvbox
Plug 'morhetz/gruvbox'
" colorscheme onedark
Plug 'joshdick/onedark.vim'
" buffer line (with tabpage integration) for Neovim built using lua.
Plug 'akinsho/bufferline.nvim'
" This plugin adds indentation guides to all lines (including empty lines)
Plug 'lukas-reineke/indent-blankline.nvim'
" telescope is a highly extendable fuzzy finder over lists
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Treesitter-based highlighting 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" vim-visual-multi in analogy with visual-block with ctrl+n
Plug 'mg979/vim-visual-multi' 
"plugin for productivity metrics, goals, leaderboards, and automatic time tracking
Plug 'wakatime/vim-wakatime'
" autocompletion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" python autocompletion 
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
" java autocompletion
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" devicons
Plug 'ryanoasis/vim-devicons'
" Fugitive is the premier Vim plugin for Git
"Plug 'tpope/vim-fugitive'
" github copilot
Plug 'github/copilot.vim'
" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" vim-solarized
Plug 'altercation/vim-colors-solarized'
"  VS Code's GitLens plugin.
Plug 'APZelos/blamer.nvim'
" leetcode plugin
Plug 'ianding1/leetcode.vim'
" zinit syntax
Plug 'zdharma-continuum/zinit-vim-syntax'
" startup screen
Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive ='telescope'
" nightfox theme
Plug 'EdenEast/nightfox.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"" ----------------------------------------------------------------------------------------
""                                    settings for coc.nvim
"" ----------------------------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Remap for do codeAction of selected region

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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

" colorscheme 
colorscheme nightfox

autocmd FileType python map <buffer> <leader>e :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let g:leetcode_browser = 'firefox'

" MarkdownPreview Config
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" Spelling Checker for (Neo)vim
"
