return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				themable = false,
				color_icons = true,
				enforce_regular_tabs = true,

				indicator = { style = "none" },
				show_tab_indicators = false,
				separator_style = "thin",

				buffer_close_icon = "",
				close_icon = "",
				modified_icon = "◆",

				max_name_length = 18,
				tab_size = 18,
				minimum_padding = 1,
				maximum_padding = 2,

				persist_buffer_sort = true,
                		sort_by = "insert_after_current",
                		always_show_bufferline = true, 
			},
		})
	end,
}
