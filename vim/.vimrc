set nocompatible        " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd             " display incomplete commands

"" Plugins (vim-plug)

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" general environment
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'majutsushi/tagbar'
Plug 'mtth/scratch.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-fugitive'

" search & navigation
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" editing
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" theme
Plug 'chriskempson/base16-vim'

" language/framework
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'

call plug#end()

"" Disable Arrow keys
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

"" Leader
let mapleader=","               " remap leader from \ to ,

"" Theme
set background=dark
highlight clear SignColumn

"" Line numbers
set number                      " turn line numbers on

"" Buffer behaviour
set hidden                      " hide buffers instead of closing them

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Turn off Backups and Swap Files
set nobackup
set noswapfile

"" Status line
set laststatus=2               " enable status line

"" Mouse behaviour
if has('mouse')
  set mouse=a                  " enable better mouse integration
  set ttymouse=xterm2
endif

"" Clipboard behaviour
set clipboard=unnamed          " integrate with OS clipboard

"" Clear search highlight with F3
nnoremap <F3> :set hlsearch!<CR>

"" Toggle display of whitespace characters
nmap <silent> <leader>l :set list!<CR>

"" Airline settings
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_theme='simple'
let g:airline#extensions#ctrlp#color_template='simple'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#format='FormatBranchName'

function! FormatBranchName(name)
  if strlen(a:name)
    return '[' . a:name . ']'
  else
    return a:name
  endif
endfunction

"" Ctrlp settings
nmap <silent> <C-b> :CtrlPBuffer<CR>
nmap <silent> <C-m> :CtrlPMRUFiles<CR>
nmap <silent> <C-l> :CtrlPTag<CR>
let g:ctrlp_working_path_mode='ra'
if executable('ag')
  let g:ctrlp_user_command='ag %s --nocolor --ignore-case --files-with-matches --skip-vcs-ignores
    \ --ignore .git
    \ --ignore .hg
    \ --ignore .svn
    \ --ignore bower_components
    \ --ignore node_modules
    \ --ignore venv
    \ --ignore Godeps
    \ --ignore "**/*.pyc"
    \ --ignore "**/*.DS_Store"
    \ -g ""'
  let g:ctrlp_use_caching=0
else
  let g:ctrlp_custom_ignore={
    \ 'dir':  '\v\.(git|hg|svn)$|bower_components$|node_modules$|venv$|Godeps$',
    \ 'file': '\v\.(pyc|DS_Store)$'
    \ }
endif

"" Ag settings
nnoremap \ :Ag<SPACE>

"" Gitgutter settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✱'
let g:gitgutter_sign_removed = '✖'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'
nmap <silent> <C-h> :GitGutterLineHighlightsToggle<CR>

"" Tagbar settings
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autoclose = 1

"" Scratch settings
let g:scratch_autohide = &hidden

"" Edit .vimrc
nmap <silent> <leader>ev :e $HOME/.dotfiles/vim/.vimrc<CR>

"" Automatically reload .vimrc and on save
autocmd BufWritePost .vimrc source %
