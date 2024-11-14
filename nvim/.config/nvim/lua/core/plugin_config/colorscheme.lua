require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
    },
    integrations = {
        notify = true,
    }
})

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd [[colorscheme catppuccin]]
