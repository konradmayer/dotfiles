""""""""""""""""""""""""""""""
" basic config
""""""""""""""""""""""""""""""
" map space as leader key
" nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" Filetypes
" This enables file type detection (like filetype on)
" and also loading plugins and indentation per filetype
filetype plugin indent on
syntax enable    " enable syntax highlighting

set autoindent   " Copy indent from current line when starting a new line
set clipboard+=unnamedplus " use system clipboard
set showcmd      " display incomplete commands
set showmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set hidden       " Handle multiple buffers better
set wildmenu     " enhanced command line completion
set wildmode=list:longest " complete files like a shell

""" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set relativenumber "show relative line number
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches

set wrap         " turn on line wrapping
set scrolloff=3  " show 3 lines of context around cursor
set display+=lastline "Display as much as possible of a window's last line
set title        " show terminal title
set visualbell   " no beeping
set list         " show invisible characters

"" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set expandtab    " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2
set laststatus=2 " Always show a status line
set listchars=tab:»·,trail:· " show tabs and trailing spaces

set nobackup " no backups
set nowritebackup " No backups
set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of Vim
set nofoldenable " Disable folding

""""""""""""""""""""""""""""""
" plugin config
""""""""""""""""""""""""""""""

" use vimplug to manage plugins

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Plugins:
call plug#begin()
Plug 'christoomey/vim-tmux-navigator' " https://github.com/christoomey/vim-tmux-navigator
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'jpalardy/vim-slime' " https://github.com/jpalardy/vim-slime
Plug 'easymotion/vim-easymotion' " https://github.com/easymotion/vim-easymotion
Plug 'justinmk/vim-sneak' " https://github.com/justinmk/vim-sneak
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-repeat' " https://github.com/tpope/vim-repeat
Plug 'mbbill/undotree' " https://github.com/mbbill/undotree
Plug 'Yggdroot/indentline' " https://github.com/Yggdroot/indentLine
Plug 'machakann/vim-swap' " https://github.com/machakann/vim-swap
Plug 'svermeulen/vim-easyclip' " https://github.com/svermeulen/vim-easyclip
Plug 'tommcdo/vim-lion' " https://github.com/tommcdo/vim-lion
Plug 'vim-scripts/VimCompletesMe' " https://github.com/vim-scripts/VimCompletesMe
Plug 'SirVer/ultisnips' " https://github.com/sirver/UltiSnips
Plug 'honza/vim-snippets' " https://github.com/honza/vim-snippets
"" Other plugins to explore
" Plug 'ctrlpvim/ctrlp.vim' " https://github.com/ctrlpvim/ctrlp.vim
" Plug 'mileszs/ack.vim' " https://github.com/mileszs/ack.vim
" Plug 'andrewstuart/vim-kubernetes' " https://github.com/andrewstuart/vim-kubernetes
" https://github.com/pearofducks/ansible-vim
" https://github.com/hashivim/vim-terraform
" https://github.com/towolf/vim-helm
" https://github.com/mattn/webapi-vim
" https://github.com/pedrohdz/vim-yaml-folds
" https://github.com/dense-analysis/ale
" https://github.com/preservim/vim-markdown
" https://github.com/adrienverge/yamllint
call plug#end()

" vim-slime config
let g:slime_target = "tmux"
"send visual selection
xmap <leader>/ <Plug>SlimeRegionSend
"send based on motion or text object
nmap <leader>/ <Plug>SlimeMotionSend
"send line
nmap <leader>// <Plug>SlimeLineSend

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"nicer indentation lines
let g:indentLine_char = '⦙'

" undotree
nnoremap <F6> :UndotreeToggle<CR>

" ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/UltiSnips"]


""""""""""""""""""""""""""""""
" misc
""""""""""""""""""""""""""""""
" https://vim.fandom.com/wiki/Change_between_backslash_and_forward_slash
nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>

" custom text-object for numerical values
" https://stackoverflow.com/questions/30873668/how-can-i-change-in-number-or-change-in-digits-in-vim/30874254
function! Numbers()
    call search('\d\([^0-9\.]\|$\)', 'cW')
    normal v
    call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction
xnoremap in :<C-u>call Numbers()<CR>
onoremap in :normal vin<CR>

" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
" this functionality is provided with easyclip plugin (which allows motions)
" :nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
