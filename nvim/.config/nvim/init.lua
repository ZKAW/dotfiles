vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
-- highlight indents
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '>', precedes = '<', space = '·' }

vim.opt.runtimepath:append("~/.local/share/nvim/lazy/nvim-treesitter/parser")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
