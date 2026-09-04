return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended version constraint
		lazy = false, -- This plugin handles its own lazy-loading
		cond = function()
			return vim.fn.executable("cargo --version") == 1
		end,
		config = function(_, opts)
			vim.g.rustaceanvim = {
				-- Configure server settings here
				server = {
					-- on_attach = function(client, bufnr)
					--   -- Custom keymaps or attach logic can go here
					-- end,
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
			}
		end,
	},
}
