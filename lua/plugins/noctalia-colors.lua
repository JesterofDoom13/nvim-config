local M = {}

function M.setup()
	local colors = {
		base00 = "#121c2b",
		base01 = "#1e2e48",
		base02 = "#1b2a41",
		base03 = "#5f6874",

		base04 = "#afb2b6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",

		base08 = "#fd4663",
		base09 = "#a466cc",
		base0A = "#6798e4",
		base0B = "#695cd6",
		base0C = "#0c3e8d",
		base0D = "#6798e4",
		base0E = "#491669",
		base0F = "#900017",
	}

	local status, base16 = pcall(require, "base16-colorscheme")
	if status then
		base16.setup(colors)
	end
end

return M
