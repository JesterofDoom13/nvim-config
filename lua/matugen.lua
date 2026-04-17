local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#152428",
		base01 = "#233d43",
		base02 = "#1f373c",
		base03 = "#5b6f6f",
		base04 = "#afb6b6",
		base05 = "#f2f3f3",
		base06 = "#f2f3f3",
		base07 = "#f2f3f3",
		base08 = "#fd4663",
		base09 = "#6966cc",
		base0A = "#5c95d6",
		base0B = "#67e0e4",
		base0C = "#9896e9",
		base0D = "#93e9ec",
		base0E = "#96bde9",
		base0F = "#900017",
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
