require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "tpope/vim-commentary",
    "mattn/emmet-vim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",
    "dracula/vim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "vim-test/vim-test",
    "lewis6991/gitsigns.nvim",
    "preservim/vimux",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    "ZKAW/vim-epitech-header",
    "simrat39/rust-tools.nvim",
    "numToStr/Comment.nvim",
    "lukas-reineke/virt-column.nvim",
    "mbbill/undotree",
    "tpope/vim-eunuch",
    "mg979/vim-visual-multi",
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        -- "ibhagwan/fzf-lua",              -- optional
        -- "echasnovski/mini.pick",         -- optional
    },
    config = true
    },
    -- completion
    "nmac427/guess-indent.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
    "github/copilot.vim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "wincent/ferret",
    "djoshea/vim-autoread",
    "nmac427/guess-indent.nvim",
    { 'wakatime/vim-wakatime', lazy = false },
    {
        "saecki/crates.nvim",
        tag = "stable",
    },
    {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "neoclide/coc.nvim",
         branch = "release",
    },
})
