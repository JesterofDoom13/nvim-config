local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#111415",
		base01 = "#1d2021",
		base02 = "#272a2c",
		base03 = "#899295",
		base04 = "#bfc8cb",
		base05 = "#e1e3e4",
		base06 = "#e1e3e4",
		base07 = "#e1e3e4",
		base08 = "#ffb4ab",
		base09 = "#bfc4eb",
		base0A = "#b2cbd3",
		base0B = "#56d6f5",
		base0C = "#bfc4eb",
		base0D = "#56d6f5",
		base0E = "#b2cbd3",
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
