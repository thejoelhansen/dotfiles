" Config lives in ~/.config -> ~/.dotfiles/.config/nvim/init.vim
" Plugins live in ~/.local/share/nvim/plugged
" Inside nvim run :PlugInstall

syntax on
filetype plugin indent on

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

call plug#end()

" Python linter
let g:ale_python_ruff_executable = '/opt/homebrew/bin/ruff'

let g:ale_linters = {
\   'python': ['ruff'],
\}

let g:ale_fixers = {
\   'python': ['ruff'],
\}

let g:ale_fix_on_save = 1

set number " Line numbers
set tabstop=4 " Tabs characters are 4 spaces wide (down from default of 8)
set shiftwidth=4 " Indent tabs are 4 spaces wide

