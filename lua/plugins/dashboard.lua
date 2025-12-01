return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local lazy_stats = require("lazy").stats()
		local loaded = lazy_stats.loaded
		local count = lazy_stats.count
		local ms = lazy_stats.startuptime

		-- ASCII Header (Kanagawa Dragon soft colors):
		dashboard.section.header.val = {
			"                                                    ",
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                    ",
		}
		dashboard.section.header.opts.hl = "DashboardHeader"

		-- Buttons:
		dashboard.section.buttons.val = {
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󱋡  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("p", "󰐱  Plugins", ":Lazy<CR>"),
			dashboard.button("m", "  Mason", ":Mason<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}
		dashboard.section.buttons.opts.hl = "DashboardButtons"

		-- Footer:
		dashboard.section.footer.val = {
			("Neovim loaded %d/%d plugins in %.1fms"):format(loaded, count, ms),
		}
		dashboard.section.footer.opts.hl = "DashboardFooter"

		-- Kanagawa Dragon soft Highlights:
		vim.cmd([[
            hi DashboardHeader  guifg=#D27E92   
            hi DashboardButtons guifg=#70BFD9  
            hi DashboardFooter  guifg=#D9B066   
        ]])

		alpha.setup(dashboard.opts)
	end,
}
