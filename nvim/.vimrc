set number "Set number in left navigation
set mouse=a "Enabled mouse interaction
set numberwidth=1 "Width of number in left navigation
set clipboard=unnamed "Enabled clipboard to ctrl + c and mouse options
syntax enable "Enabled syntax to use themes
set showcmd "Show executed command at the windows bottom
set ruler "Show position of file at the windows bottom
set encoding=utf-8 "Set encoding
set showmatch "Show parenthesis that open or close
set sw=2 "Ident with 2 spaces
set relativenumber "Where it is cursor position count other lines
set laststatus=2 "Show bottom menu
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:vimspector_base_dir='/Users/diegohurtado/.vim/plugged/vimspector'
