local M = {}

function M.setup()
	local colors = {
		base00 = "#291b14",
		base01 = "#452d21",
		base02 = "#3e291e",
		base03 = "#73665f",

		base04 = "#b6b1af",
		base05 = "#f3f2f2",
		base06 = "#f3f2f2",
		base07 = "#f3f2f2",

		base08 = "#91503b",
		base09 = "#a9cc66",
		base0A = "#e49267",
		base0B = "#d6c35c",
		base0C = "#8d380c",
		base0D = "#e49267",
		base0E = "#4d6916",
		base0F = "#3c1b10",
	}

	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
	end
end

return M
