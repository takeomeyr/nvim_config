-- lazy.nvim is a lightweight, modern plugin manager with built-in support for
-- lazy-loading, automatic updates, and fast startup times.
-- Docs: https://lazy.folke.io/

-- Bootstrap lazy.nvim:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed:
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- If not installed, clone the stable release from GitHub:
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		lazyrepo,
		lazypath,
	})

	-- If cloning fails, print error message and exit:
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit:" },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins:
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.lsp" },
}, {
	checker = {
		enabled = true, -- automatically check for plugin updates in the background
		notify = false, -- no notifications during checks
	},
	change_detection = {
		notify = false, -- do not notify when plugin config files change
	},
})
