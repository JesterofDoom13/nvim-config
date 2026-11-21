local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#03131c",
		base02 = "#071d2a",
		base03 = "#616b71",
		base04 = "#afb3b6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",
		base08 = "#fd4663",
		base09 = "#8e66cc",
		base0A = "#5c66d6",
		base0B = "#67b3e4",
		base0C = "#b696e9",
		base0D = "#93c9ec",
		base0E = "#969de9",
		base0F = "#616b71",
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
