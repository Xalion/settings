" Adam Blake
"
" plugins
call plug#begin('~/.vim/plugged')

Plug 'valloric/YouCompleteMe'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/syntastic'

Plug 'easymotion/vim-easymotion'

Plug 'sjl/badwolf'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'scrooloose/nerdtree'

call plug#end()
" Colors {{{

syntax enable
colorscheme badwolf

" }}}

" Features {{{ 

set nocompatible
filetype indent plugin on

" }}}

" Misc {{{ 
set hidden
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
set dir=~/tmp
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" }}}

"------------------------------------------------------------
" Usability options {{{1
"
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Highligh matching [{()}]
set showmatch

" Search as we type and highlight search results
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" enable folding

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Clang-format
" if !exists("clangFormatPy")
let clangFormatPy="/home/ablake/Software/utils/share/clang/clang-format.py"
"endif

execute "map <C-F5> :pyfile " . clangFormatPy . "<CR>"
execute "imap <C-F5> <ESC>:pyfile " . clangFormatPy . "<CR>i"

execute "map <F5> :%pyfile " . clangFormatPy . "<CR>"
execute "imap <F5> <ESC>:%pyfile " . clangFormatPy . "<CR>i"

"------------------------------------------------------------
" Indentation options {{{1
"
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
" Turn on spell check by default.
map <F6> :setlocal spell! spelllang=en_us<cr>

command! SetBuildIdass execute "set makeprg=ninja\\ -C\\ ~/Stellar/build64/webidass/Debug"
command! SetBuildHpmi execute "set makeprg=make\\ -j8\\ -C\\ ~/Stellar/build64/hpmi_gpu"
autocmd BufNewFile,BufReadPost *.cuh,*.cu set filetype=cpp
"------------------------------------------------------------
