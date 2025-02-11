local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
    },
})

