colorscheme base16-tomorrow
set guifont=Source\ Code\ Pro\ Light:h16
set linespace=2
set antialias

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
end

"" edit .gvimrc
nmap <silent> <leader>eg :e $HOME/.dotfiles/vim/.gvimrc<CR>

autocmd BufWritePost .gvimrc source %
