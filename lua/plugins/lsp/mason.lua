return {
	-- Mason LSPConfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- Lua:
				"lua_ls",
				-- Go:
				"gopls",
				-- Python:
				"ruff",
				-- JSON / TOML / YAML:
				"jsonls",
				"taplo",
				"yamlls",
				-- React dev:
				"tsserver", -- TypeScript/JavaScript
				"eslint", -- JS/TS linting
				"html",
				"cssls",
				"emmet_ls", -- Emmet support
				"tailwindcss", -- Tailwind class IntelliSense
			},
			automatic_installation = true,
		},
	},

	-- Mason UI:
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				width = 0.85,
				height = 0.70,
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		},
	},

	-- Mason Tool Installer:
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- Lua:
				"stylua",
				-- Go:
				"gofumpt",
				"goimports",
				"impl",
				-- Python:
				"ruff",
				"pylint",
				"black",
				"isort",
				-- JS/TS / React:
				"prettier", -- Code formatting
				"eslint_d", -- Linting
				"stylelint", -- CSS/SCSS linting
				"typescript-language-server",
				"deno",
				"tailwindcss-language-server",
				"emmet-ls",
				"html-lsp",
				"css-lsp",
				"json-lsp",
			},
			run_on_start = true,
			auto_update = true,
		},
	},
}
