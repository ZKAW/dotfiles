require('telescope').setup({ 
    file_ignore_patterns = { "node%_modules/.*", "%.git/.*", "go.sum" },
    pickers = {
        hidden = true,
        no_ignore = true,
    }
    -- Configure live_grep to be case sensitive
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
