local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#181211",
		base01 = "#251e1d",
		base02 = "#2f2828",
		base03 = "#a08c8a",
		base04 = "#d8c2bf",
		base05 = "#ede0de",
		base06 = "#ede0de",
		base07 = "#ede0de",
		base08 = "#ffb4ab",
		base09 = "#e2c28c",
		base0A = "#e7bdb9",
		base0B = "#ffb3ae",
		base0C = "#e2c28c",
		base0D = "#ffb3ae",
		base0E = "#e7bdb9",
		base0F = "#a08c8a",
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
