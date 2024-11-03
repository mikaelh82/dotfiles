return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { truncate = 3 },
				prompt_prefix = "   ",
				selection_caret = "  ",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				sorting_strategy = "ascending",
				windblend = 0,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
					n = {
						["<esc>"] = actions.close,
						["q"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					hidden = true,
					respect_gitignore = true,
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<A-c>"] = require("telescope").extensions.file_browser.actions.create,
							["<S-CR>"] = require("telescope").extensions.file_browser.actions.create_from_prompt,
							["<A-r>"] = require("telescope").extensions.file_browser.actions.rename,
							["<A-m>"] = require("telescope").extensions.file_browser.actions.move,
							["<A-y>"] = require("telescope").extensions.file_browser.actions.copy,
							["<A-d>"] = require("telescope").extensions.file_browser.actions.remove,
						},
						["n"] = {
							["c"] = require("telescope").extensions.file_browser.actions.create,
							["r"] = require("telescope").extensions.file_browser.actions.rename,
							["m"] = require("telescope").extensions.file_browser.actions.move,
							["y"] = require("telescope").extensions.file_browser.actions.copy,
							["d"] = require("telescope").extensions.file_browser.actions.remove,
						},
					},
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- -- Files and Search
		-- map("n", "<leader>ff", builtin.find_files, opts)
		-- map("n", "<leader>fg", builtin.live_grep, opts)
		-- map("n", "<leader>fb", builtin.buffers, opts)
		-- map("n", "<leader>fh", builtin.help_tags, opts)
		-- map("n", "<leader>fr", builtin.oldfiles, opts)
		-- map("n", "<leader>fw", builtin.grep_string, opts)
		-- map("n", "<leader>fd", builtin.diagnostics, opts)
		--
		-- -- Git
		-- map("n", "<leader>gc", builtin.git_commits, opts)
		-- map("n", "<leader>gs", builtin.git_status, opts)
		-- map("n", "<leader>gb", builtin.git_branches, opts)
		--
		-- -- LSP
		-- map("n", "<leader>ls", builtin.lsp_document_symbols, opts)
		-- map("n", "<leader>lr", builtin.lsp_references, opts)
		-- map("n", "<leader>li", builtin.lsp_implementations, opts)
		-- map("n", "<leader>ld", builtin.lsp_definitions, opts)
		-- map("n", "<leader>lt", builtin.lsp_type_definitions, opts)
		--
		-- -- File Browser
		-- map("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
	end,
}
