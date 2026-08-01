local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#001e2f",
		base02 = "#001927",
		base03 = "#5c6d71",
		base04 = "#afb5b6",
		base05 = "#f2f3f3",
		base06 = "#f2f3f3",
		base07 = "#f2f3f3",
		base08 = "#fd4663",
		base09 = "#afa1e0",
		base0A = "#9aafe6",
		base0B = "#94d8ec",
		base0C = "#a896e9",
		base0D = "#93d8ec",
		base0E = "#96ade9",
		base0F = "#5c6d71",
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
