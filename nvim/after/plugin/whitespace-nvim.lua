local whitespace = require('whitespace-nvim')

whitespace.setup({
    highlight = 'DiffDelete',
    ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard' },
    ignore_terminal = true,
    return_cursor = true,
})

