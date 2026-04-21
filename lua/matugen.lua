local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#181210",
		base01 = "#251e1c",
		base02 = "#2f2826",
		base03 = "#a08c87",
		base04 = "#d8c2bc",
		base05 = "#ede0dc",
		base06 = "#ede0dc",
		base07 = "#ede0dc",
		base08 = "#ffb4ab",
		base09 = "#d7c68d",
		base0A = "#e7bdb1",
		base0B = "#ffb59e",
		base0C = "#d7c68d",
		base0D = "#ffb59e",
		base0E = "#e7bdb1",
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
