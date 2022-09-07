" C++ helpers

" switch between hpp and cpp
au BufEnter,BufNew *.cpp nnoremap <silent> ;p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;p :e %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;vp :leftabove vs %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;vp :rightbelow vs %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;xp :leftabove split %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;xp :rightbelow split %<.cpp<CR>

" surround with std::optional
nnoremap <silent> ;cso :execute 's/\(' . expand('<cWORD>') . '\)/std::optional<\1>'<CR>:noh<CR>

" zig config
au FileType zig nmap <Leader>dt <cmd>lua vim.lsp.buf.definition()<CR>
au FileType zig nmap <Leader>h  <cmd>lua vim.lsp.buf.hover()<CR>
au FileType zig nmap <Leader>p  <cmd>lua vim.lsp.buf.signature_help()<CR>
au FileType zig nmap <Leader>gd  <cmd>lua vim.lsp.buf.document_symbol()<CR>
au FileType zig setlocal omnifunc=v:lua.vim.lsp.omnifunc

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" easy-motion
" disable default mappings, turn on case-insensitivity
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" faster updates!
set updatetime=100

" no hidden buffers
set hidden&

" automatically read on change
set autoread

";f formats in normal mode
noremap <silent> ;f gg=G``:w<CR>

" language-specific formatters
au FileType cpp set formatprg=clang-format | set equalprg=clang-format

" no folds, ever
set foldlevelstart=99

" rainbow parens
" let g:rainbow_active = 1

" rust config
let g:rustfmt_autosave = 1

set nocompatible
let c_no_curly_error=1

" Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Colorscheme
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598

" Syntax highlighting
syntax on

" Position in code
set number
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8

" Line wrap
set wrap

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :Rg<CR>

" Function to set tab width to n spaces
function! SetTab(n)
  let &tabstop=a:n
  let &shiftwidth=a:n
  let &softtabstop=a:n
  set expandtab
  set autoindent
  set smartindent
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

set noexpandtab
set autoindent
set smartindent

" Function to trim extra whitespace in whole file
function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

set t_Co=256

" colorcolumn 80 when opening C/C++
autocmd BufRead,BufNewFile *.c setlocal
autocmd BufRead,BufNewFile *.h setlocal
autocmd BufRead,BufNewFile *.cpp setlocal
autocmd BufRead,BufNewFile *.hpp setlocal
autocmd BufRead,BufNewFile *.c SetTab 4
autocmd BufRead,BufNewFile *.h SetTab 4
autocmd BufRead,BufNewFile *.cpp SetTab 4
autocmd BufRead,BufNewFile *.hpp SetTab 4

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" .vs = glsl
augroup vs_ft
  au!
  autocmd BufNewFile,BufRead *.vs     set syntax=glsl
augroup END

" .fs = glsl
augroup fs_ft
  au!
  autocmd BufNewFile,BufRead *.fs     set syntax=glsl
augroup END

" Mouse support
set mouse=a

" Map F8 to Tagbar
nmap <F8> :TagbarToggle<CR>

" disable backup files
set nobackup
set nowritebackup

set shortmess+=c

set signcolumn=yes

au FileType text set colorcolumn=80

" show syntax group of symbol under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
