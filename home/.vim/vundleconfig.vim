" Vundle Config
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" SYNTASTIV syntax checker
Plugin 'scrooloose/syntastic'

" NERDTREE file browser
Plugin 'scrooloose/nerdtree'

" VIM-AIRLINE status bar / tabline
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" VIM-SURROUND quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" JSON better json for vim
Plugin 'elzr/vim-json'

" PREVIM markdown etc preview
Plugin 'kannokanno/previm'
let g:previm_open_cmd = 'chromium'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" STARTIFY fancy start screen
Plugin 'mhinz/vim-startify'
let g:startify_bookmarks = [ '~/.bashrc', '~/.vimrc' ]
let g:startify_skiplist = [ 'COMMIT_EDITMSG' ]

" NUMBERS improves line numbers
 Plugin 'myusuf3/numbers.vim'

" RAINBOW
Plugin 'luochen1990/rainbow'

" Vim Go
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" End Vundle Config
" ---------------------------------------------------------------------------
