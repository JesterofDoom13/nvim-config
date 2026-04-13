local M = {}

function M.setup()
	local colors = {
		base00 = "#13122c",
		base01 = "#201d49",
		base02 = "#1d1a42",
		base03 = "#626175",

		base04 = "#afafb6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",

		base08 = "#fd4663",
		base09 = "#cc66c5",
		base0A = "#7067e4",
		base0B = "#a25cd6",
		base0C = "#150c8d",
		base0D = "#7067e4",
		base0E = "#691664",
		base0F = "#900017",
	}
	local lualinecolors = {
		normal = {
			a = { fg = "#191825", bg = "#7067e4", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#1a173a" },
			c = { fg = "#626175", bg = "#13122c" },
		},
		insert = {
			a = { fg = "#191825", bg = "#cc66c5", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#1a173a" },
		},
		visual = {
			a = { fg = "#191825", bg = "#a25cd6", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#1a173a" },
		},
		replace = {
			a = { fg = "#191825", bg = "#fd4663", gui = "bold" },
			b = { fg = "#f2f2f3", bg = "#1a173a" },
		},
		command = {
			a = {
				fg = "#e7dbf0",
				bg = "#47106f",
				gui = "bold",
			},
			b = { fg = "#f2f2f3", bg = "#1a173a" },
		},
		inactive = {
			a = { fg = "#626175", bg = "#13122c" },
			b = { fg = "#626175", bg = "#13122c" },
			c = { fg = "#626175", bg = "#13122c" },
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
