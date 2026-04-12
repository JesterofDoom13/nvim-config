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

	-- Apply the colors using a base16 plugin (like base16-nvim or mini.base16)
	-- Example with 'RRethy/base16-nvim':
	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
	end
end

return M
