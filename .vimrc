scriptencoding utf-8


" How to start:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
" Now open vim and run :PluginInstall
" YouCompleteMe has its own installation thing
" ~/bundle/YouCompleteMe/install.py --clang-completer --all

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'hashivim/vim-terraform', {'for': 'terraform'}

"Plugin 'neoclide/coc.nvim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'junegunn/fzf.vim'
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'junegunn/fzf.vim'
"Plugin 'bling/vim-airline'
"Plugin 'Buffergator'
"Plugin 'MarkdownFootnotes'


" Run :source ~/.vimrc  to source the vimrc file without restarting
" Plugins are stored in ~/.vim/bundle
"
"Other interesting vimrc:
" https://dougblack.io/words/a-good-vimrc.html
"
"
"
"-----------------------------------------------------------------------
" settings
"-----------------------------------------------------------------------

set showmode
set shell=bash
set softtabstop=4           " <BS> over an autoindent deletes both spaces
se expandtab                " use spaces and no tabs.
se ai                       "auto indent
set si                      "Smart indent
set wrap                    "Wrap lines
se ts=4                     " tab stop and shift width set to 4
se sw=4                     " tab stop and shift width set to 4
se ruler                    " show the line and column number
set cursorline              " Have a line indicate the cursor location
set ruler                   " Show the cursor position all the time
set cursorline              " Have a line indicate the cursor location
set nu                      " show the line number 
set number                  " Display line numbers
set numberwidth=2           " Set gutter width
set title                   " Show title in console title bar
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.
set wildignore+=.git        " Ignore these files when completing
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set linebreak               " Don't wrap text in the middle of a word
set autoindent              " Always set autoindenting on
set smartindent             " Use smart indent if there is no indent file
set noautowrite             " Never write a file unless I request it
set noautowriteall          " NEVER
set autoread                " Load changed files automatically
set modeline                " Allow vim options to be embedded in files
set modelines=5             " They must be within the first or last 5 lines
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings
set wrapscan                "Wrap searches 
set incsearch               "Incremental searching
se nohlsearch               " dont highlight the search matches
se hlsearch                 " dont highlight the search matches
se noautowrite              " I know when I need to save.
syntax enable               "Syntax highlighting where possible
syntax on                   "Syntax highlighting where possible
se hidden                   " No need to save buffer before switching to another buffer in same window
set ignorecase              "searches are case insensitive. use se noic to change
set smartcase               "however case are sensitive if the search contains upper case. 
set hlsearch                " Highlight searches by default
set incsearch               " Find the next match as we type the search
set ruler                   " Show the statusline
set ls=2                    "Set laststatus for status line
se noswapfile               "If you dont want a swap file.
set nobackup
set nowb
se background=light         " and this color scheme
se showbreak=<>             " Indicator that the line is being wrapped around during display.
se splitbelow               " new windows below?
"set clipboard=unnamed  " Using the clipboard as the default register
" set textwidth=100
set textwidth=0
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set foldmethod=indent
set foldlevel=20
set foldlevelstart=20

set colorcolumn=100
" set textwidth=100

setlocal linebreak          " For long lines, e.g. editing text, put a break rather than wrapping around
setlocal nolist
setlocal display+=lastline
filetype plugin indent on
syntax on

"Show the time on the statusline 
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" useful for completing words. using ctrl-X ctrl-k in insert mode
"
set dictionary=/usr/share/dict/words
"Colors on the statusline. 
"Needs different format for gui vim, which we dont care about
hi StatusLine   ctermfg=8 ctermbg=2 cterm=NONE
hi StatusLineNC ctermfg=2 ctermbg=8 cterm=NONE

"
" ===========================================
" Search 
" ===========================================
"
" set incsearch       " Find the next match as we type the search
" set ignorecase      " Ignore case when searching...
" set smartcase       " ...unless we type a capital
"
" MRU File. Activated by ,M
let MRU_File = $HOME.'/.vim/vim_mru_files'
"let MRU_File = '/Users/smaniyedath/.vim/vim_mru_files'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" size and position of the window
" se lines=50
" se columns=125

" winpos 187 128

"se directory=~/.vim-swap-files

" ===========================================
" Key Mappings
" ===========================================

" <C-A> mapped to going to the other file since infosys days...
map <C-A> :e#<C-M>

" <C-O> is mapped to making this the only window.
" map <C-O> :only<C-M>
"
" <C-C> mapped to center the cursor like in emacs
map <C-C> zz
" Use <C-Q> to minimize other windows
map <C-Q> <C-W>

"<C-J> takes me to window below and <C-K> to window above just like j,k for lines
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h




" <C-O> is mapped to making this the only window.
" map <C-O> :only<C-M>
" Commenting this out since C-O and C-I are mapped to jump
" to previous locations :help jumps has useful stuff
"
" Also [m ]m etc for jumping from one java/python method to the next
" Also check g; g, for jumping across change lists (where previous edits were made)


" <C-v> lets me choose the buffer I want to go to.
" map <C-v> :ls!<CR>:buf

" F-8 is mapped to opening file manager to the directory of the current file
map <F8> :!dolphin %:p:h<CR>

" and F-7 to opening a new vim window to the  directory of the current file
" Not much used anymore once we started using NERDTree
map <F7> :sf %:p:h<CR>

" map F-3 to switch to a buffer
map <F3> :buffers<CR>:buffer

" j and k go through screen lines instead of file lines
map <silent> j gj
map <silent> k gk

" For long lines, e.g. editing text, put a break rather than wrapping around
setlocal linebreak
setlocal nolist
setlocal display+=lastline
setlocal nolist
setlocal display+=lastline


"in paste mode, it wont autoindent. press F12 to get back to normal
"set pastetoggle=<F12>


"Something about loading plugins from .vim/bundle
"execute pathogen#infect()

"Doesnt work very well. if a buffer already exists in another tab switch to it
"there rather than replacing the current window.
" se switchbuf=usetab

" change the mapleader from \ to ,
let mapleader=","

"use \N to load :NERDTree
map <Leader>N :NERDTree<cr>

"use Leader r to locate the current file with NerdTree
map <Leader>r :NERDTreeFind<cr>

"use Leader R to reepeat the last command. or Leader dot
map <Leader>R @:
map <Leader>. @:

" When in NerdTree, use C to make a directory the root. and m to create/update a file in the current directory.
" and cd to change CWD of vim to the current directory in NerdTree

"use \b to switch buffers - Show buffer menu
map <Leader>b <F3>

" Set paste mode.  useful for copying from clipboard without autoident etc.
" do se nopaste to unset this mode
map <Leader>p :se paste

" Copy and paste to clipboard
" Note that on linux(X11) we have 2 clipboards
" Primary (Selection buffer) - equal to * register in vim
" Clipobard(Cut buffer)  - equal to + register in vim
" The difference is that in X11, the moment you select something with mouse it is implicitly
" available in primary register and can be pasted by using the middle mouse button
" where as when you explicitly copy to clpboard it is available in Clipboard register
" and can be pasted by doing an explicit paste (e.g. Ctrl-Shift-V in the Terminal)
" 
"Text selected, or otherwise highlighted in one X11 app is available in the selection 
"buffer, and text explicitly copied or cut is available in the cut buffer.
"
"https://vim.fandom.com/wiki/Accessing_the_system_clipboard
"https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
map <Leader>P "+p
map <Leader>C "+yy

map <Leader>c "*yy
" Copy to clipboard. Broken because " is also start of comment
map <Leader>v "*p

" Use Leader v to paste from clipboard. Broken because " is also start of comment
map <Leader>, :e#<C-M>
" other file
map <Leader>n :n<C-M>
" next file
map <Leader>y :N<C-M>
" previous file. Sadly, No convenient key available right now :(
"
map <Leader>l :!ls<C-M>
" run ls
map <Leader>M :MRU<C-M>
" run MRU
map <Leader>B :bd<C-M>
" use ,B to close current buffer
map <Leader>s :split<C-M>
" \s to split the window in 2 horizontally. use vsplit for vertical split
map <Leader>h :hide<C-M>
" Leader h to close the current window
map <Leader>o :only<C-M>
" Leader o to close all other windows
map <Leader>V :e ~/.vimrc<C-M>
" Leader v to open .vimrc file
map <Leader>q :wq
" Write and quit
"
map <Leader>w :w<C-M>
" Save the current file
"
map <Leader>e :bro e<C-M>
" Open filemanager in directory  of current file.
" \o to close all other windows
map <Leader>V :e ~/.vimrc<C-M>
" \v to open .vimrc file
map <Leader>q :wq
" Write and quit
map <Leader>w :w<C-M>
" Save the current file

map <Leader>t gt
" Next Tab
map <Leader>T gT
" Previous tab
map <Leader>tt :tabnew
" New Tab
map <Leader>tc :tabc
" Close this tab

map <Leader>f :CtrlPMixed<C-M>
" run File Finder
map <Leader>F :echo expand('%:p')<C-M>
"Full path fofile
"
"map <Leader>F :echo @% <C-M>     "name of file
" \S to open our own poor scratch buffer
map <Leader>S :e ~/devel/notes-and-tips/buffer.txt<C-M>
"run current file as python program
"map <Leader>Y :!python %<C-M>

"Git Blame. Requires https://github.com/tpope/vim-fugitive to be installed
map <Leader>G :Gblame<C-M>

" Interesting way of doing things. Use Space as :
" https://engineering.purdue.edu/ece264/17au/static/.vimrc.html
" nmap <SPACE> :

" Save the pinky finger by using F5 for _ in insert mode.
" (! means insert mode i guess)
" map! <F5> _
"
"Quickfix window not yet learnt and enabled.
"
map <F8> :noh<CR>

"Use Ctrl-P for finding files anywhere with fuzzy search
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename search instead of full path.
" Press <c-r> to switch to regexp mode.
"
" https://kien.github.io/ctrlp.vim/
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/Desktop/*,*/Music/*,*/Downloads/*,*/Pictures/*,*/Dropbox/*,*/Applications/*,*/Amazon*/*,*.a,*.o,*.bmp,*.gif,*.ico,*.jpg

""r finds the nearest ancestor that contains .git
"let g:ctrlp_working_path_mode = 'rw'

"let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_working_path_mode = 'c' " Current file's directory. The worst.
"let g:ctrlp_working_path_mode = 'r' " the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs, and your own root markers defined with the g:ctrlp_root_markers option.
let g:ctrlp_working_path_mode = 0 " Disable this feature

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"the number of recently opened files you want CtrlP to remember: >
let g:ctrlp_mruf_max = 2500

"search by filename rather than fullpath
"Can be toggled on/off by pressing <c-d> inside the prompt.
let g:ctrlp_by_filename = 1

"Can be toggled on/off by pressing <c-r> inside the prompt.
let g:ctrlp_regexp = 0
let g:ctrlp_match_window='max:20,results:30'
let g:ctrlp_max_files=0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

set runtimepath^=~/.vim/bundle/ctrlp.vim

"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " let g:ctrlp_use_caching = 0
    " ag is fast enough that you can disable caching.
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

"In build version of NERDTree
"map <Leader>e :Vexplore

" \e to execute the current script
"map <Leader>e :!%

"\n to go to the Nerd Tree window and \m to go to the other window
"map <Leader>n 1
"map <Leader>m 2
"map <Leader>m 2

"

" \p to paste. There seems to be 2 clipboards on Linux.
"map <Leader>p "*p

" \t to open a new tab
" map <Leader>t :tabnew
"
" Tags database using YoucompleteMe
" nnoremap <leader>t :YcmCompleter GoTo<CR>

if has("autocmd")
    filetype plugin indent on
endif


let g:CommandTMaxFiles=2000000

" Change CWD to directory of current file
"set autochdir

set ttyfast

set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" No bells
set noerrorbells
set visualbell
set t_vb=

" fzf
" If installed using Homebrew
" set rtp+=/usr/local/opt/fzf
" If installed using git
" set rtp+=~/.fzf

au BufNewFile,BufRead Jenkinsfile setf groovy

" Use Ctrl-P to show the markdown preview when in a *.md file
let vim_markdown_preview_github=1

" Visual blocks
" press v and enter visual block mode, now keep pressing j,k, G to keep selecting
" lines as much as you want and once selected you can 
" indent the whole selection using =
" delete the whole selection using d
" to select the region between 2 braces you can vi( or vi)
" to delete the region between 2 braces you can di( or di)
" short cuts for above 2: vib and dib 
" (select everything between braces,or delete every thing between brances)
" check this: https://til.hashrocket.com/vim

" gi to go to last place of edit. this automatically  puts u in insert
"
" mode there. so change something in say line 10,  move around, a couple pages and then press
" gi to go back to line 10
"
" Ctrl-O and Ctrl-I to navigate the jumplist without going to edit mode.
" `` and '' to swap between current point and the immediate previous point
" :jumps to see the jumplist
"
" special marks : (. " ' ` 0 1 etc): https://vim.fandom.com/wiki/Using_marks
" https://vim.fandom.com/wiki/Using_marks
" g; and g, to move forward and backward in edit locations (not jumplist which
" is whereever you navigated to, not necessarily edited)
"
" cc       Delete the current line, set insert-mode,,
" https://gist.github.com/awidegreen/3854277 Nice cheat sheet.
" *    search for word under cursor (forward) and highlight occurrence (see incsearch, hlsearch below)
" %    jump from open/close ( / #if / ( / { to corresponding ) / #endif / } 
" [{   jump to start of current code block
" ]}   jump to end of current code block
" gd   jump to var declaration (see incsearch, hlsearch below)
" g;   jump back to last edited position.
" [m   jump to start of funtion body

"Load NERDTree automatically. commented for now..
" autocmd vimenter * NERDTree
" Once in nerd tree, type cd to change current directory to whereever the
" current file is. very useful

" Various useful tips from http://www.vim.org/tips
" pressing the * key searches for the word under cursor. 
" and #key does that in reverse order
" yank to * register puts things in windows clipboard. 
" Pasting from * register pastes from clipboard
" :Ex <directory name> is the equivalent of dired
" When in Ex C-m visits the file x opens it in the appropriate application.
" K under any word is help on that topic. 
" I think it also looks in the appropriate man page.
" :sf %:p:h  opens the 
" do a help on cmdline-history. Lots of cool stuff.
" for eg if you do : and then up/down arrow
" you can move across previous commands.
" registers - small letters are per file basis
" registers - cap letters are across files. 
" So you can go back from another file also
" :wa writes all modified files
" https://github.com/ciaranm/dotfiles has a great vimrc
" v gets you into visual block mode, move the up/down arrow to select a block
" of code. then use = to indent it. very usefulv gets you into visual block
" mode, move the up/down arrow to select a block of code. then use = to indent
" it. very useful
" split <file> to go to a file in another window
" split #<num> to go to buffer number num in anohter window
" Not clear: How to open a file in another <existing> window. specially needed
" when you are in a directory explorer.
" :ls shows the list of buffers. then b3 goes to 3rd buffer.
" :close closes the current window. :split splits the window 
" :only makes this the only window (closes all other windows)
" Q takes you to ex mode. you can then execute a bunch of commands and then type visual to
" go back
" :g is global :g/pattern/Command_To_Execute
" so :g/pat/s/pat/PAT/ will substitute pat with PAT.
" q: goes to the command-line-window which has history of all ur commands
"
" quickfix and grep http://usevim.com/2012/08/24/vim101-quickfix/ use :grep
" pattern % or :grep pattern * to do a quick grep. then do copen to open a
" window of all search results and this has links that you can jump to. also
" cn and cp takes you to next/previous result. Very cool.
"
"q: to get a list of commands history to choose from etc. q: or q?or q/
"
"http://mohtasham.info/article/how-work-tabs-vim/" for working with tabs
"gt goes to next tab. :tabedit file opens file in new tab.
":tabnew to create a new tab, gt is next tab gT is prev tab, 2gt is 2nd tab,
":tabedit <newFile> is new tab and edit the file there.
":switchbuf usetab seemed useful, but works only for quickfix. sad.tab
":tabc closes the current tab.
"
"http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
"
":so % to reload the vimrc file while editing it. :so ~/.vimrc or :so $MYVIMRC
"gg goes to the beginning of the file 3gg to line 3
"G goes to the end of the file.
"=G indents from cursor to end of the file. so you can do gg which takes you
"to line 1 and then do =G to indent the whole file.
"
"
":bd to close the current buffer
"setf xml to make the file behave like an xml file for indentation, syntax
"highlighiting etc.
"
" Some interesting options here:
" https://github.com/skwp/dotfiles/blob/master/vimrc
" https://stackoverflow.com/questions/11723169/selecting-entire-function-definition-in-vim/11723259  
"
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
"
" Moving to an outer block: https://vi.stackexchange.com/questions/16829/moving-to-an-outer-block
" 

"echo g:colors_name to get color scheme in gui
"
"Insert mode completion. Great stuff
"https://www.youtube.com/watch?v=3TX3kV3TICU
"https://georgebrock.github.io/talks/vim-completion/
"in insert mode: Ctrl-r <register>
"in insert mode: Ctrl-a -> Last inserted Text
"in insert mode: Ctrl-p -> word completion previous
"in insert mode: Ctrl-n -> word completion next
"in insert mode: Ctrl-x Ctrl-f  -> file names
"in insert mode: Ctrl-x Ctrl-l  -> complete line
"in insert mode: Ctrl-x Ctrl-l  -> complete line
"
"^r = insert text from a register
"^a = insert text from register '.'
"^p = completion menu
"^x = special "completion mode" submode of insert
"- - ^] = tag
"- - ^p = pull from previous context
"- - ^n = pull from next context
"- - ^f = file completion
"- - ^l = line
"- - ^o = omnicompletion
"- - ^k = dictionary
"  Sup
" g; to go to last edit
" ctrl-w      - erases word (insert mode...
" ctrl-u      - erases line  ...or on command line)
" mand many more in link above.
" Repeating commands use key-sequence @: Not clear how it works.
"
" Navigation across functions , paragraphs etc.
" try (( [[ {{ and )) ]] }}
" This can be used to even go to outer and outer code blocks within functions
"
" Selecting, copying deleting regions of code (functions, paragraphs etc.
" https://stackoverflow.com/questions/11840126/how-to-delete-a-paragraph-as-quickly-as-possible?noredirect=1&lq=1
"
" dap yap d} y} etc. 
"
" :marks and :ju to see all marks and the jump list
" Ctrl O and Ctrl I to move through the jump list (I think within a file). Needs more learning.
"
" Registers: https://www.brianstorti.com/vim-registers/
" To append to a register instead of replacing contents use upper-case " register
" " register. e.g. "ayy will set contents of register a while 
"list
"
" "Ayy will append line to register A
" if I use "by/foo then I'm yanking a copy of the text from here to the next line containing "foo" into the 'b' register. 
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
"
"
"There are 4 read only registers: "., "%, ": and "#
" % - file path, # - other file path, : - last command . - last inserted text
"
" We need to learn a lot more about visual mode.
" eg: instructions to delete a para:
" v   enter visual mode
" {   move to first brace in function (may have to press more than once)
" o   exchange cursor from top to bottom of selection
" }   extend selection to bottom of function
" d   delete selected text
" abc ghi
" Cheat sheet: https://www.fprintf.net/vimCheatSheet.html
" :registers to list all the registers and their contents.
" Special registers: 
" There are 4 read only registers: "., "%, ": and "#
" https://www.brianstorti.com/vim-registers/
" :version to display all kinds of interesting info
"
"
" video list to watch as tutorial
" https://www.youtube.com/watch?v=ZTCzWRqR_us&list=PL46-cKSxMYYCMpzXo6p0Cof8hJInYgohU&index=2
"
"
" help map-modes to learn about mapping and remaping keys.
" Check: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"
" Default Key Mappings: https://hea-www.harvard.edu/~fine/Tech/vi.html
"
" Visual Block Mode and how to  comment out a bunch of lines together:
" https://unix.stackexchange.com/questions/120615/how-to-comment-multiple-lines-at-once
"
" Ensure the temp dirs exist
call system("mkdir -p ~/.vim/tmp/swap")
call system("mkdir -p ~/.vim/tmp/backup")
call system("mkdir -p ~/.vim/tmp/undo")
" Change where we store swap/undo files
" set dir=~/.vim/tmp/swap/
" set backupdir=~/.vim/tmp/backup/
" set undodir=~/.vim/tmp/undo/
"
" :echo @% path of file
" :echo expand('%:p') Full path of file
"
"netrw as the directory browser
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"let g:netrw_banner = 0
" Start netrw directory browser immediately
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END
"
""
"" :registers to list all the registers and their contents.

" :registers to list all the registers and their contents.
" Special registers: 

let NERDTreeIgnore = ['\.pyc$']

" https://dougblack.io/words/a-good-vimrc.html
set runtimepath^=~/.vim/bundle/ctrlp.vim

se background=light

"Getting used to this font
"se guifont=Terminus\ 12
"se guifont=Liberation\ Mono\ 10
"se guifont=Ubuntu\ Mono:h16
"se guifont=Ubuntu\ Mono\ 10
"se guifont=BitStream\ Vera\ Sans\ Mono\ 10
"se guifont=BitstreamVeraSansMono-Roman:h12
se guifont=LiterationMonoPowerline:h14

" Only works if this is at the end.
" To get the color scheme: echo g:colors_name
" use :color <scheme> to change color from within vim
" Color scheme screen shots: https://vimcolors.com
if has("gui_macvim")
    se guifont=LiterationMonoPowerline:h14
    colorscheme PaperColor
    colorscheme gruvbox
    colorscheme flattened_light
    colorscheme bw
    "colorscheme PaperColor
    "colorscheme gruvbox
    "colorscheme flattened_light
    "colorscheme bw
    colorscheme solarized8_light
elseif has("gui_running")
    se guifont=Ubuntu\ Mono\ 12
   colorscheme torte

" colorscheme solarized8_light
"    colorscheme badwolf
"    colorscheme default
"    colorscheme dante
"    colorscheme flattened_light
"    colorscheme molokai
"    colorscheme kruby
"    colorscheme habiLight
"    colorscheme Dev_Delight
"    colorscheme anotherdark
"    colorscheme badwolf
"    colorscheme cake16
"    colorscheme peaksea
"    colorscheme 0x7A69_dark
"    colorscheme solarized8_light
"    colorscheme torte
    colorscheme PaperColor
else
"    colorscheme molokai
"    colorscheme 1989
"    colorscheme xoria256
"    colorscheme PaperColor
"    colorscheme Tomorrow
"    colorscheme badwolf
"    colorscheme solarized8_light
"    colorscheme torte
"    colorscheme flattened_light
"    colorscheme bw
"    colorscheme PaperColor
"    colorscheme fruidle
    colorscheme oceanlight
    colorscheme badwolf
    colorscheme torte
    colorscheme molokai
    colorscheme solarized8_light
endif

" Solarized options
" silent! colorscheme solarized
" colorscheme solarized8_light
"
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

" If the base settings don't repro, paste your existing config for YCM only,
" here:
" let g:ycm_....

" Load YCM (only)
let &rtp .= ',' . expand( '<sfile>:p:h' )
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:coc_global_extensions = [ 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml' , 'coc-java']

" Better display for messages
"set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
" don't give |ins-completion-menu| messages.
"set shortmess+=c
" always show signcolumns
"set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
"nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
"nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent> <leader>ld <Plug>(coc-definition)
"nmap <silent> <leader>lt <Plug>(coc-type-definition)
"nmap <silent> <leader>li <Plug>(coc-implementation)
"nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
"nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if &filetype == 'vim'
"    execute 'h '.expand('<cword>')
"  else
""    call CocAction('doHover')
"  endif
"endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
