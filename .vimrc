set nocompatible              " be iMproved, required
filetype off                  " required


syn keyword cConstant SIGBUS SIGPOLL SIGPROF SIGSYS SIGURG
syn keyword cConstant SIGVTALRM SIGXCPU SIGXFSZ

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" web
" Plugin 'mattn/emmet-vim'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'cakebaker/scss-syntax.vim'

" javascript
Plugin 'terryma/vim-multiple-cursors'
Plugin 'moll/vim-node'

" //i'don't lik tabular ,because i think it is unnesccary with hightlight
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

" //pythohn
Plugin 'klen/python-mode'

" tool
Plugin 'majutsushi/tagbar'
Plugin 'L9'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" color
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'

set runtimepath+=~/.vim/bundle/jshint2.vim/
execute pathogen#infect()
call vundle#end()            " required
filetype plugin indent on    " required

" // configure
"  -----------------tagbar
nmap <F8> :TagbarToggle<CR>


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Disable automatic comment insertion
set regexpengine=1
syntax enable
syntax on
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent 
set paste
let NERDTreeDirArrows=0 "fix can't open folder
" -----------------uncomment this can fold code default
" set foldmethod=indent
set diffopt=filler,vertical
set background=dark
set t_Co=256
colorscheme hybrid

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter


" ------javascript
" jshint auto
let JSHintUpdateWriteOnly=1
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>"

" ------tool
"  ----------------comment map leader
let mapleader=","
" -----------------js beautify key map
" map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
" ----------command-t

" ----------easymovtion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)

let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)

" //---------NESTree
map <C-n> :NERDTreeToggle<CR>
