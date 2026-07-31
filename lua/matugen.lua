local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#2e0e1a",
		base02 = "#270b15",
		base03 = "#756167",
		base04 = "#b6afb1",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",
		base08 = "#b63936",
		base09 = "#ccaa66",
		base0A = "#d6705c",
		base0B = "#e46790",
		base0C = "#e9cd96",
		base0D = "#ec93b0",
		base0E = "#e9a396",
		base0F = "#756167",
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
			transparent.setup()
		end
		-- Reset lualine to display the new colors
		local ok_lualine, lualine = pcall(require, "lualine")
		if ok_lualine and package.loaded["lualine"] then
			lualine.setup({ options = { theme = "auto" } })
		end
	end)
)

return M
