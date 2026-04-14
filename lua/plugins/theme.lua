local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#0a1e33",
		base01 = "#113355",
		base02 = "#0f2e4c",
		base03 = "#5f6974",
		base04 = "#afb2b6",
		base05 = "#f2f2f3",
		base06 = "#f2f2f3",
		base07 = "#f2f2f3",
		base08 = "#b82628",
		base09 = "#9955dd",
		base0A = "#5555dd",
		base0B = "#67a6e4",
		base0C = "#bf95ea",
		base0D = "#93c0ec",
		base0E = "#9595ea",
		base0F = "#450708",
	})
end

-- Hot-reload on SIGUSR1
local signal = vim.uv.new_signal()
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["matugen"] = nil
		require("matugen").setup()
	end)
)

return M
