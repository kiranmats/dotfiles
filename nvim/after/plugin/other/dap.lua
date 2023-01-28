local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

dap_install.setup({})
--
dap_install.config("python", {})
-- add other configs here
-- require("mason-nvim-dap").setup({
--     automatic_setup = true,
-- })
dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "", circular = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = true,
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "▶",
			step_into = "→",
			step_over = "↷",
			step_out = "←",
			step_back = "倫",
			run_last = "⟲",
			terminate = "■",
		},
	},
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 60,
			position = "right",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25,
			position = "bottom",
		},
		render = {
			max_value_lines = 3,
		},
	},
	floating = {
		max_height = 0.9,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
})

-- dapui.setup({
-- 	expand_lines = true,
-- 	icons = { expanded = "", collapsed = "", circular = "" },
-- 	mappings = {
-- 		-- Use a table to apply multiple mappings
-- 		expand = { "<CR>", "<2-LeftMouse>" },
-- 		open = "o",
-- 		remove = "d",
-- 		edit = "e",
-- 		repl = "r",
-- 		toggle = "t",
-- 	},
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				{ id = "scopes", size = 0.33 },
-- 				{ id = "breakpoints", size = 0.17 },
-- 				{ id = "stacks", size = 0.25 },
-- 				{ id = "watches", size = 0.25 },
-- 			},
-- 			size = 0.33,
-- 			position = "right",
-- 		},
-- 		{
-- 			elements = {
-- 				{ id = "repl", size = 0.45 },
-- 				{ id = "console", size = 0.55 },
-- 			},
-- 			size = 0.27,
-- 			position = "bottom",
-- 		},
-- 	},
-- 	floating = {
-- 		max_height = 0.9,
-- 		max_width = 0.5, -- Floats will be treated as percentage of your screen.
-- 		border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
-- 		mappings = {
-- 			close = { "q", "<Esc>" },
-- 		},
-- 	},
-- })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- local codicons = require('codicons')
--
-- codicons.setup({
--   -- Override by mapping name to icon
--   ['account'] = '',
--   -- Or by name to hexadecimal/decimal value
--   ['comment'] = 0xEA6B, -- hexadecimal
--   ['archive'] = 60056, -- decimal
-- })
