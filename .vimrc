set nocompatible              " be iMproved, required
filetype off                  " required

syn keyword cConstant SIGBUS SIGPOLL SIGPROF SIGSYS SIGURG
syn keyword cConstant SIGVTALRM SIGXCPU SIGXFSZ

if has("gui_running")
  vmap <C-S-x> "+x
  vmap <C-S-c> "+y
  imap <C-S-v> <Esc>"+gP
  set guifont=Roboto\ Mono\ Regular\ 11
endif

set wildmode=longest,list,full
set wildmenu

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
Plugin 'pangloss/vim-javascript'

" //i'don't like tabular ,because i think it is unnesccary with hightlight
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

" //pythohn
Plugin 'klen/python-mode'

" tool
Plugin 'majutsushi/tagbar'
Plugin 'L9'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim'
Plugin 'xolox/vim-easytags'

" misc
Plugin 'xolox/vim-misc'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mhinz/vim-startify'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-surround'
Plugin 'DataWraith/auto_mkdir'
Plugin 'edsono/vim-matchit' "extended % matching for HTML

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" color
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'w0ng/vim-hybrid'

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
set laststatus=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent 
set modelines=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set completeopt=menu,menuone,longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

"move
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap ; :



let NERDTreeDirArrows=0 "fix can't open folder

" -----------------uncomment this can fold code default
" set foldmethod=indent
set diffopt=filler,vertical
set background=dark
set t_Co=256
colorscheme hybrid
hi Normal ctermfg=252 ctermbg=None

" -----quick escape
imap jj <Esc>
"   %) end of width specification

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" autoindent after paste

" ------javascript
" jshint auto
" let jshint2_read = 1
" let jshint2_save = 1

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
vnoremap <silent><F3> :lprevious<CR>

" ------tool

"  ----------------comment map leader
let mapleader=","

" -----------------js beautify key map
" map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
" ----------command-t

" ----------easymovtion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
nmap <C-a> <Plug>(easymotion-s)
nmap <C-z> <Plug>(easymotion-s)

let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)

"!!!!!You can use <C-o> to execute one normal mode command from insert mode. Once this command has been executed, you will be returned to insert mode:

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" //---------NESTree
map <F7> :NERDTree<CR>

" ----------autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutToggle = '<M-p>'

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:startify_custom_header =
          \ map(split(system('fortune | cowsay | sed "s/[[:blank:]]*$//"'), '\n'), '"   ". v:val') + ['']

" insert mode quick move
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>o

"II go to just before the first non-blank text of the line
"AA go to the end of the line
"OO start editing on a new line above the current line

inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u

inoremap <C-e> <Esc>$a
inoremap LL <Esc>lli

"CC change what is on the right of the cursor
"SS change the whole line
"DD delete the current line (end in normal mode)
"UU undo

"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }


"syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" EasyTags
set tags=./tags;
set tags=./tags;
let g:easytags_always_enabled = 1
let g:easytags_file = './tags'
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 1
let g:easytags_updatetime_min = 5000

let g:syntastic_javascript_checkers = ['jshint']

let g:snips_trigger_key = '<C-\>'



let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
