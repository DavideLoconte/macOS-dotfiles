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
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
    {'morhetz/gruvbox'},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-treesitter/nvim-treesitter-context" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
	{"mbbill/undotree"},
	{"tpope/vim-fugitive"},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
    {"rhysd/vim-clang-format", dependencies = {
        	"kana/vim-operator-user",
        	"Shougo/vimproc.vim"
        }
    },
    {"mfussenegger/nvim-dap"},
    {"mfussenegger/nvim-dap-python"},
    {"0x00-ketsu/autosave.nvim"},
    {"cappyzawa/trim.nvim"},
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("fzf-lua").setup({})
      end
    },
	{
		"Exafunction/codeium.vim",
		config = function ()
			vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		    	vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
			vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
			vim.keymap.set('i', '<C-backspace>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
		end
	},
    {
        'johnfrankmorgan/whitespace.nvim',
        config = function ()
            require('whitespace-nvim').setup({
                -- configuration options and their defaults

                -- `highlight` configures which highlight is used to display
                -- trailing whitespace
                highlight = 'DiffDelete',

                -- `ignored_filetypes` configures which filetypes to ignore when
                -- displaying trailing whitespace
                ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard' },

                -- `ignore_terminal` configures whether to ignore terminal buffers
                ignore_terminal = true,

                -- `return_cursor` configures if cursor should return to previous
                -- position after trimming whitespace
                return_cursor = true,
            })

            -- remove trailing whitespace with a keybinding
            vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
        end
    }
})
