local dap = require('dap')
local compat = require('DavideLoconte.compat')

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>d", dap.continue)
vim.keymap.set("n", "<C-j>", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<C-o>", dap.repl.open)

-- C/C++ and Rust

dap.adapters.lldb = {
  type = 'executable',
  command = compat.lldb_dap, -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Python
require('dap-python').setup(compat.python3)

