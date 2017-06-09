set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ------ Tooling 
"
" Git 
Plugin 'tpope/vim-fugitive'

" Magic?
Plugin 'tpope/vim-dispatch'

" Git status gutter indicators
Plugin 'airblade/vim-gitgutter'

" Auto closing braces - so nice!
Plugin 'jiangmiao/auto-pairs'

" Tag/Class hierarchy window
Plugin 'majutsushi/tagbar'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Code Completion
Plugin 'Valloric/YouCompleteMe'

" Insert command completions
Plugin 'ervandew/supertab'

" POWAAALINE
Plugin 'powerline/powerline'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" tmux stuff
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

" ------ Colors!

" ps_color colorscheme theme
Plugin 'crucerucalin/peaksea.vim'

" Another color theme
Plugin 'obsidian2.vim'

" Rainbow colored parens
Plugin 'kien/rainbow_parentheses.vim'

" All the colors!
Plugin 'flazz/vim-colorschemes'

" ------ Language Support Plugins

" Pico 8 Syntax Highlighting
Plugin 'justinj/vim-pico8-syntax'

" React stuff
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'facebook/vim-flow'

" Swift stuff
Plugin 'keith/Swift.vim'
Plugin 'keith/sourcekittendaemon.vim'
Plugin 'gfontenot/vim-xcode'

" Syntax highlighting for Rust
Plugin 'rust-lang/rust.vim'

" Syntax highlighting and stuff for Ruby when I need to go to Rubytown
Plugin 'vim-ruby/vim-ruby'

" For all your C/C++ needs!
Plugin 'c.vim'

" C# Support
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'OrangeT/vim-csharp'

" General syntax amazingness
Plugin 'scrooloose/syntastic'

" Syntax suport for Haxe
Plugin 'jdonaldson/vaxe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" My vim options
set expandtab
set tabstop=4
set shiftwidth=4
set number
set wildmode=full
set wildmenu
set wildignore=*.swp,*.bak
set modeline
set autoindent
set copyindent
set cindent
set hidden
set nowrap
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set nobackup
set noswapfile
set splitbelow

" Make :Explore list look better
let g:netrw_liststyle=3

" Git gutter optoins
set updatetime=250

" Color scheme options
syntax on
if ! has("gui_running")
    set t_Co=256
endif
" feel free to choose :set background=light for a different style
set background=dark
colors mustang

let mapleader=" "

" Set up max line length highlight to 100 characters
call matchadd('ColorColumn', '\%81v', 100)

" Remaps
map <leader>ff :Ex<CR>
nmap <leader>o :CtrlP<CR>
nmap <leader>p :TagbarToggle<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <leader>vp :VimuxPromptCommand<CR>

" Configurable options from plugins
let g:ycm_always_populate_location_list = 1
let g:clang_complete_macros = 1
let g:ycm_rust_src_path = '/Users/sleroux/development/rust/src'
let g:netrw_liststyle=3
