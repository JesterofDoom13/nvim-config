local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#131316",
		base01 = "#201f23",
		base02 = "#2a292d",
		base03 = "#928f9a",
		base04 = "#c8c5d0",
		base05 = "#e5e1e6",
		base06 = "#e5e1e6",
		base07 = "#e5e1e6",
		base08 = "#ffb4ab",
		base09 = "#eab9d2",
		base0A = "#c6c4dd",
		base0B = "#c2c1ff",
		base0C = "#eab9d2",
		base0D = "#c2c1ff",
		base0E = "#c6c4dd",
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
		end
		local ok_lualine, lualine = pcall(require, "lualine")
		if ok_lualine and package.loaded["lualine"] then
			lualine.setup({ options = { theme = "auto" } })
		end
	end)
)

return M
