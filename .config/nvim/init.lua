-- ==============================
-- Basic Neovim Options
-- ==============================
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- recommended: use spaces instead of tabs

-- Set leader key BEFORE lazy setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ==============================
-- Bootstrap lazy.nvim
-- ==============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==============================
-- Plugin Setup
-- ==============================
require("lazy").setup({
  -- Telescope (fuzzy finder)
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
      pcall(require('telescope').load_extension, 'fzf')
    end,
  },

  -- ALE for linting (migrated from vim-plug)
  {
    'dense-analysis/ale',
    config = function()
      -- Linters
      vim.g.ale_linters = {
        python = {'ruff'},
        go = {'golangci-lint'},
        sh = {'shellcheck'},
      }
      
      -- Fixers / formatters
      vim.g.ale_fixers = {
        python = {'ruff'},
        go = {'gofmt'},
        sh = {'shfmt'},
      }
      
      -- Fix files on save
      vim.g.ale_fix_on_save = 1
      
      -- Less noisy linting
      vim.g.ale_lint_on_text_changed = 'never'
      vim.g.ale_lint_on_insert_leave = 1
      
      -- Show errors in gutter
      vim.g.ale_sign_column_always = 1
      
      -- Virtual text on cursor line
      vim.g.ale_virtualtext_cursor = 1
    end,
  },
})

-- ==============================
-- Keybindings
-- ==============================

-- Python shortcuts
vim.keymap.set('n', '<leader>p', ':!python3 %<CR>', { noremap = true, desc = 'Run current Python file' })
vim.keymap.set('n', '<leader>P', ':!python3 test.py<CR>', { noremap = true, desc = 'Run test.py' })

-- Terminal shortcuts
vim.keymap.set('n', '<leader>T', ':split | terminal python3 test.py<CR>', { noremap = true, desc = 'Run test.py in split terminal' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = 'Exit terminal mode' })

-- Better split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Buffer navigation
vim.keymap.set('n', '[b', ':bprevious<CR>', { noremap = true })
vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true })
