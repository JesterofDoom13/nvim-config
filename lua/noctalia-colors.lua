local M = {}

function M.setup()
	local colors = {
		base00 = "#291914",
		base01 = "#442a22",
		base02 = "#3d261f",
		base03 = "#74645f",

		base04 = "#b6b1af",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",

		base08 = "#fd4663",
		base09 = "#b2cc66",
		base0A = "#e48767",
		base0B = "#d6b85c",
		base0C = "#8d2d0c",
		base0D = "#e48767",
		base0E = "#546916",
		base0F = "#900017",
	}
	local lualinecolors = {
		normal = {
			a = { fg = "#181210", bg = "#e48767", gui = "bold" },
			b = { fg = "#f3f2f2", bg = "#36221b" },
			c = { fg = "#74645f", bg = "#291914" },
		},
		insert = {
			a = { fg = "#251c18", bg = "#b2cc66", gui = "bold" },
			b = { fg = "#f3f2f2", bg = "#36221b" },
		},
		visual = {
			a = { fg = "#251c18", bg = "#d6b85c", gui = "bold" },
			b = { fg = "#f3f2f2", bg = "#36221b" },
		},
		replace = {
			a = { fg = "#251c18", bg = "#fd4663", gui = "bold" },
			b = { fg = "#f3f2f2", bg = "#36221b" },
		},
		command = {
			a = {
				fg = "#eeeadd",
				bg = "#6f5810",
				gui = "bold",
			},
			b = { fg = "#f3f2f2", bg = "#36221b" },
		},
		inactive = {
			a = { fg = "#74645f", bg = "#291914" },
			b = { fg = "#74645f", bg = "#291914" },
			c = { fg = "#74645f", bg = "#291914" },
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
