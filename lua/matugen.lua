local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#271610",
		base02 = "#20120e",
		base03 = "#726662",
		base04 = "#b6b0af",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",
		base08 = "#a84d29",
		base09 = "#b5cc66",
		base0A = "#d6b55c",
		base0B = "#e48467",
		base0C = "#d6e996",
		base0D = "#eca793",
		base0E = "#e9d296",
		base0F = "#726662",
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
