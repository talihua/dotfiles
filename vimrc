" .vimrc
"--------------------------------------------------------------------------
" This is an example .vimrc with several configurables. simply remove
" the quotation mark at the beginning of a line to enable the feature.
"
" VERSION
"  0.1   2005.07.19 / Creation.

"Installing extra plugins
call pathogen#infect()
call pathogen#helptags()
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
"set clipboard=unnamed

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

""""""""" Molokai """""""""""""
"let g:molokai_original = 1
":colorscheme molokai 

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

""""""""" Kalisi """"""""""""
":colorscheme kalisi
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Cursor Modifications                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"    
au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"

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
" set backspace=0
" set backspace=1
set backspace=2

" columns    - number of columns on the screen
" -- NOTE: This line has a BUG with konsole sessions. The window screws up!
"set columns=88

" cmdheight  - number of lines in the command-line 
" set cmdheight=2
set cmdheight=1

" errorbells - ring the bell (beep or flash screen) for error messages
" set noerrorbells
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
    "set shell=/bin/bash
    set shell=/bin/zsh
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
" set wrap
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

" Vim 7.0 Features --END--

" tags       - where is the tags file located?
"            - default is ./tags,tags
"            - add "/$USER/ws/<name>/tags for 7710 tags
"set tags=../tags,tags,$ROOT_DIRECTORY/tags
"set columns=90
"set lines=45

" PANOS specific settings
let diry=getcwd()
let g:PANOS_BASE = matchstr(diry, ".*panos")
if (g:PANOS_BASE == "")
    let g:PANOS_BASE = "$HOME/ws/panos"
endif
let &tags=g:PANOS_BASE . "/mibs.tag," . g:PANOS_BASE . "/tags"

" CSCOPE
" -----------------------------------------------
"  Must set the environment variable PANOS_BASE because cs add
"  doesn't know how to read in vim variables?
let $PANOS_BASE = g:PANOS_BASE
if filereadable(g:PANOS_BASE . "/cscope.out")
    let g:CSCOPE=1
"    :cs add $PANOS_BASE
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set csto=1
:set cscopetag

" Assume bash shell for parsing purposes
let g:is_bash = 1

"--------------------------------------------------------------------------
" Maps 
"--------------------------------------------------------------------------
" mym -- perform a vertical split between <file> and my.<file>
"map mym   :vert diffsplit my.%<CR>

" dup -- copy current buffer <file> to my.<file>
"map dup   :!cp % my.%<CR>

" F8 -- map F8 key to run taglist plugin.
nnoremap <silent> <F8> :Tlist<CR>

"Mappings of laziness:
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap { {}<Left>

vnoremap ( s()<Esc>P<Right>
vnoremap [ s[]<Esc>P<Right>
vnoremap { s{}<Esc>P<Right>
vnoremap " s""<Esc>P<Right>
vnoremap ' s''<Esc>P<Right>

" Swap <control-S> the left and right-hand side of an assignment
noremap <C-S> :s/\([^ =]*\)\([ ]*\)=[ ]*\([^;]*\);/\3 = \1;/<CR>:nohl<CR>

" Sort the include list:
nnoremap #sort :silent !/usr/local/timostools/reorderincludes.pl %<CR>
"noremap newmac \ :/--End/-1<CR>o<Esc>"*p<Esc><bar>
"         \ :.;/--End/-1s@\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)@\=printf("    {0x%s, 0x%s, 0x%s, 0x%s, 0x%s, 0x%s}, // Kanata %s",toupper(submatch(6)), toupper(submatch(5)), toupper(submatch(4)), toupper(submatch(3)),toupper(submatch(2)), toupper(submatch(1)), strftime("%B %d, %Y"))@<CR><bar>
"         \ :/--Begin/+1;/--End/-1sort u<CR> <bar>
"         \ :nohl<CR> <bar>

" gvim -c 'let @m=""' -c 'for line in readfile("tmp.txt", "") | let @m .= 
" line."\n" | endfor'         

" PDF files in VIM
:autocmd BufReadPre  *.pdf set ro
:autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk '%' - |fmt -csw78
" END PDF
"
" Turn on Spell-Checker
":set spell spelllang=en_us
:autocmd BufNewFile,BufReadPost * 
  \  if &buftype != ''
        \ | setlocal nospell 
        \ | silent! iunmap [
        \ | silent! iunmap {
        \ | silent! iunmap (
        \ | silent! iunmap '
        \ | silent! iunmap "
  \ | endif

let g:S=0  "result in global variable S
function! Sum(number)
  let g:S=g:S+a:number
  return a:number
endfunction
function! InitSum()
  let g:S=0
endfunction

" Ctags function helper
let g:ctags_path="/usr/bin/ctags"
let g:ctags_statusline=1
let g:generate_tags=1

" ChangesPlugin
"let g:changes_autocmd=1  " Automatically update diff status
let g:changes_verbose=0  " Don't show the meaning of +/-/*



" omniCppComplete helpers
" completion using control-tab
" MAKE SURE TO READ: :h omnicppcomplete
" We need the following 'options' for CTAGS for this to work properly:
" --c++-kinds=+p
" --fields=+iaS
" --extra=+q
"  -B                  # Search backwards?
" Do we want the -I option too for MACROS?
" Put this in ~/.ctags
imap <C-Tab> <C-X><C-O>

" MIB Syntax Highlighting:
"
autocmd BufNewFile,BufRead *.mib
  \   set spelllang=en,$HOME/tmp/mib.spl 
  \ | set spell

let $mibtag=g:PANOS_BASE . "/make/mibtags.pl"
nnoremap <F9> :!$mibtag      -d -o $HOME/tmp/mib.dic<CR><bar>:silent mkspell! $HOME/tmp/mib.spl $HOME/tmp/mib.dic<CR>
"nnoremap <silent> <F9>   :!$mibtag -m %:p -d -o 
"$HOME/tmp/mib.dic<CR><bar>:silent mkspell! $HOME/tmp/mib.spl 
"$HOME/tmp/mib.dic<CR>

" Map \d to 'delete' but don't remember what you deleted!
nnoremap <leader>d  "_d

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          My Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove highlighting of previous search
:map <C-h> :nohl<CR>

" Move quickly to-from header source files
:map <leader>a :A<CR>

"VIMRC AutoReload
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Default VIM to split right instead of left
set splitright

" Copy Paste System Clipboard
nnoremap <leader>y "+y
nnoremap <leader>pp :set paste<CR>o<esc>"+[p<CR> :set nopaste<CR> " paste from clipboard
nnoremap <leader>P "+P

" Fast saving
nmap <leader>wq :wqall!<cr>
nmap <leader>q :qa!<cr>
nmap <leader>w :w!<cr>

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.mib setlocal textwidth=80

"Force quickfix to take full horzintal space
au FileType qf wincmd J

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cwindow<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


if has("cscope")
        "uncomment for linux
        set csprg=/usr/bin/cscope
        "uncomment for cygwin
        "set csprg=/usr/local/timostools/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("./cscope.out")
            execute "cs add ./cscope.out"
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb

        """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-@ *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif

"syntax on
filetype plugin indent on

"Taglist plugin Options
let Tlist_Use_Right_Window   = 0
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0

" CCTree Plugin
let CCTreeEnhancedSymbolProcessing = 1
let g:CCTreeOrientation = "leftabove"
let g:CCTreeUsePerl = 1
let g:CCTreeLoadXRefDBFromDisk = g:PANOS_BASE . "/ccglue.out"
let g:CCTreeDisplayMode = 1
let g:CCTreeMinVisibleDepth = 1
let g:CCTreeRecursiveDepth = 2
let g:CCTreeHilightCallTree = 1

"folding settings:
" za - toggles
" zc - closes
" zo - opens
" zR - open all
" zM - close all
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default`
set foldlevel=1         "this is just what i use
set noswapfile          "Personal setting to disallow creation of swap files.
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
augroup vimrc_autocmds
  autocmd BufEnter *.mib highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter *.mib match OverLength /\%81v.*/
augroup END

"  PyDiction allows tab auto-complete for python codes
let g:pydiction_location = '/home/saketkus/.vim/bundle/pydiction/complete-dict'

" Pretty XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


" CTRL-P Plugin settings
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*/gen/*,*/deps/*,*/panos/bin/*,*/panos/objs/*,*.so,*.swp,*.zip,*.rej

" airline-vim
" let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_whitespace=0 
let g:airline_powerline_fonts=1 

" Jedi VIM 
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = "1"

" Cscope_Quickfix
let g:Cscope_PopupMenu = 1

"Custom Font
if has("gui_running")
    set guifont=Monospace\ 14
else
    set guifont=Monospace\ 16
endif

" TMUX
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")

" Mapping compilation command
nnoremap <F12> :ConqueTermVSplit mk cpm i386<CR>

" shortcuts to vimdiff
if &diff
    map <leader>1 :diffget //2<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget //3<CR>
    map <leader>uu :diffupdate<CR>
endif

" Using Ag silver searcher
if executable('ag')
    " From Vimbits
    set grepprg=ag\ -l\ -i\ --ignore-dir=^bin\ --ignore-dir="^obj"\ --ignore-dir="^deps"\ -G "*\.(h|c|mib)"\ --nogroup\ --nocolor\ -U\ -C\ 2 
    set grepformat=%f:%l:%c:%m,%f:%l:%m

    " ctrl-p use ag for Searching
    let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Use grep for the word under the cursor
nnoremap K :grep "expand("<cword>")

" use ,F to jump to tag in a vertical split
 nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

" List buffers and switch to one quickly
nmap <leader>b :ls<CR>:buffer<Space>

" auto format JSON File
nmap <leader>j :%!python -m json.tool

" Resize window vertical
nnoremap <leader>+ :10winc ><CR>
nnoremap <leader>- :10winc <<CR>


" pastetoggle
set pastetoggle=<leader>p

" hint to keep lines short
if exists('+colorcolumn')
      set colorcolumn=80
endif
