local M = {}

function M.setup()
	local colors = {
		base00 = "#121c2b", -- Default Background
		base01 = "#1e2e48", -- Lighter Background
		base02 = "#1b2a41", -- Selection Background
		base03 = "#5f6874", -- Comments/Invisibles

		-- Foreground tones
		base04 = "#afb2b6", -- Dark Foreground
		base05 = "#f2f2f3", -- Default Foreground
		base06 = "#f2f2f3", -- Light Foreground
		base07 = "#f2f2f3", -- Lightest Foreground

		-- Accent colors
		base08 = "#fd4663", -- Red (Error)
		base09 = "#a466cc", -- Orange/Tertiary
		base0A = "#6798e4", -- Yellow/Primary
		base0B = "#695cd6", -- Green/Secondary
		base0C = "#0c3e8d", -- Cyan/Primary Container
		base0D = "#6798e4", -- Blue/Primary
		base0E = "#491669", -- Magenta/Tertiary Container
		base0F = "#900017", -- Brown/Error Container
	}
	local lualinecolors = {
		normal = {
			a = { fg = "#040406", bg = "#6798e4", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#18253a" },
			c = { fg = "#5f6874", bg = "#121c2b" },
		},
		insert = {
			a = { fg = "#181d25", bg = "#a466cc", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#18253a" },
		},
		visual = {
			a = { fg = "#181d25", bg = "#695cd6", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#18253a" },
		},
		replace = {
			a = { fg = "#181d25", bg = "#fd4663", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#18253a" },
		},
		command = {
			a = {
				fg = "#dddbf0",
				bg = "#1a106f",
				gui = "bold",
			},
			b = { fg = "#f2f2f3", bg = "#18253a" },
		},
		inactive = {
			a = { fg = "#5f6874", bg = "#121c2b" },
			b = { fg = "#5f6874", bg = "#121c2b" },
			c = { fg = "#5f6874", bg = "#121c2b" },
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
