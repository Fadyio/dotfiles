" Better paste
vnoremap <silent> p "_dP

" Disable annoying command line thing
nnoremap <silent> q: :q<CR>

" Easy insertion of a trailing ; or , from insert mode
inoremap <silent> ;; <Esc>A;<Esc>
inoremap <silent> ,, <Esc>A,<Esc>

" Delete char without copying it
nnoremap <silent> x "_x

" Unhighlight what you searched for
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Visual --
" Stay in indent mode
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Move text up and down
vnoremap <silent> <A-j> :m .+1<CR>==
vnoremap <silent> <A-k> :m .-2<CR>==

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap <silent> y myy`y
vnoremap <silent> Y myY`y

" Visual Block --
" Move text up and down
xnoremap <silent> J :move '>+1<CR>gv-gv
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> <A-j> :move '>+1<CR>gv-gv
xnoremap <silent> <A-k> :move '<-2<CR>gv-gv
