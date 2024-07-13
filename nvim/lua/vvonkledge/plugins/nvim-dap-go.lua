return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = "mfussenegger/nvim-dap",
	config = function(_, opts)
		require("dap-go").setup(opts)
		local nmap = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = desc })
		end

		nmap("<leader>db", "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line")
		nmap("<leader>dus", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, "Open debugging sidebar")
		nmap("<leader>dgt", function()
			require("dap-go").debug_test()
		end, "Debug go test")
		nmap("<leader>dgl", function()
			require("dap-go").debug_last_test()
		end, "Debug go test last")
	end,
}
