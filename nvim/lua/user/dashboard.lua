return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("dashboard")

		-- Define vibrant colors for different parts of the header
		vim.api.nvim_set_hl(0, "DashboardHeader1", { fg = "#FF0000", bold = true }) -- Red
		vim.api.nvim_set_hl(0, "DashboardHeader2", { fg = "#FF4500", bold = true }) -- Orange Red
		vim.api.nvim_set_hl(0, "DashboardHeader3", { fg = "#FFD700", bold = true }) -- Gold
		vim.api.nvim_set_hl(0, "DashboardHeader4", { fg = "#32CD32", bold = true }) -- Lime Green
		vim.api.nvim_set_hl(0, "DashboardHeader5", { fg = "#00FFFF", bold = true }) -- Cyan
		vim.api.nvim_set_hl(0, "DashboardHeader6", { fg = "#1E90FF", bold = true }) -- Dodger Blue
		vim.api.nvim_set_hl(0, "DashboardHeader7", { fg = "#FF69B4", bold = true }) -- Hot Pink
		vim.api.nvim_set_hl(0, "DashboardHeader8", { fg = "#DA70D6", bold = true }) -- Orchid
		vim.api.nvim_set_hl(0, "DashboardHeader9", { fg = "#9370DB", bold = true }) -- Medium Purple
		vim.api.nvim_set_hl(0, "DashboardHeader10", { fg = "#FF1493", bold = true }) -- Deep Pink
		vim.api.nvim_set_hl(0, "DashboardHeader11", { fg = "#00FF00", bold = true }) -- Green

		dashboard.setup({
			theme = "doom",
			config = {
				header = {
					"",
					"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
					"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
					"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
					"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
					"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
					"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
					"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
					" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
					" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
					"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
					"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
					"",
				},
				hl = {
					{ { "DashboardHeader1", 1, 2 } },
					{ { "DashboardHeader2", 2, 3 } },
					{ { "DashboardHeader3", 3, 4 } },
					{ { "DashboardHeader4", 4, 5 } },
					{ { "DashboardHeader5", 5, 6 } },
					{ { "DashboardHeader6", 6, 7 } },
					{ { "DashboardHeader7", 7, 8 } },
					{ { "DashboardHeader8", 8, 9 } },
					{ { "DashboardHeader9", 9, 10 } },
					{ { "DashboardHeader10", 10, 11 } },
					{ { "DashboardHeader11", 11, 12 } },
				},
				center = {
					{
						icon = "🔥 ",
						icon_hl = "Title",
						desc = "Find File",
						desc_hl = "String",
						key = "f",
						key_hl = "Number",
						action = "Telescope find_files",
					},
					{
						icon = "🗂️ ",
						icon_hl = "Title",
						desc = "Recent Files",
						desc_hl = "String",
						key = "r",
						key_hl = "Number",
						action = "Telescope oldfiles",
					},
					{
						icon = "🔍 ",
						icon_hl = "Title",
						desc = "Find Word",
						desc_hl = "String",
						key = "w",
						key_hl = "Number",
						action = "Telescope live_grep",
					},
					{
						icon = "✨ ",
						icon_hl = "Title",
						desc = "New File",
						desc_hl = "String",
						key = "n",
						key_hl = "Number",
						action = ":ene <BAR> startinsert",
					},
				},
				footer = {
					"",
					"🎨 Ready to Paint Your Code! 🚀",
					"",
				},
			},
		})
	end,
}
