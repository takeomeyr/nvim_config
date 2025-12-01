return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup({
			indent = {
				char = "┊", -- Main line character
			},

			scope = {
				enabled = true, -- Highlight active indent scope
				show_start = true,
				show_end = false,
				highlight = "IblScope",
			},

			whitespace = {
				remove_blankline_trail = true,
			},

			exclude = {
				filetypes = { "help", "lazy", "mason", "NvimTree", "Trouble", "dashboard" },
			},
		})
	end,
}
