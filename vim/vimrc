"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Anoop Hallur's vimrc file, updated 07 May, 2014
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen Plugin
"
" https://github.com/tpope/vim-pathogen

execute pathogen#infect()
syntax on
filetype plugin indent on

" Reload .vimrc on the fly, somehow not working
nmap <leader>sz :so ~/.vimrc<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Change Leader Key
let mapleader = ","

" Disabling swap files, backup files,  creation in vim
:set nobackup
:set nowb
:set noswapfile
:set noundofile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab settings 
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
:set autoread

" gets rid of all the crap that Vim does to be vi compatible
:set nocompatible
" prevents some security exploits having to do with modelines in files
:set modelines=0


" Toggle spell-checking
map <silent> <F10> :set nospell!<cr>:set nospell?<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No idea what I am doing here. Blame
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/ if something goes
" wrong
" Each of these lines are basically to make Vim behave in a sane manner
:set encoding=utf-8
:set scrolloff=3
:set autoindent
:set showmode
:set showcmd
:set hidden
:set wildmenu
:set wildmode=list:longest
:set visualbell
:set cursorline
:set ttyfast
:set ruler
:set backspace=indent,eol,start
:set laststatus=2
:set relativenumber
:set title                " change the terminal's title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching / Moving Related
"nnoremap / /\v
"vnoremap / /\v
:set ignorecase
:set smartcase
:set gdefault
:set incsearch
:set showmatch
:set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With the following (for example, in vimrc), you can visually select text then
" press ~ to convert the text to UPPER CASE, then to lower case, then to Title
" Case. Keep pressing ~ until you get the case you want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized color scheme settings
"syntax enable
"set background=dark
"colorscheme solarized

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  makes Vim handle long lines correctly
:set wrap "Automatically wrap text
:set textwidth=79
:set formatoptions=qrn1
:set colorcolumn=80

:set ai "Auto indent
:set si "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configuring vim to map the escape sequences to their Alt combinations
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l
" commands needed to move around your splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" commands needed to resize your splits
" leader 1 to shrink, leader 2 to expand
noremap <leader>2 :vertical resize +5<CR>
noremap <leader>1 :vertical resize -5<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert a line  and go back to normal mode by holding Shift
nmap <A-O> O<Esc>
nmap <A-o> o<Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This will disable the arrow keys while you’re in normal mode 
"to help you learn to use hjkl.
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  configure Vim to watch for changes in your .vimrc and automatically reload
"  the config --> Not working agian
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

let autoreadargs={'autoread':1}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier increment/decrement of numbers in file
nnoremap + <C-a>
nnoremap - <C-x>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tab realted shortcuts
noremap <A-t> <C-W>T " Opens a split in new tab
noremap <A-PageUP> gT " Alt{PgUp , Pg-Down} for moving around tabs
noremap <A-PageDown> gt
set showtabline=2 "Always show tab bar"
set tabpagemax=100 "Maximum tabs open. . If I open more than 100 tabs, I need 
                   " to see a psychiatrist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ENTER PLUGIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Save Plugin

" enable AutoSave on Vim startup
let g:auto_save = 1  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree Settings

" How to jump back to NERDTree from file in tab?  --> ctrl-ww
" open a NERDTree automatically when vim starts up
autocmd vimenter * if !argc() | NERDTree | endif
" map a Ctrl p to open NERDTree
map <C-p> :NERDTreeToggle<CR>
nmap <C-o> :NERDTreeFind<CR>
let g:nerdtree_tabs_open_on_console_startup=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter toggle comment, ctrl M to toggle comment
nmap <leader>cx  <leader>c<space> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP --> Most Recently opened files plugin
noremap <leader>e :CtrlPMRU<CR>
noremap <leader>r :CtrlP<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Session saving plugins
let g:session_directory = getcwd()
nnoremap <leader>s :SaveSession! .session<CR> 
let g:session_autosave = 'no'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline settings
"let g:airline#extensions#tabline#enabled = 1
