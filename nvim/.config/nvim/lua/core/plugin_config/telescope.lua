require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "node_modules/.*", "%.git/.*", "go.sum" },
        vimgrep_arguments = {
            "rg", 
            "--color=never", 
            "--no-heading", 
            "--with-filename", 
            "--line-number", 
            "--smart-case",
            "--column",
            "--hidden",  -- Include hidden files in the search
            -- "--glob", "!node_modules/*"  -- Exclude `node_modules` from grep results
        }
    },
    pickers = {
        find_files = {
            hidden = true,  -- Show hidden files
            no_ignore = false  -- Respect `.gitignore` files
        },
    }
})

local builtin = require('telescope.builtin')
local latest = 0

vim.keymap.set('n', '<c-p>', function ()
    latest = 0
    builtin.find_files()
end, {})

vim.keymap.set('n', '<Space><Space>', function ()
    latest = 0
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})

vim.keymap.set('n', '<Space>fh', function ()
    builtin.help_tags()
end, {})

-- Function for case-sensitive live_grep
function LiveGrepCaseSensitive()
    builtin.live_grep({
        additional_args = function()
            return {'--case-sensitive'}
        end
    })
end

vim.keymap.set('n', '<Space>cfg', function()
    LiveGrepCaseSensitive()
end, {})

-- Case insensitive live_grep
vim.keymap.set('n', '<Space>fg', function ()
    if latest == 0 then
        latest = 1
        builtin.live_grep()
    else
        builtin.resume()
    end
end, {})
