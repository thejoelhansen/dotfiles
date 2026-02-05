" Config lives in ~/.config -> ~/.dotfiles/.config/nvim/init.vim
" Plugins live in ~/.local/share/nvim/plugged
" Inside nvim run :PlugInstall

" ------------------------------
" Basic Neovim options
" ------------------------------
syntax on
filetype plugin indent on
set number
set tabstop=4
set shiftwidth=4

" ------------------------------
" Plugin manager (vim-plug)
" ------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" ALE for linting
Plug 'dense-analysis/ale'

call plug#end()   " <-- must be AFTER all Plug '...' lines

" ------------------------------
" ALE configuration
" ------------------------------
" Linting
let g:ale_linters = {
\   'python': ['ruff'],
\   'go': ['golangci-lint'],
\   'sh': ['shellcheck'],
\}

" Fixing / formatting
let g:ale_fixers = {
\   'python': ['ruff'],
\   'go': ['gofmt'],
\   'sh': ['shfmt'],
\}

" Fix files on save
let g:ale_fix_on_save = 1

" Less noisy linting
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

" Show errors in gutter
let g:ale_sign_column_always = 1

" Virtual text on cursor line
let g:ale_virtualtext_cursor = 1

