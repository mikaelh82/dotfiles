return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim", -- Make sure telescope is in dependencies
		"nvim-telescope/telescope-file-browser.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/notes",
			},
		},
		-- Add picker configuration
		picker = {
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},
	},
	config = function(_, opts)
		local obsidian = require("obsidian")
		obsidian.setup(opts)

		vim.api.nvim_create_user_command("ObsidianBrowser", function()
			require("telescope").extensions.file_browser.file_browser({
				path = "~/notes",
				prompt_title = "Obsidian Vault",
				hidden = true,
				respect_gitignore = false,
				files = true,
				folder_only = false,
				git_status = false,
				previewer = true,
				prompt_path = true,
				collapse_dirs = true,
				initial_mode = "normal",
				select_buffer = true,
				file_ignore_patterns = { "^%.git/" },
				-- Add mappings for file operations
				mappings = {
					["i"] = {
						["<A-r>"] = require("telescope").extensions.file_browser.actions.rename,
						["<A-d>"] = require("telescope").extensions.file_browser.actions.remove,
						["<A-y>"] = require("telescope").extensions.file_browser.actions.copy,
						["<A-m>"] = require("telescope").extensions.file_browser.actions.move,
						["<A-n>"] = require("telescope").extensions.file_browser.actions.create,
						["<C-h>"] = require("telescope").extensions.file_browser.actions.toggle_hidden,
					},
					["n"] = {
						["r"] = require("telescope").extensions.file_browser.actions.rename,
						["d"] = require("telescope").extensions.file_browser.actions.remove,
						["y"] = require("telescope").extensions.file_browser.actions.copy,
						["m"] = require("telescope").extensions.file_browser.actions.move,
						["n"] = require("telescope").extensions.file_browser.actions.create,
						["h"] = require("telescope").extensions.file_browser.actions.toggle_hidden,
					},
				},
			})
		end, {})

		-- Create custom Telescope command for vault search
		vim.api.nvim_create_user_command("ObsidianQuickSwitch", function()
			require("telescope.builtin").find_files({
				cwd = "~/notes",
				prompt_title = "Obsidian Notes",
				hidden = true,
				find_command = { "rg", "--files", "--hidden", "-g", "*.md" },
			})
		end, {})

		-- Create live grep command for content search
		vim.api.nvim_create_user_command("ObsidianGrep", function()
			require("telescope.builtin").live_grep({
				cwd = "~/notes",
				prompt_title = "Search Obsidian",
				hidden = true,
				additional_args = function()
					return { "--hidden" }
				end,
			})
		end, {})

		-- Set up autocommands for markdown files
		local augroup = vim.api.nvim_create_augroup("obsidian_auto_commands", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			group = augroup,
			callback = function()
				vim.opt_local.wrap = true
				vim.opt_local.spell = true
				vim.opt_local.conceallevel = 2
				vim.opt_local.textwidth = 80
				local fopts = vim.opt_local.formatoptions
				fopts:append("n")
				fopts:append("r")
				fopts:append("o")
				fopts:append("t")
				fopts:append("2")
			end,
		})
	end,
}
