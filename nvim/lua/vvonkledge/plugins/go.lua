return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup()
		local nmap = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = desc })
		end
		local format_sync_grp = vim.api.nvim_create_augroup("GoImports", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
		nmap("<leader>ge", "<cmd>GoIfErr <CR>", "Generate if err")
		nmap("<leader>gfs", "<cmd>GoFillStruct <CR>", "Generate struct")
		--		nmap("<leader>gfsw", "<cmd>GoFillSwitch <CR>", "Generate fill switch")
		nmap("<leader>gp", "<cmd>GoFixPlurals <CR>", "Generate Fix plurals")
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
