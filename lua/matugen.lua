local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#181211",
		base01 = "#251e1d",
		base02 = "#2f2827",
		base03 = "#a08c89",
		base04 = "#d8c2be",
		base05 = "#ede0de",
		base06 = "#ede0de",
		base07 = "#ede0de",
		base08 = "#ffb4ab",
		base09 = "#dec38c",
		base0A = "#e7bdb6",
		base0B = "#ffb4a9",
		base0C = "#dec38c",
		base0D = "#ffb4a9",
		base0E = "#e7bdb6",
		base0F = "#93000a",
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
