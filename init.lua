-- NOTE: this just gives nixCats global command a default value
-- so that it doesnt throw an error if you didnt install via nix.
-- usage of both this setup and the nixCats command is optional,
-- but it is very useful for passing info from nix to lua so you will likely use it at least once.
require("nixCatsUtils").setup({
	non_nix_value = true,
})

-- NOTE: You might want to move the lazy-lock.json file
local function getlockfilepath()
	if require("nixCatsUtils").isNixCats and type(nixCats.settings.unwrappedCfgPath) == "string" then
		return nixCats.settings.unwrappedCfgPath .. "/lazy-lock.json"
	else
		return vim.fn.stdpath("config") .. "/lazy-lock.json"
	end
end
local lazyOptions = {
	lockfile = getlockfilepath(),
}

require("mutagent").setup()
-- -- Noctalia loading based on new wallpaper
-- local function reload_noctalia()
-- 	package.loaded["noctalia-colors"] = nil
-- 	local status, noctalia = pcall(require, "noctalia-colors")
-- 	if not status then
-- 		print("Noctalia file not found yet. Skipping...")
-- 		return
-- 	end
-- 	-- Keeping options open to switch back and forth between a table
-- 	-- and a config
-- 	if type(noctalia) == "table" and noctalia.base00 then
-- 		require("base16-colorscheme").setup(noctalia)
-- 		print("Noctalia theme reloaded!")
-- 	elseif type(noctalia) == "table" and noctalia.setup then
-- 		noctalia.setup()
-- 		print("Noctalia theme setup() called!")
-- 	else
-- 		print("Error: Invalid noctalia-colors format.")
-- 	end
-- end
-- -- Listen for the signal
-- vim.api.nvim_create_autocmd("Signal", {
-- 	pattern = "SIGUSR1",
-- 	callback = function()
-- 		vim.schedule(reload_noctalia)
-- 	end,
-- })
-- vim.schedule(reload_noctalia)

-- NOTE: this the lazy wrapper. Use it like require('lazy').setup() but with an extra
-- argument, the path to lazy.nvim as downloaded by nix, or nil, before the normal arguments.
require("nixCatsUtils.lazyCat").setup(nixCats.pawsible({ "allPlugins", "start", "lazy.nvim" }), {
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- disable mason.nvim while using nix
	-- precompiled binaries do not agree with nixos, and we can just make nix install this stuff for us.
	{ import = "plugins" },
	{ "mason-org/mason-lspconfig.nvim", enabled = require("nixCatsUtils").lazyAdd(true, false) },
	{ "mason-org/mason.nvim", enabled = require("nixCatsUtils").lazyAdd(true, false) },
	{
		"nvim-treesitter/nvim-treesitter",
		build = require("nixCatsUtils").lazyAdd(":TSUpdate"),
		opts_extend = require("nixCatsUtils").lazyAdd(nil, false),
		opts = {
			-- nix already ensured they were installed, and we would need to change the parser_install_dir if we wanted to use it instead.
			-- so we just disable install and do it via nix.
			ensure_installed = require("nixCatsUtils").lazyAdd(
				{ "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
				nil
			),
			auto_install = require("nixCatsUtils").lazyAdd(true, false),
		},
	},
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				{ path = (nixCats.nixCatsPath or "") .. "/lua", words = { "nixCats" } },
			},
		},
	},
	-- import/override with your plugins
}, lazyOptions)

-- LSP Config for neovim 12.1.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
		end
		map("cd", vim.lsp.buf.definition, "Go to Definition")
		map("cD", vim.lsp.buf.declaration, "Go to Declaration")
		map("cr", vim.lsp.buf.references, "Go to References")
		map("K", vim.lsp.buf.hover, "Hover Docs")
		map("<leader>cr", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	end,
})

vim.lsp.config("harper_ls", {
	filetypes = { "markdown" },
	settings = {
		["harper-ls"] = {
			userDictPath = vim.fn.stdpath("config") .. "/spell/harper_dict.txt",
		},
	},
})

vim.lsp.config("nixd", {
	filetypes = { "nix" },
	settings = {
		nixd = {
			formatting = { command = { "nixpkgs-fmt" } },
			options = {
				nixos = {
					expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.steamdeck.options",
				},
				home_manager = {
					expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.steamdeck.options.home-manager.users.type.getSubOptions []",
				},
			},
			diagnostic = { suppress = { "sema-extra-with" } },
		},
	},
})

vim.lsp.enable({ "harper_ls", "nixd" })
