local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#131929",
		base02 = "#101422",
		base03 = "#616676",
		base04 = "#afb0b6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",
		base08 = "#fd4663",
		base09 = "#b866cc",
		base0A = "#825cd6",
		base0B = "#6780e4",
		base0C = "#d896e9",
		base0D = "#93a5ec",
		base0E = "#b096e9",
		base0F = "#616676",
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
		local ok_lualine, lualine = pcall(require, "lualine")
		if ok_lualine and package.loaded["lualine"] then
			lualine.setup({ options = { theme = "auto" } })
		end
	end)
)

return M
