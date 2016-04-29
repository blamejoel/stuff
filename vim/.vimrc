set background=dark
set t_Co=256
"colorscheme PaperColor
"colorscheme onedark
colorscheme molokai
"colorscheme primary
"colorscheme solarized
set cursorline
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
syntax enable
hi Normal ctermbg=none
hi CursorLine cterm=underline term=underline
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 commentstring=<!--%s-->
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
filetype indent on
