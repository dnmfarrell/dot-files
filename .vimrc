"TO DO
"leaders
"motions
"manual
"macros
"key remap
"vim script steve loche learning vimscript the hard way
"surround.vim
"screen/tmux

"set t_Co=16
colo desert256
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
nohl

"remap arrow keys
nnoremap l :w<CR>:bn<CR>
nnoremap h :w<CR>:bp<CR>

"sensible indenting
set autoindent
set cindent

"unless it's a CSS
autocmd BufNewFile,BufRead *.css set nocindent

inoremap # X<C-H>#|
nnoremap <silent> >> :call ShiftLine()<CR>|

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

" Use space to jump down a page (like browsers do)...
nnoremap <space> 

" turn omni complete
syntax on
filetype on
filetype plugin on
filetype indent on
au Bufnewfile,bufRead *.tt set filetype=html

"Show trailing whitespace and tab characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"Remap semi-colon to colon and vice versa
nnoremap ; :
nnoremap : ;

"Delete in normal mode switches off highlighting till next search...
nnoremap <Bs> :nohlsearch<CR>

"=====[ show help files in a new tab ]==============

"Only apply to .txt files...
augroup helpintabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help' && g:help_in_tabs
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

"use Perl style regexes
nnoremap / :M/
nnoremap ,/ /

"====[ Use persistent undo ]=================

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/tmp/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile
endif

autocmd BufWritePost *.pm,*.t,*.pl echom system("perl -Ilib -c " . expand('%:p'))
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" paste mode - this will avoid unexpected effects when you
" " cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F12>

function! CheckSyntax ()
    !perl -cIlib %
endfunction
