local M = {}

function M.setup()
	local colors = {
		base00 = "{{colors.surface.default.hex}}", -- Default Background
		base01 = "{{colors.surface_container.default.hex}}", -- Lighter Background
		base02 = "{{colors.surface_container_high.default.hex}}", -- Selection Background
		base03 = "{{colors.outline.default.hex}}", -- Comments/Invisibles

		-- Foreground tones
		base04 = "{{colors.on_surface_variant.default.hex}}", -- Dark Foreground
		base05 = "{{colors.on_surface.default.hex}}", -- Default Foreground
		base06 = "{{colors.on_surface.default.hex}}", -- Light Foreground
		base07 = "{{colors.on_surface.default.hex}}", -- Lightest Foreground

		-- Accent colors
		base08 = "{{colors.error.default.hex}}", -- Red (Error)
		base09 = "{{colors.tertiary.default.hex}}", -- Orange/Tertiary
		base0A = "{{colors.primary.default.hex}}", -- Yellow/Primary
		base0B = "{{colors.secondary.default.hex}}", -- Green/Secondary
		base0C = "{{colors.primary_container.default.hex}}", -- Cyan/Primary Container
		base0D = "{{colors.primary.default.hex}}", -- Blue/Primary
		base0E = "{{colors.tertiary_container.default.hex}}", -- Magenta/Tertiary Container
		base0F = "{{colors.error_container.default.hex}}", -- Brown/Error Container
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
	-- ~/.config/fish/noctalia-colors.fish
	--    Apply the colors using a base16 plugin (like base16-nvim or mini.base16)
	-- Example with 'RRethy/base16-nvim':
	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
		require("lualine").setup(lualinecolors)
	end
end

return M
