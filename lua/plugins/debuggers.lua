return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Ensure DAP UI is properly setup
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Key mappings for debugging
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})

		-- Setup nvim-dap-vscode-js
		require("dap-vscode-js").setup({
			node_path = "node", -- Path of node executable
			debugger_path = os.getenv("HOME") .. "/vscode-js-debug", -- Debugger installation path
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		-- Language-specific configurations
		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					name = "Launch",
					type = "pwa-node",
					request = "launch",
					program = "${file}", -- Launch the currently opened file
					cwd = "${workspaceFolder}", -- Set working directory to workspace folder
					sourceMaps = true, -- Enable source maps
					skipFiles = { "<node_internals>/**" }, -- Skip internal node files
					protocol = "inspector", -- Use inspector protocol
					console = "integratedTerminal", -- Use integrated terminal for output
				},
			}
		end

		-- Setup nvim-dap-python
		require("dap-python").setup(os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python")
	end,
}
