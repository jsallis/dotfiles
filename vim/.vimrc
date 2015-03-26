set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-expand-region'
Plugin 'tomtom/tcomment_vim'
Plugin 'raimondi/delimitmate'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'gabesoft/vim-ags'
Plugin 'rking/ag.vim'

call vundle#end()

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
set mouse=a                    " enable mouse

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
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_show_hidden=1
nmap <silent> <C-b> :CtrlPBuffer<CR>
nmap <silent> <C-m> :CtrlPMRUFiles<CR>

"" git-gutter settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✱'
let g:gitgutter_sign_removed = '✖'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'
nmap <silent> <C-h> :GitGutterLineHighlightsToggle<CR>

"" Edit .vimrc
nmap <silent> <leader>ev :e $HOME/.dotfiles/vim/.vimrc<CR>

"" Automatically reload .vimrc and on save
autocmd BufWritePost .vimrc source %
