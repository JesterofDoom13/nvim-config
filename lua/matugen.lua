local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#000000",
		base01 = "#290d30",
		base02 = "#230a29",
		base03 = "#6e6271",
		base04 = "#b5afb6",
		base05 = "#f3f2f3",
		base06 = "#f3f2f3",
		base07 = "#f3f2f3",
		base08 = "#fd4663",
		base09 = "#cc6679",
		base0A = "#d65cad",
		base0B = "#cc67e4",
		base0C = "#e996a5",
		base0D = "#db93ec",
		base0E = "#e996cd",
		base0F = "#6e6271",
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
