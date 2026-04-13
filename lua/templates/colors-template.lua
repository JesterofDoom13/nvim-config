local M = {}

function M.setup()
	local colors = {
		base00 = "{{colors.surface.default.hex}}",
		base01 = "{{colors.surface_container.default.hex}}",
		base02 = "{{colors.surface_container_high.default.hex}}",
		base03 = "{{colors.outline.default.hex}}",

		base04 = "{{colors.on_surface_variant.default.hex}}",
		base05 = "{{colors.on_surface.default.hex}}",
		base06 = "{{colors.on_surface.default.hex}}",
		base07 = "{{colors.on_surface.default.hex}}",

		base08 = "{{colors.error.default.hex}}",
		base09 = "{{colors.tertiary.default.hex}}",
		base0A = "{{colors.primary.default.hex}}",
		base0B = "{{colors.secondary.default.hex}}",
		base0C = "{{colors.primary_container.default.hex}}",
		base0D = "{{colors.primary.default.hex}}",
		base0E = "{{colors.tertiary_container.default.hex}}",
		base0F = "{{colors.error_container.default.hex}}",
	}
	local lualinecolors = {
		normal = {
			a = { fg = "{{colors.on_primary.default.hex}}", bg = "{{colors.primary.default.hex}}", gui = "bold" },
			b = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_variant.default.hex}}" },
			c = { fg = "{{colors.outline.default.hex}}", bg = "{{colors.surface.default.hex}}" },
		},
		insert = {
			a = { fg = "{{colors.on_tertiary.default.hex}}", bg = "{{colors.tertiary.default.hex}}", gui = "bold" },
			b = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_variant.default.hex}}" },
		},
		visual = {
			a = { fg = "{{colors.on_secondary.default.hex}}", bg = "{{colors.secondary.default.hex}}", gui = "bold" },
			b = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_variant.default.hex}}" },
		},
		replace = {
			a = { fg = "{{colors.on_error.default.hex}}", bg = "{{colors.error.default.hex}}", gui = "bold" },
			b = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_variant.default.hex}}" },
		},
		command = {
			a = {
				fg = "{{colors.on_secondary_container.default.hex}}",
				bg = "{{colors.secondary_container.default.hex}}",
				gui = "bold",
			},
			b = { fg = "{{colors.on_surface.default.hex}}", bg = "{{colors.surface_variant.default.hex}}" },
		},
		inactive = {
			a = { fg = "{{colors.outline.default.hex}}", bg = "{{colors.surface.default.hex}}" },
			b = { fg = "{{colors.outline.default.hex}}", bg = "{{colors.surface.default.hex}}" },
			c = { fg = "{{colors.outline_variant.default.hex}}", bg = "{{colors.surface.default.hex}}" },
		},
	}
	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
		require("lualine").setup({
			options = {
				theme = lualinecolors,
			},
		})
	end
end

return M
