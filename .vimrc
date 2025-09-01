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
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-repeat' " https://github.com/tpope/vim-repeat
Plug 'mbbill/undotree' " https://github.com/mbbill/undotree
Plug 'Yggdroot/indentline' " https://github.com/Yggdroot/indentLine
Plug 'SirVer/ultisnips' " https://github.com/sirver/UltiSnips
Plug 'honza/vim-snippets' " https://github.com/honza/vim-snippets
Plug 'andrewstuart/vim-kubernetes' " https://github.com/andrewstuart/vim-kubernetes
" https://github.com/pearofducks/ansible-vim
" https://github.com/hashivim/vim-terraform
" https://github.com/towolf/vim-helm
" https://github.com/mattn/webapi-vim
" https://github.com/pedrohdz/vim-yaml-folds
" https://github.com/dense-analysis/ale
" https://github.com/adrienverge/yamllint
call plug#end()


""""""""""""""""""""""""""""""
" basic config
""""""""""""""""""""""""""""""

" use realtive line numbers
set relativenumber

" enable syntax highlighting
syntax on

" map space as leader key
nnoremap <SPACE> <Nop>
let mapleader = " " " map leader to Space

" indentation
set expandtab
set tabstop=2
set shiftwidth=2

" 
set list
set listchars=tab:»·,trail:·

""""""""""""""""""""""""""""""
" plugin config
""""""""""""""""""""""""""""""

" vim-slime config
let g:slime_target = "tmux"
"send visual selection
xmap <leader>s <Plug>SlimeRegionSend
"send based on motion or text object
nmap <leader>s <Plug>SlimeMotionSend
"send line
nmap <leader>ss <Plug>SlimeLineSend

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"nicer indentation lines
let g:indentLine_char = '⦙'

" vim tmux navigation
map  <Esc>^[[1;5A <C-Up>
map  <Esc>^[[1;5B <C-Down>
map  <Esc>^[[1;5D <C-Left>
map  <Esc>^[[1;5C <C-Right>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :<C-U>TmuxNavigateRight<cr>

" undotree
nnoremap <F5> :UndotreeToggle<CR>

" ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
