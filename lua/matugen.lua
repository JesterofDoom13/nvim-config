local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#202617",
		base01 = "#354026",
		base02 = "#303923",
		base03 = "#68705c",
		base04 = "#b3b6af",
		base05 = "#f2f3f2",
		base06 = "#f2f3f2",
		base07 = "#f2f3f2",
		base08 = "#a55736",
		base09 = "#cd8465",
		base0A = "#67d760",
		base0B = "#afe467",
		base0C = "#e9af96",
		base0D = "#c6ec93",
		base0E = "#9be996",
		base0F = "#3f1c0d",
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
