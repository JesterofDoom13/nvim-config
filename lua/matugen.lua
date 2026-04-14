local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#13122c",
		base01 = "#201d49",
		base02 = "#1d1a42",
		base03 = "#626175",
		base04 = "#afafb6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",
		base08 = "#fd4663",
		base09 = "#cc66c5",
		base0A = "#a25cd6",
		base0B = "#7067e4",
		base0C = "#e996e3",
		base0D = "#9993ec",
		base0E = "#c596e9",
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
		if ok_lualine then
			lualine.setup({ options = { theme = "auto" } })
		end
	end)
)

return M
