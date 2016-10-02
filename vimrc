"Installing extra plugins
call pathogen#infect()
call pathogen#helptags()

" Set Mapleader
let mapleader=","

"--------------------------------------------------------------------------
"behave mswin
"--------------------------------------------------------------------------
"  VI and mouse support
"--------------------------------------------------------------------------
" Configure vi to be aware of the mouse in an xterm.
" this will act similar to gvim for mouse support, but without all the gui.
if &term =~ "screen" || &term =~ "xterm"
  if has("terminfo")
     set mouse=a
     set t_Co=256
     set t_Sf=[3%p1%dm
     set t_Sb=[4%p1%dm
     set ttymouse=xterm2
  else
    set mouse=a
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
    set ttymouse=xterm2
  endif
endif

"--------------------------------------------------------------------------
" Clipboard to system clipboard.
"--------------------------------------------------------------------------
" behave mswin
set clipboard=unnamed

"--------------------------------------------------------------------------
" Syntax highlighting, specify 'off' to disable.
"--------------------------------------------------------------------------
" Turn Syntax highlighting on
syntax on

"---------------------------------------------------------------------------
" plugin file type enabling on startup (see omnicppcomplete)
"---------------------------------------------------------------------------
filetype plugin on

"--------------------------------------------------------------------------
" Syntax highlighting color scheme (for c/c++):
"--------------------------------------------------------------------------
if has('gui_running')
    set background=light
else
    set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Colorschemes "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""" Solarized """"""""""""
if has('gui_running')
     " do something
      let t_Co=256
      let g:solarized_termcolors=256
else
    let t_Co=256
    let g:solarized_termcolors=256
    " let t_Co=16
    " let g:solarized_termcolors=16
endif
:colorscheme solarized

"--------------------------------------------------------------------------
" Syntax specifics
"--------------------------------------------------------------------------
" autoindent - auto indent, when indented stay indented.
" set autoindent
set autoindent

" cindent    - indent according to c standards
" set cindent
set cindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"--------------------------------------------------------------------------
" Title specifics
"--------------------------------------------------------------------------
" title      - change the title of the window
if has("gui_running")
  set title
  " guioptions -- what options are shown in the gui.
  "             - a -- copy all highlighted text to 'windows' copy buffer
  "             - c -- use console options, instead of dialog boxes
  set guioptions+=ac
else
  set notitle
endif

" titlestring - what to display in the title 
"               not specifying a titlestring, will default to file + diry.
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"--------------------------------------------------------------------------
"  Turn on line-numbering
"--------------------------------------------------------------------------
" number     - display line numbers
" set nonumber
set number

"--------------------------------------------------------------------------
" Coding standards
"--------------------------------------------------------------------------
" shiftwidth - number of spaces to use for each step of indent.
set shiftwidth=4
" tabstop    - number of spaces the tab key will use
set tabstop=4
" expandtab  - convert the tab character to spaces
set expandtab

"--------------------------------------------------------------------------
" Searching features
"--------------------------------------------------------------------------
" ignorecase - ignores case when searching (ie. e=E)
" set noignorecase
set ignorecase   

" incsearch  - incremental search, as you type it finds partial matches
" set noincsearch
set incsearch

" hlsearch   - highlight search, highlight all matching text
" set nohlsearch
set hlsearch

"--------------------------------------------------------------------------
" backup files
"--------------------------------------------------------------------------
" backup     - turn on backups, files are backed when modified
" set backup
" set nobackup
set backupdir=~/tmp
"--------------------------------------------------------------------------
" Editing preferences
"--------------------------------------------------------------------------
" backspace  - make backspace overwrite contents in edit mode.
set backspace=2

" cmdheight  - number of lines in the command-line set cmdheight=2
set cmdheight=1

" errorbells - ring the bell (beep or flash screen) for error messages
set errorbells

" hidden     - keep files (not shown in a buffer) loaded.
" set nohidden
set hidden

" icon       - display name of file or 'iconstring' when window is
"              iconified.
" set noicon
" set iconstring
set icon

" insertmode - set to configure vim to be modeless (simply start typing!)
" set insertmode
set noinsertmode

" laststatus - does the last window have a status line?
"            - 0 = never, 1 = only >1 windows, 2 always
set laststatus=2

" path - a list of directories to search when looking for files using
"        find, or gf
set path+=./**;

" ruler      - show line and column number
" set noruler
set ruler

" shell      - what shell to use
if has("win32")
    set shell=c:\bin\bash
else
    set shell=/bin/bash
endif

" showcmd    - show command
"            - shows number of characters highlighted
"            - shows number of lines, or
"            - shows block (lines x columns)
" set noshowcmd
set showcmd 

" showmatch  - show matching brackets
" set noshowmatch
set showmatch

" showmode   - shows mode VI is in, INSERT, VISUAL, etc. 
" set noshowmode
set showmode

" sidescroll - minimum number of columns to scroll horizontally.
" set sidescroll=0
set sidescroll=1

" visualbell - flash screen instead of beeping on errors.
set   visualbell

" whichwrap  - left/right arrows will move across lines
set whichwrap=31

" wrap       - wrap long lines within window
"set wrap
set nowrap

" wrapscan   - when searching, continue at top of file
" set nowrapscan
set   wrapscan

" autoread   - if file has been modified by an outside influence,
"              re-read the file
set   autoread

" cpoptions  - compatibility options
"            - default is aABceFs
"            - W is used to block overwriting of read-only files
"                 (ie.  w! is blocked)
set cpoptions+=W

" mousefocus - focus follows mouse in windows
"            - becareful with this one when using menu'd gvim.
" set mousefocus    " focus follows mouse in windows

" format options
" textwidth -- autowrap at this many characters.
set textwidth=80       
set fo=cqwan
" set fo=qwan

" Vim 7.0 Features --START--
" cursorline - highlight the current line containing the cursor.
" set nocursorline
set cursorline

" Assume bash shell for parsing purposes
let g:is_bash = 1


" Ctags function helper
"let g:ctags_path="/usr/bin/ctags"
"let g:ctags_statusline=1
"let g:generate_tags=1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          My Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"VIMRC AutoReload
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Default VIM to split right instead of left
set splitright

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.mib setlocal textwidth=80

"syntax on
filetype plugin indent on

set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default`
set foldlevel=1         "this is just what i use
set noswapfile          "Personal setting to disallow creation of swap files.

"Custom Font
if has("gui_running")
    set guifont=Monospace\ 14
else
    set guifont=Monospace\ 16
endif

nnoremap <leader>pp :set paste<CR>o<esc>"*[p<CR> :set nopaste<CR> " paste from clipboard
nnoremap <leader>P "*P
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


" hint to keep lines short
if exists('+colorcolumn')
      set colorcolumn=80
endif

"NERDTree automatically when vim starts up
" start vim with plain vim and not vim <fileName>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>


source $HOME/cscope_maps.vim
