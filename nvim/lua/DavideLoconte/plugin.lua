local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {'morhetz/gruvbox'},
	{"nvim-treesitter/nvim-treesitter"},
    {"0x00-ketsu/autosave.nvim"},
    {"nvim-tree/nvim-web-devicons"},
    {"ibhagwan/fzf-lua"},
    {"johnfrankmorgan/whitespace.nvim"},
    {"mason-org/mason.nvim"},
    {"neovim/nvim-lspconfig"},
    {"mason-org/mason-lspconfig.nvim"},
    {'stevearc/conform.nvim'},
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            {'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'},
        }
    }
})
