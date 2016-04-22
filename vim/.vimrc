" vim:fdm=marker
set foldenable

if !has('nvim')
  set nocompatible
  set encoding=utf-8
endif

set showcmd                           " display incomplete commands

"" Leader
let mapleader=','                     " remap leader to ,

"" Theme
set background=dark
highlight LineNr ctermfg=242
highlight CursorLineNr ctermfg=255

"" Line numbers
set number                            " turn line numbers on

"" Buffer behaviour
set hidden                            " hide buffers instead of closing them

"" Whitespace
set nowrap                            " don't wrap lines
set tabstop=2 shiftwidth=2            " a tab is two spaces
set expandtab                         " convert tabs to spaces
set backspace=indent,eol,start        " backspace through everything in insert mode

"" Searching
set hlsearch                          " highlight matches
set incsearch                         " incremental searching
set ignorecase                        " searches are case insensitive
set smartcase                         "   unless they contain at least one capital letter
set grepprg=ag\ --nogroup\ --nocolor  " replace grep with ag

"" Turn off Backups and Swap Files
set nobackup
set noswapfile

"" Status line
set laststatus=2                      " enable status line

"" Whitespace highlighting
set listchars=tab:‣\ ,trail:.,space:.,eol:¬
highlight ExtraWhitespace ctermbg=196
augroup ExtraWhitespace
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup end

"" Automatically reload .vimrc on save
augroup SourceVimrc
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup end

"" Mouse behaviour
if has('mouse')
  set mouse=a                         " enable better mouse integration
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

"" Clipboard behaviour
set clipboard=unnamed                 " integrate with OS clipboard

" Key mappings {{{

" edit .vimrc
nnoremap <silent> <leader>ev :e $HOME/.dotfiles/vim/.vimrc<CR>

" duplicate line
nnoremap <C-d> yyp

" clear search highlight
nnoremap <silent> <F3> :set hlsearch!<CR>

" toggle display of whitespace characters
nnoremap <silent> <F4> :set list!<CR>

"" disable arrow keys
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

" }}}

" Plugin List (vim-plug) {{{
call plug#begin('~/.vim/bundle')

" general environment
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'mtth/scratch.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" search & navigation
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'

" editing
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" language/framework
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()
"" }}}

" Airline settings {{{
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
" }}}

" Tmuxline settings {{{
let g:tmuxline_powerline_separators=0
" }}}

" Ctrlp settings {{{
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
nnoremap <silent> <C-b> :CtrlPBuffer<CR>
nnoremap <silent> <C-m> :CtrlPMRUFiles<CR>
nnoremap <silent> <C-l> :CtrlPTag<CR>
" }}}

" Ag settings {{{
nnoremap \ :Ag<SPACE>
" }}}

" NERDTree settings {{{
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
" }}}

" GitGutter settings {{{
highlight GitGutterAdd ctermfg=11
highlight GitGutterChange ctermfg=172
highlight GitGutterDelete ctermfg=196
highlight GitGutterChangeDelete ctermfg=172
let g:gitgutter_sign_column_always=1
let g:gitgutter_highlight_lines=0
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='>'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='±'
let g:gitgutter_sign_removed_first_line='±'
nnoremap <silent> <C-g> :GitGutterLineHighlightsToggle<CR>
" }}}

" Tagbar settings {{{
let g:tagbar_autoclose=1
nnoremap <silent> <F9> :TagbarToggle<CR>
" }}}

" Scratch settings {{{
let g:scratch_autohide=&hidden
" }}}

" Startify settings {{{
let g:startify_custom_header=['']
let g:startify_list_order=[
        \ ['Bookmarks:'],
        \ 'bookmarks',
        \ ['Most recently used files:'],
        \ 'files',
        \ ['Most recently used files in the current directory:'],
        \ 'dir',
        \ ['Sessions:'],
        \ 'sessions',
        \ ]
let g:startify_bookmarks=['~/.vimrc']
" }}}

