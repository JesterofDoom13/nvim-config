-- local function dynamic_toggle_icon(option, desc_on, desc_off)
-- 	return function()
-- 		local enabled = vim.opt_local[option]:get() -- Check the current state
-- 		local icon = enabled and "" or ""
-- 		local desc = enabled and desc_on or desc_off
-- 		return icon .. " " .. desc
-- 	end
-- end
return {
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
