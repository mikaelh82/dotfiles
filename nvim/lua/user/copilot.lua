return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<leader>cn", -- these will be handled by WhichKey
					prev = "<leader>cp", -- these will be handled by WhichKey
					dismiss = "<leader>cd", -- these will be handled by WhichKey
				},
			},
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
			},
			copilot_enterprise = {
				model = "gpt-4", -- or "gpt-3.5-turbo"
			},
			-- Optional: specify which filetypes to enable Copilot for
			filetypes = {
				["*"] = true, -- Enable for all filetypes
				-- Or specify individual filetypes:
				-- python = true,
				-- javascript = true,
				-- typescript = true,
			},
		})
	end,
}
