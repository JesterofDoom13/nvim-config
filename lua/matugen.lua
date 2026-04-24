local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#121316",
		base01 = "#1e2023",
		base02 = "#292a2d",
		base03 = "#8d9199",
		base04 = "#c3c6cf",
		base05 = "#e3e2e6",
		base06 = "#e3e2e6",
		base07 = "#e3e2e6",
		base08 = "#ffb4ab",
		base09 = "#dabde2",
		base0A = "#bcc7dc",
		base0B = "#a5c8ff",
		base0C = "#dabde2",
		base0D = "#a5c8ff",
		base0E = "#bcc7dc",
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
