local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#27180d",
		base02 = "#201409",
		base03 = "#716861",
		base04 = "#b6b2af",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",
		base08 = "#fd4663",
		base09 = "#a2cc66",
		base0A = "#d6ca5c",
		base0B = "#e49a67",
		base0C = "#c7e996",
		base0D = "#ecb793",
		base0E = "#e9e196",
		base0F = "#716861",
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
