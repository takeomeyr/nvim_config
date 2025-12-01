return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				transparent = true,
				commentStyle = { italic = true },
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				dimInactive = false,

				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								border = "rounded",
							},
						},
					},
				},

				overrides = function(colors)
					local dragon = colors.palette

					return {
						-- Line numbers:
						LineNr = { fg = dragon.springGray },
						LineNrAbove = { fg = dragon.fujiGray },
						LineNrBelow = { fg = dragon.fujiGray },
						CursorLineNr = { fg = dragon.boatYellow2 },

						-- Floating windows:
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none", fg = dragon.boatYellow1 },
						FloatTitle = { bg = "none", fg = dragon.boatYellow2 },

						-- Telescope:
						TelescopeTitle = { fg = dragon.carpYellow, bold = true },
						TelescopePromptBorder = { fg = dragon.boatYellow2 },
						TelescopeResultsBorder = { fg = dragon.boatYellow2 },
						TelescopePreviewBorder = { fg = dragon.boatYellow2 },
						TelescopeResultsNormal = { fg = dragon.fujiGray },
					}
				end,

				theme = "dragon",
				background = { dark = "dragon" },
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}
