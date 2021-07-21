call plug#begin('~/.local/share/nvim/plugged')

" Make vim even harder to use lol
Plug 'takac/vim-hardtime'

" Git
Plug 'tpope/vim-fugitive'

" Magico?
Plug 'tpope/vim-dispatch'

Plug 'janko/vim-test'

" Tmux command integration
Plug 'benmills/vimux'

" Run ruby tests from vim in tmux
Plug 'pgr0ss/vimux-ruby-test'

" Rails integration
Plug 'tpope/vim-rails'

" Git status gutter indicators
Plug 'airblade/vim-gitgutter'

" Auto closing braces - so nice!
Plug 'jiangmiao/auto-pairs'

" Tag/Class hierarchy window
Plug 'majutsushi/tagbar'

" POWAAALINE
Plug 'powerline/powerline'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Dash
Plug 'rizzatti/dash.vim'

" Markdown is awesome
Plug 'JamshedVesuna/vim-markdown-preview'

"Plug 'ervandew/supertab'

" Comments
Plug 'scrooloose/nerdcommenter'

" ps_color colorscheme theme
Plug 'crucerucalin/peaksea.vim'

" All the colors!
Plug 'flazz/vim-colorschemes'

" Pico 8 Syntax Highlighting
Plug 'justinj/vim-pico8-syntax'

" React stuff
Plug 'mxw/vim-jsx'
Plug 'facebook/vim-flow'

Plug 'ngmy/vim-rubocop'

" Rust support
Plug 'rust-lang/rust.vim'

" Syntax suport for Haxe
Plug 'jdonaldson/vaxe'

Plug 'vim-scripts/ShaderHighLight'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" ALE for realtime linting
Plug 'w0rp/ale'

" FZF fuzzy finding so good!
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

" Completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use Neovim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Unity/C# Plugins
Plug 'OmniSharp/omnisharp-vim'

" All the language support
Plug 'sheerun/vim-polyglot'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

let g:coc_global_extensions=[ 'coc-omnisharp',  'coc-tsserver', 'coc-python' ]

" Colors -------------------------------------

syntax on
if ! has("gui_running")
    set t_Co=256
endif

set background=dark
colors mustang

call matchadd('ColorColumn', '\%81v', 100)

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_list_hide = '\.meta'

" Remaps -------------------------------------

let mapleader="\<Space>"

" Better movement
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
map <leader>ev :!nvim ~/.config/nvim/init.vim<CR>
map <leader>ff :Ex<CR>

" Better commands
nnoremap <leader>w :w<CR>
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Dash integration
map <leader>d <Plug>DashSearch

map <C-P> :Files<CR>
map <C-s> :ALEFix<CR>

" Ctrl mappings for runnign tests using vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extra=+f --exclude=.git,pkg --languages=-sql<cr><cr>

" Use Mac clipboard for yanks
set clipboard=unnamed

" Fast and fun searching ---------------------

set grepprg=rg

set softtabstop=2 tabstop=2 shiftwidth=2 expandtab

set number

" Markdown Previewing
let vim_markdown_preview_github=1

" Supertab Configuration
" Don't add newline after tabbing
"let g:SuperTabCrMapping = 1

" Git gutter customizations
"let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•↑'
let g:gitgutter_sign_modified_removed = '•'

" ALE configuration
let g:ale_fix_on_save = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_linters = {}
let g:ale_fixers = {
  \  'javascript': ['eslint'],
  \ }

let g:ale_linters.ruby = [
      \ 'rubocop',
      \ ]

let g:ale_ruby_rubocop_executable = 'bundle'  "use local bundle exec version

let g:ale_linters.javascript = [
      \ 'eslint'
      \ ]

let g:ale_linters.typescript = [
      \ 'tslint',
      \ 'tsserver',
      \ 'typecheck'
      \ ]

let g:ale_linters.cs = [
      \ 'OmniSharp',
      \ ]

let g:ale_fixers['*'] = [
      \ 'remove_trailing_lines',
      \ 'trim_whitespace'
      \ ]

hi ALEErrorSign ctermfg=141
hi ALEWarningSign ctermfg=141
hi DiffAdd ctermfg=148 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=197 ctermbg=NONE cterm=bold guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=208 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold

" Python Neovim setup
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

" Configure vim-test
let test#strategy = "vimux"
let test#ruby#minitest#executable = 'dev test'

" Unity/C# Configurations
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_use_mono = 1

augroup omnisharp_commands
    autocmd!

    autocmd FileType cs setlocal shiftwidth=4 tabstop=4
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    "autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    "autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

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
