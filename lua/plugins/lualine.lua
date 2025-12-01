return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				theme = "kanagawa",
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = "",
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = {
					{ "branch", icon = "" },
				},
				lualine_c = { { "filename" } },
				lualine_x = { diagnostics, "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { { "location" } },
			},
		})
	end,
}
