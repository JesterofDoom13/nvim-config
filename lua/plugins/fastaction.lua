return {
	"Chaitanyabsprip/fastaction.nvim",
	-- @type FastActionConfig
	opts = {
		dismiss_keys = { "j", "k", "<c-c>", "q" },
		override_function = function(params) -- to retain built-in style keymaps
			params.invalid_keys[#params.invalid_keys + 1] = tostring(#params.invalid_keys + 1)
			return { key = tostring(#params.invalid_keys), order = 0 }
		end,
		keys = "asdfghlzxcvbnm",
		popup = {
			border = "rounded",
			hide_cursor = true,
			highlight = {
				action = "MoreMsg",
				divider = "FloatBorder",
				key = "MoreMsg",
				source = "Comment",
				title = "Title",
				window = "NormalFloat",
			},
			title = "Select one of:", -- or false to disable title
		},
		priority = {
			dart = {
				{ pattern = "organize import", key = "o", order = 1 },
				{ pattern = "extract method", key = "x", order = 2 },
				{ pattern = "extract widget", key = "e", order = 3 },
			},
			typescript = {
				{ pattern = "to existing import declaration", key = "a", order = 2 },
				{ pattern = "from module", key = "i", order = 1 },
			},
		},
	},
}
