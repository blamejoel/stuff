set cursorline
set background=dark
set colorcolumn=80,120
set spell
set spellsuggest=best,10
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4
set number
set showmatch
set incsearch
set hlsearch
set t_Co=256
syntax enable
colorscheme molokai
hi Normal ctermbg=none
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 commentstring=<!--%s-->
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
filetype indent on
