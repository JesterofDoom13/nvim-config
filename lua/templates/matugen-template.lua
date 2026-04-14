local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "{{colors.surface.default.hex}}",
		base01 = "{{colors.surface_container.default.hex}}",
		base02 = "{{colors.surface_container_high.default.hex}}",
		base03 = "{{colors.outline.default.hex}}",
		base04 = "{{colors.on_surface_variant.default.hex}}",
		base05 = "{{colors.on_surface.default.hex}}",
		base06 = "{{colors.on_surface.default.hex}}",
		base07 = "{{colors.on_background.default.hex}}",
		base08 = "{{colors.error.default.hex}}",
		base09 = "{{colors.tertiary.default.hex}}",
		base0A = "{{colors.secondary.default.hex}}",
		base0B = "{{colors.primary.default.hex}}",
		base0C = "{{colors.tertiary_fixed_dim.default.hex}}",
		base0D = "{{colors.primary_fixed_dim.default.hex}}",
		base0E = "{{colors.secondary_fixed_dim.default.hex}}",
		base0F = "{{colors.error_container.default.hex}}",
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
