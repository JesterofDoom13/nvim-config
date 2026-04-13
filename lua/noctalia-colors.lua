local M = {}

function M.setup()
	local colors = {
		base00 = "#292514",
		base01 = "#453e21",
		base02 = "#3e381e",
		base03 = "#726e5e",

		base04 = "#b6b5af",
		base05 = "#f3f3f2",
		base06 = "#f3f3f2",
		base07 = "#f3f3f2",

		base08 = "#fd4663",
		base09 = "#b4f7a4",
		base0A = "#f7e7a4",
		base0B = "#def7a4",
		base0C = "#e7bb01",
		base0D = "#f7e7a4",
		base0E = "#2ee701",
		base0F = "#900017",
	}
	local lualinecolors = {
		normal = {
			a = { fg = "#252218", bg = "#f7e7a4", gui = "bold" },
			b = { fg = "#f3f3f2", bg = "#37321b" },
			c = { fg = "#726e5e", bg = "#292514" },
		},
		insert = {
			a = { fg = "#252218", bg = "#b4f7a4", gui = "bold" },
			b = { fg = "#f3f3f2", bg = "#37321b" },
		},
		visual = {
			a = { fg = "#252218", bg = "#def7a4", gui = "bold" },
			b = { fg = "#f3f3f2", bg = "#37321b" },
		},
		replace = {
			a = { fg = "#252218", bg = "#fd4663", gui = "bold" },
			b = { fg = "#f3f3f2", bg = "#37321b" },
		},
		command = {
			a = {
				fg = "#eefbd0",
				bg = "#a2e701",
				gui = "bold",
			},
			b = { fg = "#f3f3f2", bg = "#37321b" },
		},
		inactive = {
			a = { fg = "#726e5e", bg = "#292514" },
			b = { fg = "#726e5e", bg = "#292514" },
			c = { fg = "#726e5e", bg = "#292514" },
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
