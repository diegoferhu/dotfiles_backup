set runtimepath^=~/.vim runtimepath+=~/.vim/after

let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
" Themes
Plug 'tanvirtin/monokai.nvim'
" IDE
" Status Bar
Plug 'itchyny/lightline.vim' " Dependency: status line
Plug 'maximbaz/lightline-ale' " Dependency: status bar line
Plug 'ryanoasis/vim-devicons'

" Typing
Plug 'alvan/vim-closetag' "Similar to emmet close tag html and react
Plug 'tpope/vim-surround' "Work in visual mode tu surround ani word with any tag how ( or {
Plug 'editorconfig/editorconfig-vim' "Use .editorconfig settings
Plug 'terryma/vim-multiple-cursors' "Can use multiple cursors
Plug 'mhinz/vim-signify' "Sign column to indicate added, modify and removed lines in file
Plug 'yggdroot/indentline' "Vertical lines at each indentation level for code indented with spaces
Plug 'preservim/nerdcommenter'
Plug 'frazrepo/vim-rainbow'

Plug 'easymotion/vim-easymotion' "Search faster word with 2 character
Plug 'christoomey/vim-tmux-navigator' "Move in Tmux panels

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Search Files, lines, etc
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'

"Linter
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Typescript and javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'github/copilot.vim'
call plug#end()

"Basic config
let mapleader=" " "Set space that main key to executed commands
  "Theme monokai config
colorscheme monokai_pro
 "nerdtree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen=1
  " Open nerdtree window on opening Vim
autocmd VimEnter * NERDTree | wincmd p
  "Close nerdtree automatically if it is theonly window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  "Vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
  " CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-css', 'coc-angular']
  "terminal neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=6 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
set splitright
  " default updatetime 4000ms is not good for async update
set updatetime=100
let g:NERDSpaceDelims = 1

"Own shortcuts
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nnoremap <Leader>kp :let @*=expand("%")<CR>
  "Resize panels
nnoremap <Leader>+ :resize 25<CR>
nnoremap <Leader>_ :resize 10<CR>
nnoremap <Leader>< 10<C-w><
nnoremap <Leader>> 10<C-w>>
  "Find
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>rg :Rg<CR>
  "Easymotion config
nmap <Leader>s <Plug>(easymotion-s2)
  "Nerdtree
nmap <Leader>nt :NERDTreeFind<CR>
  "Vimspector
nnoremap <C-d> :call vimspector#Launch()<CR>
nnoremap <C-b> :call vimspector#ToggleBreakpoint()<CR>
nmap <Leader>dq :VimspectorReset<CR>
nmap <Leader>5 <Plug>VimspectorContinue
nmap <Leader>% <Plug>VimspectorStop
nmap <Leader>6 <Plug>VimspectorPause
nmap <Leader>8 <Plug>VimspectorToggleBreakpoint
nmap <Leader>* <Plug>VimspectorAddFunctionBreakpoint
nmap <Leader>9 <Plug>VimspectorStepOver
nmap <Leader>0 <Plug>VimspectorStepInto
nmap <Leader>) <Plug>VimspectorStepOut
  " CoC extensions
  " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Terminal
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "bo 5sp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
