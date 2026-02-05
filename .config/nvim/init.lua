-- Shortcuts

vim.g.mapleader = ' '  -- Use space,

-- Run current Python file
vim.keymap.set('n', '<leader>p', ':!python3 %<CR>', { noremap = true })
vim.keymap.set('n', '<leader>P', ':!python3 test.py', { noremap = true })

-- Other things
