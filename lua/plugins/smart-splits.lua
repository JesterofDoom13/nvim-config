return {
	{
		"smart-splits-nvim/smart-splits.nvim",
		version = "^3.0.0",
		-- optional: install a backend
		dependencies = {
			{
				"smart-splits-nvim/backend-tmux",
				main = "smart-splits-backend-tmux",
				opts = {
					-- whether this backend may be selected at all
					enable = true,
					-- refuse to navigate out of a zoomed tmux pane.
					disable_nav_when_zoomed = true,
					-- cells to resize by when not specified
					resize_amount = 3,
					-- milliseconds to wait for a `tmux` invocation. These run on every keypress
					-- at a window edge, so a tmux that is not answering degrades to plain Neovim
					-- movement rather than stalling the editor
					timeout = 300,
				},
			},
		},
		event = "VeryLazy",
		keys = {
			{
				"<A-h>",
				function()
					require("smart-splits").resize_left()
				end,
				desc = "Resize left",
			},
			{
				"<A-j>",
				function()
					require("smart-splits").resize_down()
				end,
				desc = "Resize right",
			},
			{
				"<A-k>",
				function()
					require("smart-splits").resize_up()
				end,
				desc = "Resize up",
			},
			{
				"<A-l>",
				function()
					require("smart-splits").resize_right()
				end,
				desc = "Resize down",
			},
			{
				"<C-h>",
				function()
					require("smart-splits").move_cursor_left()
				end,
				desc = "Move cursor left",
			},
			{
				"<C-j>",
				function()
					require("smart-splits").move_cursor_down()
				end,
				desc = "Move cursor down",
			},
			{
				"<C-k>",
				function()
					require("smart-splits").move_cursor_up()
				end,
				desc = "Move cursor up",
			},
			{
				"<C-l>",
				function()
					require("smart-splits").move_cursor_right()
				end,
				desc = "Move cursor right",
			},
			{
				"<C-\\>",
				function()
					require("smart-splits").move_cursor_previous()
				end,
				desc = "Move cursor previous",
			},
			-- All this is easy enough with just other mapping I have. Keep here in the event I change my mind
			{
				"<C-A-j>",
				function()
					require("smart-splits").swap_buf_down()
				end,
				desc = "",
			},
			{
				"<C-A-k>",
				function()
					require("smart-splits").swap_buf_up()
				end,
				desc = "",
			},
			{
				"<C-A-l>",
				function()
					require("smart-splits").swap_buf_right()
				end,
				desc = "",
			},
			{
				"<C-A-h>",
				function()
					require("smart-splits").swap_buf_left()
				end,
				desc = "",
			},
		},
		opts = {
			-- buffers to leave alone, see Ignore Lists below
			ignored_buftypes = { "nofile", "quickfix", "prompt" },
			ignored_filetypes = { "NvimTree" },

			resize = {
				-- cells to resize by, multiplied by `v:count1`
				amount = 3,
				-- added to `eventignore` for the duration of a resize
				ignored_events = { "BufEnter", "WinEnter" },
			},

			move = {
				-- 'stop' | 'wrap' | 'split' | fun(ctx), see At Edge Behavior below
				at_edge = "wrap",
				-- keep the cursor on the same screen row when moving horizontally
				same_row = false,
			},

			swap = {
				-- follow the buffer into its new window
				move_cursor = false,
			},

			mux = {
				backend = "smart-splits-backend-tmux",
				-- warn when backends are configured but none of them detected
				warn_if_unusable = true,
			},

			log = {
				-- 'trace' | 'debug' | 'info' | 'warn' | 'error'
				level = "info",
				-- `true` for the default path, a string for a custom one, `false` to disable
				file = true,
			},
		},
	},
}
