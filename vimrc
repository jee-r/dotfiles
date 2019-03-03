" Manage Vim plugin with Pathogen
"execute pathogen#infect()
"Helptags

" Use Vim settings, rather than Vi settings (must be first!)
set nocompatible

" Set the shell to bash/zsh/ ...etc
set shell=/bin/zsh

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Switch syntax highlighting and file type detection on
syntax on
filetype plugin indent on

" Line numbers
set nonumber

" Wrap mode
set nowrap

" Keep the cursor this many lines from the top/bottom of the window
set scrolloff=4

" Remove annoying ~file and swap files
set nobackup noswapfile

" No fancy visual bell
set visualbell t_vb=""

" Show matching brackets
set showmatch

" Show incomplete command at bottom right
set showcmd

" Suppress various messages
set shortmess=filrwxtI

" Save 1000 lines of history
set history=1000

" Ignore case when the search string is lower-case, be case-sensitive
" otherwise, and highlight search results.
set ignorecase smartcase
set hlsearch

" Slightly highlight the current line
"set cursorline

" Set up our status line
set laststatus=2
let &statusline='[%n] %<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V   %P%)'

" Remember last position when re-open
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Use the "desert" colorscheme with a dark background by default, but use the
" wombat or solarized schemes if we have them.  Note that solarized is set up
" to work on iTerm2 on OS X - tweaks might be needed on other OSs.
let g:solarized_termtrans=1
let g:solarized_termcolors=256
function! s:TryScheme(scheme)
    if filereadable( expand("$HOME/.vim/colors/" . a:scheme . ".vim") )
        execute 'colorscheme ' . a:scheme
    endif
endfunction
colorscheme desert
silent! call s:TryScheme("wombat256mod")
silent! call s:TryScheme("solarized")
set background=dark

" Space will unhighlight search and clear any diplayed message
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR><Space>

" Set Leader variable
let mapleader = "\\"

" Mapping: Fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>

" Mapping: New vertical window
nmap <Leader>v :rightbelow vnew<CR>

" The following mappings make Ctrl+navkey move that direction in windows
" We set them in both normal and insert mode, for ease of use
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h
inoremap <C-j> <ESC><C-W>j
inoremap <C-k> <ESC><C-W>k
inoremap <C-l> <ESC><C-W>l
inoremap <C-h> <ESC><C-W>h

" Pressing F2 will toggle and show the paste value (even in insert mode)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Indent settings
set shiftwidth=2
set softtabstop=2
"  tab characters entered will be changed to spaces don't do this !
" set expandtab "

set mouse=

" If it exists, include user's local vim config
if filereadable(expand("~/.vim/custom_vimrc"))
    source ~/.vim/custom_vimrc
endif

" Grammalecte see https://github.com/dpelle/vim-Grammalecte
"let g:grammalecte_cli_py='/usr/bin/grammalecte-cli.py'
