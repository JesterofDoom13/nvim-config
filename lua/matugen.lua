local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#131316",
		base01 = "#1f1f23",
		base02 = "#2a2a2d",
		base03 = "#91909a",
		base04 = "#c7c5d0",
		base05 = "#e5e1e6",
		base06 = "#e5e1e6",
		base07 = "#e5e1e6",
		base08 = "#ffb4ab",
		base09 = "#e7b9d5",
		base0A = "#c5c4dd",
		base0B = "#bec2ff",
		base0C = "#e7b9d5",
		base0D = "#bec2ff",
		base0E = "#c5c4dd",
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
