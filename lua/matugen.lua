local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#292514",
		base01 = "#453e21",
		base02 = "#3e381e",
		base03 = "#726e5e",
		base04 = "#b6b5af",
		base05 = "#f3f3f2",
		base06 = "#f3f3f2",
		base07 = "#f3f3f2",
		base08 = "#fd4663",
		base09 = "#b4f7a4",
		base0A = "#def7a4",
		base0B = "#f7e7a4",
		base0C = "#9ef58a",
		base0D = "#f5e08a",
		base0E = "#d4f58a",
		base0F = "#900017",
	})
end

-- Hot-reload on SIGUSR1
local signal = vim.uv.new_signal()
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["matugen"] = nil
		require("matugen").setup()
		-- vim.cmd("colorscheme base16-colorscheme")
		vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })

		-- Re-apply transparency if it was enabled
		local ok, transparent = pcall(require, "transparent")
		if ok and transparent.config and transparent.config.enable then
			transparent.clear()
		end
		local ok_lualine, lualine = pcall(require, "lualine")
		if ok_lualine and package.loaded["lualine"] then
			lualine.setup({ options = { theme = "auto" } })
		end
	end)
)

return M
