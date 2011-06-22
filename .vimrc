
" Use pathogen to manage other plugins
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Security
set modelines=0

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Basic options
set encoding=utf-8
set scrolloff=3
set nowrap
set number
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=*~,*.pyc,*.o,*.cmi,*.cmx,*.cmo,*.annot,*.aux,*.bbl,*.blg,*.out,*.toc,*.pdf,*.swp
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" set autochdir
set mouse=a

set completeopt=longest,menuone " longest common prefix

set laststatus=2 " always on
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" (not til 7.3)
" set relativenumber
" set undofile

" history
set history=500

" Leader
let mapleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>b %
vnoremap <leader>b %

" Movement
nnoremap j gj
nnoremap k gk
nnoremap <silent> zk O<ESC>
nnoremap <silent> zj o<ESC>
nnoremap <space> <C-f>
nnoremap <S-space> <C-b>

" saving
command WQ wq
command Wq wq
command W w
command Q q

" Latex specific text wrapping?
" set formatoptions
" set textwidth=70

" Disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.pyc$', '.o$', '.cm[ixo]$', '.annot$']

" No shift
nnoremap ; :

" Wrap paragraphs of text
nnoremap <leader>q gqip

" Reselect indentation
nnoremap <leader>v V`]

" Quick ESC
inoremap jj <ESC>

" Open a vertical split and switch to it.
nnoremap <leader>w <C-w>v<C-w>l

" Quick ack
nnoremap <leader>a :Ack 

" TagList
nnoremap <leader>t :TlistToggle<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

" Command-t
nnoremap <leader>f :CommandT<cr>

" Datalog and Links highlighting
au BufNewFile,BufRead *.datalog set filetype=datalog
au BufNewFile,BufRead *.links set filetype=links

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
"
" tell complete to look in the dictionary
set complete-=k complete+=k

" load the dictionary according to syntax
:au BufReadPost * if exists("b:current_syntax")
:au BufReadPost *   let &dictionary = substitute("~/.vim/dict/FT.dict", "FT", b:current_syntax, "")
:au BufReadPost * endif 

colorscheme desert

" GUI 
if has('gui_running')
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

    set guioptions-=m " Farewell menu
    set guioptions-=T " Farewell toolbar
    set lines=73 columns=115 " 100 for latex?

    set go-=l
    set go-=L
    set go+=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


