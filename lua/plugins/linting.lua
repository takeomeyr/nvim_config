return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local lint_enabled = true

		lint.linters_by_ft = {
			lua = { "luacheck" },
			go = { "golangci-lint" },
			python = { "ruff" },
			rust = { "clippy" },
			toml = { "taplo" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
		}

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				if lint_enabled and lint.linters_by_ft[vim.bo.filetype] then
					vim.defer_fn(function()
						lint.try_lint()
					end, 50)
				end
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
			severity_sort = true,
			update_in_insert = false,
			float = {
				border = "rounded",
				source = false,
				focusable = false,
				format = function(d)
					return d.message:gsub("\n", " ")
				end,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			callback = function()
				vim.diagnostic.open_float(nil, { focusable = false, scope = "line" })
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			if lint_enabled then
				lint.try_lint()
			end
		end, { desc = "Lint current file manually" })
	end,
}
