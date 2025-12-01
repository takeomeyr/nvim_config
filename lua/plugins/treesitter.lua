return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Configure treesitter:
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- Enable indentation:
			indent = { enable = true },
			-- Ensure these language parsers are installed:
			ensure_installed = {
				-- Core dev
				"go",
				"gomod",
				"gosum",
				"gowork",
				"lua",
				"python",
				"rust",
				"toml",
				-- Markup & tools
				"json",
				"yaml",
				"xml",
				"dockerfile",
				"gitignore",
				"markdown",
				"markdown_inline",
				-- Editor integration
				"vim",
				"vimdoc",
				"query",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
