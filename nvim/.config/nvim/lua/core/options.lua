vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

-- line numbers
vim.wo.number = true

-- highlight indents
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '>', precedes = '<', space = '·' }

-- add virtual line at 80 characters
vim.opt.colorcolumn = '80'

-- autosave on buffer switch
vim.api.nvim_create_augroup("autosave_on_switch", { clear = true })
vim.api.nvim_create_autocmd("BufLeave", {
  group = "autosave_on_switch",
  pattern = "*",
  command = "silent! update",
})

-- autoread on focus
vim.api.nvim_create_augroup("autoread", { clear = true })
vim.api.nvim_create_autocmd("FocusGained", {
  group = "autoread",
  pattern = "*",
  command = "checktime",
})
