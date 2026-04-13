local M = {}

function M.setup()
	local colors = {
		base00 = "#291414", -- Default Background
		base01 = "#452121", -- Lighter Background
		base02 = "#3e1e1e", -- Selection Background
		base03 = "#756161", -- Comments/Invisibles

		-- Foreground tones
		base04 = "#b6afaf", -- Dark Foreground
		base05 = "#f3f2f2", -- Default Foreground
		base06 = "#f3f2f2", -- Light Foreground
		base07 = "#f3f2f2", -- Lightest Foreground

		-- Accent colors
		base08 = "#c02a29", -- Red (Error)
		base09 = "#dadb57", -- Orange/Tertiary
		base0A = "#e46867", -- Yellow/Primary
		base0B = "#db9a57", -- Green/Secondary
		base0C = "#8d0d0c", -- Cyan/Primary Container
		base0D = "#e46867", -- Blue/Primary
		base0E = "#72730d", -- Magenta/Tertiary Container
		base0F = "#450808", -- Brown/Error Container
	}

	-- Apply the colors using a base16 plugin (like base16-nvim or mini.base16)
	-- Example with 'RRethy/base16-nvim':
	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
	end
end

return M
