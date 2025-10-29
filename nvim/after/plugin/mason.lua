local mason = require("mason")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        "black", "clang-formatter"
    }
})


local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "ruff"
    }
})
