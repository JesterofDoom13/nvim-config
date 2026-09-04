local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#271b08",
		base02 = "#211506",
		base03 = "#716a61",
		base04 = "#b6b3af",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",
		base08 = "#fd4663",
		base09 = "#8deb47",
		base0A = "#e0eb47",
		base0B = "#eeb05e",
		base0C = "#b8f28c",
		base0D = "#f3c68c",
		base0E = "#ecf28c",
		base0F = "#716a61",
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
