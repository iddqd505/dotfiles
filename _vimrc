
"set nocompatible

"Allow switching of buffers without having to save them
set hidden

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=


"Use UTF-8 only
"The encoding displayed for the editor itself, the output encoding that is shown
set encoding=utf-8

"Encoding used for the terminal. This specifies what character encoding the keyboard produces and the display will understand. For the GUI it only applies to the keyboard ('encoding' is used for the display)
set termencoding=utf-8

"The output encoding written to file, the encoding of the buffer
set fileencoding=utf-8

"When opening a file, vim tries to guess the encoding from the option fileencodings
set fileencodings=utf-8

"The encoding for Vim scripts. Must be after encoding value in Windows ?
scriptencoding utf-8

set fileformats=unix,dos
set fileformat=unix

set winaltkeys=no


"Enable syntax highlighting
syntax enable


"Change colorscheme
colorscheme gruvbox

"Change default startup font to Consolas
set guifont=Consolas:h11
"set guifont=Consolas:h11:cANSI

"For windows to display mixed character sets
set guifontwide=MingLiU:h11
"set guifontwide=MingLiU:h11:cANSI


"%:h Easy Expansion of the Active File Directory
"When we type %% on Vim’s : command-line prompt, it automatically expands to the path of the active buffer, just as though we had typed  %:h<Tab>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


"cryptmethod
set cryptmethod=blowfish2


"Automatically indent when adding a curly bracket, etc.
set autoindent

filetype plugin indent on


"Tabs should be converted to a group of 4 spaces. This is the official Python convention
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab


"Minimal number of screen lines to keep above and below the cursor
set scrolloff=0


"Autocompletion config
set complete=.,w,b,u,t,i

"Customize Autocomplete Menu when chosing from multiple matches
set wildmenu
"set wildmode=longest,list

"Autocomplete menu provided by zsh
set wildmode=longest,full
"set wildmode=full

set wildignore=.git,*.swp,*/tmp/*


"Show editing mode
"set showmode


"Error bells are displayed visually
set visualbell


"Setting file name in tittle bar
set title


"To switch off automatic creation of backup files
set nobackup
set nowritebackup
set noundofile
set noswapfile

"Reload unchanged buffer when file changes
set autoread


"Viminfo Options
set viminfo=""
"set viminfo='0,:0,<0,@0,f0,/0
"'0 means that marks will not be saved
":0 means that command-line history will not be saved
"<0 means that registsers will not be saved
"@0 means that input-line history will not be saved
"f0 means that marks will not be saved
"no % means that the buffer list will not be saved
"no / means that the search history will be saved

"Automatic Line Wrapping
set formatoptions+=t
"set formatoptions-=cro

"Disable automatic commenting.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"dont cut words on wrap
set wrap
set linebreak

"list setting disables linebreak
set nolist


"Use autocmd command to change current working directory
set noautochdir
augroup auto_ch_dir
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END


"Allow Backspace over all the document (over everything in insert mode)
set backspace=indent,eol,start


set isfname=@,48-57,/,\\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=,32


"Vim interprets numerals with a leading zero to be in octal notation rather than in decimal. This will cause Vim to treat all numerals as decimal, regardless of whether they are padded with zeros
set nrformats=


set commentstring=%s

autocmd FileType python setlocal commentstring=#%s

nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
"map leader key to <Space>
let mapleader = "\<Space>"

"Set the mapping timeout to 3 seconds instead of 1
"timeoutlen is used for mapping delays
set timeoutlen=3000
"ttimeoutlen is used for key code delays
set ttimeoutlen=200

"Swap key function jk for 'Escape'
inoremap jk <Esc>

set foldlevelstart=8

set foldmethod=marker


"Remove toolbar in startup
set guioptions-=T
"Remove Menu in startup
set guioptions-=m
"Disable right scrollbar
set guioptions-=r
"Disable left scroolbar
set guioptions-=L

"Start program with maximized window
au GUIEnter * simalt ~x


"Show line numeration
set number
"Show line number and cursor position
set ruler

"Display incomplete commands
set showcmd

set relativenumber

"disable startup message
set shortmess+=I

"splits go below with focus
set splitbelow

"vsplits go right with focus
set splitright

"Do not redraw screen in the middle of a macro. Makes them complete faster
set lazyredraw


":help netrw-sort-sequence
"let g:netrw_sort_options = "i"
"g:netrw_sort_sequence
let g:netrw_sort_sequence = '[\/]$,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'

"Display line numbers in Netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

"Netrw case-insensitive sorting
let g:netrw_sort_options = "i"


"Search ignoring case
set ignorecase
"Search with smartcase. Overrides ignorecase if uppercase used in search string
set smartcase
"Search as you type
set incsearch

"modify search keys to center the result.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz


"Status line
set laststatus=2
"set statusline=

"filename relative path
"set statusline+=%f\
"filename full path
set statusline+=%F\ -\

"buffer number (1)
"set statusline+=%-3.3n
"Buffer number (2)
set statusline+=%n

"status flags (h)elp file flag, (m)odified flag, (r)ead only flag
set statusline+=%h%m%r%w\

"FileType
set statusline+=%y\
"File Encoding
set statusline+=[%{strlen(&fenc)?&fenc:'none'},
"File Format
set statusline+=%{&ff}]

"Switch to the right side
set statusline+=\ %=

"line X of Y [percent of file]
set statusline+=Line:%l/%L[%p%%]
"current column
set statusline+=\ Col:%c

"ASCII and byte code under cursor
set statusline+=\ [%b][0x%B]


"Remap position mark ` to '
nnoremap ' `


"Relativenumbers motion remaps
nnoremap <A-f> gj
nnoremap <A-d> gk
xnoremap <A-f> gj
xnoremap <A-d> gk

"Remap motion ge -> E
nnoremap E ge
xnoremap E ge

"To save file press Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

"Keep cursor in place when you join lines with J
nnoremap J mzJ`z

"Insert new line without entering insert mode
nnoremap <A-j> o<Esc>
nnoremap <A-k> O<Esc>

"Disable close without saving
nnoremap ZZ <NOP>
xnoremap ZZ <NOP>
nnoremap ZQ <NOP>
xnoremap ZQ <NOP>


"Remap move to the tab to the left
nnoremap <A-n> gT
"Remap move to the tab to the right
nnoremap <A-m> gt

"Move current window to new tab
nnoremap <Leader>fk <C-w>T

"Close Tab
nnoremap <Leader>fn :tabclo<CR>

"Increase default 10 tabs opened maximum
set tabpagemax=100

"Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-d> <C-b>

"Easily mark a single line in character-wise visual mode
nnoremap vv _vg_

"Macro @ remap
nnoremap <Leader><Leader> @

"Open file under cursor
nnoremap gf :vertical wincmd F<CR>
xnoremap gf :vertical wincmd F<CR>

"Quickly edit/reload the vimrc file
nnoremap <Leader>vv :edit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>

"Copy filename to clipboard
noremap <Leader>cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
noremap <Leader>cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>


"Plugin CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e


"Plugin Chalk
let g:chalk_align = 0
let g:chalk_edit = 0

" Create fold at visual selection
xmap zf <Plug>Chalk
" Create fold at operator movement
nmap zf <Plug>Chalk
" Create fold for specified number of lines
nmap zF <Plug>ChalkRange

" Create single (opening) fold marker at current level or specified count
nmap Zf <Plug>SingleChalk

" Create single (opening) fold marker at next levelor specified count
nmap ZF <Plug>SingleChalkUp

" Increment current fold level
nmap <Leader>zk  <Plug>ChalkUp
" Decrement current fold level
nmap <Leader>zj <Plug>ChalkDown
" Increment levels in selection
xmap <Leader>zk <Plug>ChalkUp
" Decrement levels in selection
xmap <Leader>zj <Plug>ChalkDown
"
"Remap last visual selection
nnoremap <Leader>zl gv


"Plugin Dirvish
"Make automatic sort folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'


"Plugin tabular
    if exists(":Tabularize")
      nnoremap <Leader>a= :Tabularize /=<CR>
      xnoremap <Leader>a= :Tabularize /=<CR>
      nnoremap <Leader>a: :Tabularize /:\zs<CR>
      xnoremap <Leader>a: :Tabularize /:\zs<CR>
    endif

