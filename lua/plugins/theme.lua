return {
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000, -- load early so colorscheme applies before other plugins
		config = function()
			require("matugen").setup()
		end,
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
