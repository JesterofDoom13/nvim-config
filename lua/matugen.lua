local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#1b1133",
		base02 = "#160e2c",
		base03 = "#666271",
		base04 = "#b1afb6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",
		base08 = "#fd4663",
		base09 = "#cc66b0",
		base0A = "#c05cd6",
		base0B = "#8967e4",
		base0C = "#e996d2",
		base0D = "#ab93ec",
		base0E = "#da96e9",
		base0F = "#666271",
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
