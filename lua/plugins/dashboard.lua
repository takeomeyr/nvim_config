return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local lazy_stats = require("lazy").stats()
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

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
		vim.cmd([[hi DashboardHeader  guifg=#C0A36E]])

		alpha.setup(dashboard.opts)
	end,
}
