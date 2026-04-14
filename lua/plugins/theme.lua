local colors = {
	base00 = "#FFFFFF", -- Background
	base01 = "#FFFFFF", -- Lighter Background
	base02 = "#FFFFFF", -- Selection Background
	base03 = "#FFFFFF", -- Comments
	base04 = "#FFFFFF", -- Dark Foreground
	base05 = "#FFFFFF", -- Default Foreground
	base06 = "#FFFFFF", -- Light Foreground
	base07 = "#FFFFFF", -- Light Background
	base08 = "#FFFFFF", -- Red
	base09 = "#FFFFFF", -- Orange
	base0A = "#FFFFFF", -- Yellow
	base0B = "#FFFFFF", -- Green
	base0C = "#FFFFFF", -- Cyan
	base0D = "#FFFFFF", -- Blue
	base0E = "#FFFFFF", -- Magenta
	base0F = "#FFFFFF", -- Brown
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
