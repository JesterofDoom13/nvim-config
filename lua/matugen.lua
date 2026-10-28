local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#1a1e12",
		base02 = "#151a0d",
		base03 = "#686e5e",
		base04 = "#b4b6af",
		base05 = "#f2f3f2",
		base06 = "#f2f3f2",
		base07 = "#f2f3f2",
		base08 = "#fd4663",
		base09 = "#66cc86",
		base0A = "#73d65c",
		base0B = "#bde467",
		base0C = "#96e9b0",
		base0D = "#d0ec93",
		base0E = "#a5e996",
		base0F = "#686e5e",
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
