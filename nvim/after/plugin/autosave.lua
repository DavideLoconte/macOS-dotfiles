local autosave = require('autosave')

autosave.setup {
    write_all_buffers = false,
    conditions = {
        exists = true,
        modifiable = true,
        filename_is_not = {},
        filetype_is_not = {}
    }
}

