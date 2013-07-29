"****************************************************************************************************
" Configuration file for gvim
"****************************************************************************************************

:colorscheme darkblue
set gfn=Terminus\ Bold\ 18

set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode

" Now we set some defaults for the editor 

set scrolloff=5
set autoindent		" always set autoindenting on
set expandtab
set showbreak=> 
set shiftwidth=2
set tabstop=2
set textwidth=0		" Don't wrap words by default
"set nobackup		  " Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


" Vim5 comes with syntaxhighlighting. If you want to enable syntaxhightlighting
" by default uncomment the next three lines. 

if has("syntax")
  syntax on		" Default to no syntax highlightning 
endif

highlight nontext ctermfg=darkgray 
highlight Folded ctermfg=3 ctermbg=black
highlight LineNr ctermfg=6

"inoremap  
"cnoremap  
"imap [4~ <End>
"cmap [4~ <End>


" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smartcase		" Do case insensitive matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hlsearch
set hh=20
set statusline=%<%f%h%m%r\ %y\ %w(%b,0x%B)%=%l(of\ %L),%c%V\ %P
set laststatus=2
"let &foldmethod="marker"
set foldmethod=indent
set number
filetype plugin on
set sessionoptions=blank,buffers,curdir,folds,help,localoptions,winsize
set path=,/usr/include,/usr/src/dev/gcc2/include/g++-3
set previewheight=15
set tags+=~/.vimsessions/tags

let NERDTreeWinPos="right"
let NERDTreeShowHidden=1


"****************************************************************************************************
" vim -b : ÒÅÄÁËÔÉÒÏ×ÁÎÉÅ ÂÉÎÁÒÎÏÇÏ ÆÁÊÌÁ Ó xxd!
"****************************************************************************************************
	augroup Binary
	  au!
	  au BufReadPre  *.exe,*.com let &bin=1
	  au BufReadPost *.exe,*.com if &bin | %!xxd
	  au BufReadPost *.exe,*.com set ft=xxd | endif
	  au BufWritePre *.exe,*.com if &bin | %!xxd -r
	  au BufWritePre *.exe,*.com endif
	  au BufWritePost *.exe,*.com if &bin | %!xxd
	  au BufWritePost *.exe,*.com set nomod | endif
	augroup END

"****************************************************************************************************
"Key Mappings
"****************************************************************************************************

nmap <Tab> <C-w><C-p> 
"nmap <F9> :w<CR>:make<CR>
nmap <S-Right> 10<Right>
nmap <S-Left>  10<Left> 


"Menu with useful commands
:amenu <silent>&Useful\ commands.NERDTree :NERDTree<cr> 

"Langmap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


"****************************************************************************************************
"Bundle configuration
"****************************************************************************************************

filetype off                  
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/tComment'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on   

