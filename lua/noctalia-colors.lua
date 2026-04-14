local colors = {
	base00 = "#202617",
	base01 = "#354026",
	base02 = "#303923",
	base03 = "#68705c",

	base04 = "#b3b6af",
	base05 = "#f2f3f2",
	base06 = "#f2f3f2",
	base07 = "#f2f3f2",

	base08 = "#a55736",
	base09 = "#cd8465",
	base0A = "#afe467",
	base0B = "#67d760",
	base0C = "#568d0c",
	base0D = "#afe467",
	base0E = "#6a2f16",
	base0F = "#3f1c0d",
}
return {
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000, -- Load early to prevent flash of unstyled text
		config = function()
			require("base16-colorscheme").setup(colors)
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "base16-colorscheme",
		},
	},
	{
		"tribela/transparent.nvim",
		event = "VimEnter",
    -- stylua: ignore
		keys = {
			{
			  "<leader>ut",
			  function() require("transparent").toggle() end,
			  desc = "Toggle transparency",
			  -- cond = return require("transparent").state.
			},
		},
		opts = {},
	},
}
