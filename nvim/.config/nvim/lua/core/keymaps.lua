-- Resize windows easily (ALT + ARROWS)
vim.api.nvim_set_keymap('n', '<M-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })

-- Map :noh to LEADER + h
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })

-- mg979/vim-visual-multi keymaps
-- replace ctrl + n with ctrl + d 
vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(VM-Find-Under)', { noremap = false })

-- map gd to coc-definition and gD to coc-implementation and gr to coc-references
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = false })
vim.api.nvim_set_keymap('n', 'gD', '<Plug>(coc-implementation)', { noremap = false })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = false })
-- quickfix
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', { noremap = false })

-- -- Maj + Enter to validate coc completion
-- vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })

-- gb to go back to previous location
vim.api.nvim_set_keymap('n', 'gb', '<C-o>', { noremap = true, silent = true })
-- gn to back to next location
vim.api.nvim_set_keymap('n', 'gn', '<C-i>', { noremap = true, silent = true })

-- Map Ctrl + i to indent in insert, visual and normal mode
-- vim.api.nvim_set_keymap('i', '<leader>i', '<C-o>>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>i', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '>>', { noremap = true, silent = true })
 
-- Map Ctrl + u to unindent in leader>srt, visual and normal mode 
-- vim.api.nvim_set_keymap('i', '<leader>u', '<C-o><<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>u', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', '<<', { noremap = true, silent = true })

-- F5 to toggle undo tree and focus on it
vim.api.nvim_set_keymap('n', '<F5>', ':UndotreeToggle<CR>:wincmd p<CR>', { noremap = true, silent = true })

-- LEADER + e to create file on current directory
vim.api.nvim_set_keymap('n', '<leader>ee', ':e %:p:h/<C-d>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':e %:p:h/<C-d>', { noremap = true, silent = true })

-- LEADER + ev to create file on current directory and open it on vertical split
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsp %:h/<C-d>', { noremap = true, silent = true })

-- LEADER + g to open neogit
vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', { noremap = true, silent = true })

-- LEADER + b to open Telescope buffers
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- LEADER + c to open Telescope commands
vim.api.nvim_set_keymap('n', '<leader>c', ':Telescope commands<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':Telescope commands<CR>', { noremap = true, silent = true })

-- LEADER + r to reload all buffers and coc suggestions
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("checktime")
  vim.cmd("CocRestart")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>R", function()
  vim.cmd("checktime")
  vim.cmd("CocRestart")
end, { noremap = true, silent = true })

-- Remap W to write file silently
vim.api.nvim_set_keymap('n', 'W', ':silent w<CR>', { noremap = true, silent = true })
-- Remap CTRL+w to write file silently
vim.api.nvim_set_keymap('n', '<C-w>', ':silent w<CR>', { noremap = true, silent = true })
