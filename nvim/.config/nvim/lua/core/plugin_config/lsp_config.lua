require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "clangd" },
    exclude = { "solargraph" }
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local base = require("core.plugin_config.init")
local on_attach = base.on_attach
local capabilities = base.capabilities

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    }
}

require("lspconfig").solargraph.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").solidity.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").clangd.setup({})
--lspconfig.clangd.setup {
--    on_attach = function(client, bufnr)
--        client.server_capabilities.signatureHelpProvider = false
--        on_attach(client, bufnr)
--    end,
--    capabilities = capabilities,
--}
--require("lspconfig").cpptools.setup({})
-- configure coc.nvim for cpp
--require("lspconfig").ccls.setup({
--    init_options = {
--        compilationDatabaseDirectory = "build",
--        index = {
--            threads = 0,
--        },
--    },
--    capabilities = capabilities,
--    on_attach = on_attach,
--})

local servers = { 'pyright', 'rust_analyzer', 'clangd' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
}
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
