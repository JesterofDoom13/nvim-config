local M = {}

function M.setup()
	local colors = {
		base00 = "#152428",
		base01 = "#233d43",
		base02 = "#1f373c",
		base03 = "#5b6f6f",

		base04 = "#afb6b6",
		base05 = "#f2f3f3",
		base06 = "#f2f3f3",
		base07 = "#f2f3f3",

		base08 = "#fd4663",
		base09 = "#6966cc",
		base0A = "#67e0e4",
		base0B = "#5c95d6",
		base0C = "#0c898d",
		base0D = "#67e0e4",
		base0E = "#191669",
		base0F = "#900017",
	}
	local lualinecolors = {
		normal = {
			a = { fg = "#182425", bg = "#67e0e4", gui = "bold" },
			b = { fg = "#f2f3f3", bg = "#1c3136" },
			c = { fg = "#5b6f6f", bg = "#152428" },
		},
		insert = {
			a = { fg = "#182425", bg = "#6966cc", gui = "bold" },
			b = { fg = "#f2f3f3", bg = "#1c3136" },
		},
		visual = {
			a = { fg = "#182425", bg = "#5c95d6", gui = "bold" },
			b = { fg = "#f2f3f3", bg = "#1c3136" },
		},
		replace = {
			a = { fg = "#182425", bg = "#fd4663", gui = "bold" },
			b = { fg = "#f2f3f3", bg = "#1c3136" },
		},
		command = {
			a = {
				fg = "#dde5ee",
				bg = "#103d6f",
				gui = "bold",
			},
			b = { fg = "#f2f3f3", bg = "#1c3136" },
		},
		inactive = {
			a = { fg = "#5b6f6f", bg = "#152428" },
			b = { fg = "#5b6f6f", bg = "#152428" },
			c = { fg = "#5c7070", bg = "#152428" },
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
