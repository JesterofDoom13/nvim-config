local M = {}

function M.setup()
	local colors = {
		base00 = "#291b14", -- Default Background
		base01 = "#452d21", -- Lighter Background
		base02 = "#3e291e", -- Selection Background
		base03 = "#73665f", -- Comments/Invisibles

		-- Foreground tones
		base04 = "#b6b1af", -- Dark Foreground
		base05 = "#f3f2f2", -- Default Foreground
		base06 = "#f3f2f2", -- Light Foreground
		base07 = "#f3f2f2", -- Lightest Foreground

		-- Accent colors
		base08 = "#91503b", -- Red (Error)
		base09 = "#a9cc66", -- Orange/Tertiary
		base0A = "#e49267", -- Yellow/Primary
		base0B = "#d6c35c", -- Green/Secondary
		base0C = "#8d380c", -- Cyan/Primary Container
		base0D = "#e49267", -- Blue/Primary
		base0E = "#4d6916", -- Magenta/Tertiary Container
		base0F = "#3c1b10", -- Brown/Error Container
	}

	-- Apply the colors using a base16 plugin (like base16-nvim or mini.base16)
	-- Example with 'RRethy/base16-nvim':
	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
	end
end

return M
