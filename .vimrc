""""""""""""""""""""""""""""""
" basic config
""""""""""""""""""""""""""""""
scriptencoding utf-8
" map space as leader key
" nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" Filetypes
" This enables file type detection (like filetype on)
" and also loading plugins and indentation per filetype
filetype plugin indent on
syntax enable    " enable syntax highlighting

set autoindent   " Copy indent from current line when starting a new line
set clipboard^=unnamed,unnamedplus " use system clipboard (this needs as version of vim with clipboard support - e.g. vim-gtk, check with `vim --version | grep clipboard`)
set showcmd      " display incomplete commands
set showmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set hidden       " Handle multiple buffers better
set wildmenu     " enhanced command line completion
set wildmode=list:longest " complete files like a shell

" Search
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

" Global tabs/spaces
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

" Security
set nomodeline " Disable modelines to prevent arbitrary code execution from untrusted files
set modelines=0

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
Plug 'christoomey/vim-tmux-navigator', { 'commit': 'c45243dc1f32ac6bcf6068e5300f3b2b237e576a' } " https://github.com/christoomey/vim-tmux-navigator
" Plug 'preservim/nerdtree', { 'commit': '9b465acb2745beb988eff3c1e4aa75f349738230' } " https://github.com/preservim/nerdtree
" Plug 'jpalardy/vim-slime', { 'commit': '67b24bf93cff3ac39db94694a7aefcdb3f44b927' } " https://github.com/jpalardy/vim-slime
Plug 'easymotion/vim-easymotion', { 'commit': 'b3cfab2a6302b3b39f53d9fd2cd997e1127d7878' } " https://github.com/easymotion/vim-easymotion
" Plug 'justinmk/vim-sneak', { 'commit': '18b1faf020e6a66c1ce09b3ff5e6b6feb182973b' } " https://github.com/justinmk/vim-sneak
Plug 'tpope/vim-surround', { 'commit': '3d188ed2113431cf8dac77be61b842acb64433d9' } " https://github.com/tpope/vim-surround
Plug 'tpope/vim-commentary', { 'commit': '64a654ef4a20db1727938338310209b6a63f60c9' } " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-repeat', { 'commit': '65846025c15494983dafe5e3b46c8f88ab2e9635' } " https://github.com/tpope/vim-repeat
" Plug 'mbbill/undotree', { 'commit': 'fe9a9d0645f0f5532360b5e5f5c550d7bb4f1869' } " https://github.com/mbbill/undotree
Plug 'machakann/vim-swap', { 'commit': '9358bfdc5e377aa13e7c2c2dd8699ba32b0dcf83' } " https://github.com/machakann/vim-swap
" Plug 'svermeulen/vim-easyclip', { 'commit': '4601faae051bec8ced37b452b32defca62a633f3' } " https://github.com/svermeulen/vim-easyclip
Plug 'tommcdo/vim-lion', { 'commit': 'ce46593ecd60e6051fb6e4d3986d2fc9f5a618b1' } " https://github.com/tommcdo/vim-lion
Plug 'SirVer/ultisnips', { 'commit': 'b22a86f9dcc5257624bff3c72d8b902eac468aad' } " https://github.com/sirver/UltiSnips
Plug 'honza/vim-snippets', { 'commit': 'f371d635f6f6350d34bbb483e37e383db322d145' } " https://github.com/honza/vim-snippets
" Plug 'junegunn/fzf', { 'commit': '14564e4fc7e7d688afe607f4c71ec938c2a8b44a', 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim', { 'commit': 'ddc14a6a5471147e2a38e6b32a7268282f669b0a' }
Plug 'Einenlum/yaml-revealer', { 'commit': 'd02928aa452b54368fb613e6d5f3ed73a63d3882' } " https://github.com/Einenlum/yaml-revealer
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
"let g:slime_target = "tmux"
""send visual selection
"xmap <leader>/ <Plug>SlimeRegionSend
""send based on motion or text object
"nmap <leader>/ <Plug>SlimeMotionSend
""send line
"nmap <leader>// <Plug>SlimeLineSend

" Nerdtree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"nicer indentation lines
" let g:indentLine_char = '⦙'

" undotree
" nnoremap <F6> :UndotreeToggle<CR>

" ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<c-x>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=[$HOME."/UltiSnips"]

" vim-revealer
let g:yaml_revealer_separator = "."
let g:yaml_revealer_compact_separator = 1
let g:yaml_revealer_include_current_key = 1
let g:yaml_revealer_list_item_names = 1


""""""""""""""""""""""""""""""
" misc
""""""""""""""""""""""""""""""
" https://vim.fandom.com/wiki/Change_between_backslash_and_forward_slash
nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>

" custom text-object for numerical values
" https://stackoverflow.com/questions/30873668/how-can-i-change-in-number-or-change-in-digits-in-vim/30874254
" function! Numbers()
"     call search('\d\([^0-9\.]\|$\)', 'cW')
"     normal v
"     call search('\(^\|[^0-9\.]\d\)', 'becW')
" endfunction
" xnoremap in :<C-u>call Numbers()<CR>
" onoremap in :normal vin<CR>

" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
" this functionality is provided with easyclip plugin (which allows motions)
" :nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
