local fzf = require("fzf-lua")

local file_icons = true
local netrw_dir = vim.b.netrw_curdir
local file_dir
if netrw_dir ~= nil then file_dir = netrw_dir else file_dir = vim.fn.expand('%:p:h') end


vim.keymap.set("n", "<leader>ff", function ()
        fzf.files({
            cwd=file_dir,
            file_icons = false,
        })
end)


vim.keymap.set("n", "<leader>fh", function ()
        fzf.files({
            cwd="~",
            file_icons = file_icons,
        })
end)


vim.keymap.set("n", "<leader>fg", function()
    fzf.git_files({
        cwd=file_dir,
        file_icons = file_icons
    })
end)


vim.keymap.set("n", "<leader>gg", function()
    fzf.live_grep({
        cwd=file_dir,
        file_icons = file_icons
    })
end)


vim.keymap.set("n", "<leader>rh", function()
    fzf.live_grep({
        cwd="~",
        file_icons = file_icons
    })
end)

