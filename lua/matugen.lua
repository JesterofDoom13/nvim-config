local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#17130e",
		base01 = "#241f1a",
		base02 = "#2e2924",
		base03 = "#9d8e81",
		base04 = "#d5c3b5",
		base05 = "#ebe1d9",
		base06 = "#ebe1d9",
		base07 = "#ebe1d9",
		base08 = "#ffb4ab",
		base09 = "#becc9b",
		base0A = "#e1c1a3",
		base0B = "#ffb86c",
		base0C = "#becc9b",
		base0D = "#ffb86c",
		base0E = "#e1c1a3",
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
