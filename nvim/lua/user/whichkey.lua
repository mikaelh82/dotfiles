return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			-- LSP group
			{ "<leader>l", group = "LSP" },
			{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
			{ "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
			{ "<leader>li", "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
			{ "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
			{ "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
			{ "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Location List" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type Definitions" },
			{ "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
			{ "<leader>lR", "<cmd>LspRestart<CR>", desc = "Restart LSP" },

			{ "<leader>c", group = "Copilot" },
			{ "<leader>cn", "<cmd>lua require('copilot.suggestion').next()<cr>", desc = "Next suggestion" },
			{ "<leader>cp", "<cmd>lua require('copilot.suggestion').prev()<cr>", desc = "Previous suggestion" },
			{ "<leader>cd", "<cmd>lua require('copilot.suggestion').dismiss()<cr>", desc = "Dismiss suggestion" },
			{ "<leader>ca", "<cmd>lua require('copilot.suggestion').accept()<cr>", desc = "Accept suggestion" },
			{
				"<leader>ct",
				"<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>",
				desc = "Toggle auto trigger",
			},
			{ "<leader>cP", "<cmd>Copilot panel<cr>", desc = "Open panel" },

			{ "<leader>o", group = "Obsidian" },
			{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note" },
			{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Note" },
			{ "<leader>og", "<cmd>ObsidianGrep<cr>", desc = "Search Notes Content" },
			{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian" },
			{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search in Vault" },
			{ "<leader>oa", "<cmd>ObsidianBacklinks<cr>", desc = "Show Backlinks" },
			{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today's Note" },
			{ "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's Note" },
			{ "<leader>om", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow's Note" },
			{ "<leader>ol", "<cmd>ObsidianLinkNew<cr>", desc = "Create New Link" },
			{ "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "List Tags" },
			{ "<leader>ob", "<cmd>ObsidianBrowser<cr>", desc = "Browse Vault" },

			-- Visual mode mappings
			{ "<leader>ol", ":'<,'>ObsidianLinkNew<cr>", desc = "Create Link from Selection", mode = "v" },

			-- Workspace group
			{ "<leader>w", group = "Workspace" },
			{ "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Workspace Folder" },
			{ "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Workspace Folder" },
			{
				"<leader>wl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				desc = "List Workspace Folders",
			},
			-- Create new Windows group (using <leader>W instead)
			{ "<leader>W", group = "Windows" },
			{ "<leader>Ws", "<cmd>split<CR>", desc = "Split Horizontally" },
			{ "<leader>Wv", "<cmd>vsplit<CR>", desc = "Split Vertically" },
			{ "<leader>Wh", "<C-w>h", desc = "Move to Left Window" },
			{ "<leader>Wj", "<C-w>j", desc = "Move to Down Window" },
			{ "<leader>Wk", "<C-w>k", desc = "Move to Up Window" },
			{ "<leader>Wl", "<C-w>l", desc = "Move to Right Window" },
			{ "<leader>WH", "<C-w>H", desc = "Move Window Left" },
			{ "<leader>WJ", "<C-w>J", desc = "Move Window Down" },
			{ "<leader>WK", "<C-w>K", desc = "Move Window Up" },
			{ "<leader>WL", "<C-w>L", desc = "Move Window Right" },
			{ "<leader>W<", "<C-w><", desc = "Decrease Width" },
			{ "<leader>W>", "<C-w>>", desc = "Increase Width" },
			{ "<leader>W+", "<C-w>+", desc = "Increase Height" },
			{ "<leader>W-", "<C-w>-", desc = "Decrease Height" },
			{ "<leader>Wx", "<C-w>x", desc = "Swap With Next" },
			{ "<leader>WT", "<C-w>T", desc = "Move Window to New Tab" },
			{ "<leader>Wr", "<C-w>r", desc = "Rotate Windows" },
			{ "<leader>WR", "<C-w>R", desc = "Rotate Windows Reverse" },
			{ "<leader>Wc", "<cmd>close<CR>", desc = "Close Window" },
			{ "<leader>Wo", "<cmd>only<CR>", desc = "Close Other Windows" },
			{ "<leader>W=", "<C-w>=", desc = "Balance Windows" },

			-- Add new Tab group (this doesn't conflict with anything)
			{ "<leader>t", group = "Tabs" },
			{ "<leader>tn", "<cmd>tabnew<CR>", desc = "New Tab" },
			{ "<leader>tc", "<cmd>tabclose<CR>", desc = "Close Tab" },
			{ "<leader>to", "<cmd>tabonly<CR>", desc = "Close Other Tabs" },
			{ "<leader>tl", "<cmd>tabnext<CR>", desc = "Next Tab" },
			{ "<leader>th", "<cmd>tabprevious<CR>", desc = "Previous Tab" },
			{ "<leader>tf", "<cmd>tabfirst<CR>", desc = "First Tab" },
			{ "<leader>tL", "<cmd>tablast<CR>", desc = "Last Tab" },
			{ "<leader>t1", "1gt", desc = "Go to Tab 1" },
			{ "<leader>t2", "2gt", desc = "Go to Tab 2" },
			{ "<leader>t3", "3gt", desc = "Go to Tab 3" },
			{ "<leader>t4", "4gt", desc = "Go to Tab 4" },
			{ "<leader>t5", "5gt", desc = "Go to Tab 5" },
			{
				"<leader>tm",
				function()
					local tab_number = vim.fn.input("Move tab to position: ")
					if tab_number ~= "" then
						vim.cmd(string.format("tabmove %s", tab_number))
					end
				end,
				desc = "Move Tab to Position",
			},
			{ "<leader>tb", "<cmd>tab split<CR>", desc = "Open Buffer in New Tab" },

			-- Non-leader tab navigation
			{ "gt", "<cmd>tabnext<CR>", desc = "Next Tab" },
			{ "gT", "<cmd>tabprevious<CR>", desc = "Previous Tab" },

			-- Non-leader diagnostic navigation
			{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },
			{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },

			-- Alternative quick access keys (no leader)
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
			{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
			{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to References" },

			-- Find/Files group
			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep Word" },
			{ "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser" },
			{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
			{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Marks" },
			{ "<leader>ft", "<cmd>Telescope treesitter<CR>", desc = "Treesitter Symbols" },
			{ "<leader>fT", "<cmd>TodoTelescope<CR>", desc = "Todo Comments" }, -- If you use Todo-comments

			-- Git group
			{ "<leader>g", group = "Git" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git Status" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git Commits" },
			{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git Branches" },

			-- Git Hunks/Gitsigns
			{ "<leader>gh", group = "Git Hunks" },
			{ "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
			{ "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
			{ "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
			{ "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
			{ "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
			{ "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
			{
				"<leader>ghb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Blame Line",
			},
			{ "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
			{
				"<leader>ghD",
				function()
					require("gitsigns").diffthis("~")
				end,
				desc = "Diff This ~",
			},

			-- Git Toggles
			{ "<leader>gt", group = "Git Toggles" },
			{ "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Blame" },
			{ "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deleted" },

			-- Visual mode git mappings
			{
				"<leader>ghs",
				function()
					require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				desc = "Stage Selected Hunk",
				mode = "v",
			},
			{
				"<leader>ghr",
				function()
					require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				desc = "Reset Selected Hunk",
				mode = "v",
			},
			-- Text object (for operating on git hunks)
			{ "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select Hunk", mode = { "o", "x" } },
			{
				"]c",
				function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						require("gitsigns").next_hunk()
					end
				end,
				desc = "Next Git Hunk",
			},

			{
				"[c",
				function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						require("gitsigns").prev_hunk()
					end
				end,
				desc = "Previous Git Hunk",
			},

			{ "<leader>s", group = "Save/File" },
			{ "<leader>ss", "<cmd>w<CR>", desc = "Save File" },
			{ "<leader>sa", "<cmd>wa<CR>", desc = "Save All Files" },

			-- Buffer mappings
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
			{ "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
			{ "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },
			{ "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "Switch Buffer" },
			{ "<leader>bw", "<cmd>bwipeout<CR>", desc = "Wipeout Buffer" },
			{ "<leader>bO", "<cmd>%bd|e#|bd#<CR>", desc = "Close Other Buffers" },

			-- Window mappings
			{ "<leader>wc", "<cmd>close<CR>", desc = "Close Window" },
			{ "<leader>wo", "<cmd>only<CR>", desc = "Close Other Windows" },
			{ "<leader>w=", "<C-w>=", desc = "Balance Windows" },

			-- Quick actions
			{ "<leader>,", "<cmd>Telescope buffers<CR>", desc = "Switch Buffer" },
			{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Search Project" },
			{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find File" },
		})
	end,
}

-- return {
-- 	"folke/which-key.nvim",
-- 	event = "VeryLazy",
-- 	init = function()
-- 		vim.o.timeout = true
-- 		vim.o.timeoutlen = 300
-- 	end,
-- 	opts = {
-- 		plugins = {
-- 			marks = true,
-- 			registers = true,
-- 			spelling = {
-- 				enabled = true,
-- 				suggestions = 20,
-- 			},
-- 			presets = {
-- 				operators = true,
-- 				motions = true,
-- 				text_objects = true,
-- 				windows = true,
-- 				nav = true,
-- 				z = true,
-- 				g = true,
-- 			},
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		local wk = require("which-key")
-- 		wk.setup(opts)
--
-- 		wk.add({
-- 			-- LSP group
-- 			{ "<leader>l", group = "LSP" },
-- 			{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
-- 			{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
-- 			{ "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
-- 			{ "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
-- 			{ "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
-- 			{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
-- 			{ "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
-- 			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
-- 			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
-- 			{ "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
-- 			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Location List" },
-- 			{ "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Type Definition" },
--
-- 			-- Workspace group
-- 			{ "<leader>w", group = "Workspace" },
-- 			{ "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Workspace Folder" },
-- 			{ "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Workspace Folder" },
-- 			{
-- 				"<leader>wl",
-- 				function()
-- 					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 				end,
-- 				desc = "List Workspace Folders",
-- 			},
--
-- 			-- Non-leader diagnostic navigation
-- 			{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },
-- 			{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
--
-- 			-- Alternative quick access keys (no leader)
-- 			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
-- 			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
-- 			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
-- 			{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
-- 			{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
-- 			{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to References" },
--
-- 			-- Telescope mappings
-- 			{ "<leader>f", group = "Find" },
-- 			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
-- 			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
-- 			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
-- 			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
-- 			{ "<leader>fs", "<cmd>Telescope grep_string<CR>", desc = "Search String" },
-- 			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
--
-- 			{ "<leader>g", group = "Git" },
-- 			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git Status" },
-- 			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git Commits" },
-- 			{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git Branches" },
--
-- 			-- Git Hunks/Gitsigns (all under git group now)
-- 			{ "<leader>gh", group = "Git Hunks" },
-- 			{ "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
-- 			{ "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
-- 			{ "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
-- 			{ "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
-- 			{ "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
-- 			{ "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
-- 			{
-- 				"<leader>ghb",
-- 				function()
-- 					require("gitsigns").blame_line({ full = true })
-- 				end,
-- 				desc = "Blame Line",
-- 			},
-- 			{ "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
-- 			{
-- 				"<leader>ghD",
-- 				function()
-- 					require("gitsigns").diffthis("~")
-- 				end,
-- 				desc = "Diff This ~",
-- 			},
--
-- 			-- Git Toggles (putting toggle options in a subgroup)
-- 			{ "<leader>gt", group = "Git Toggles" },
-- 			{ "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Blame" },
-- 			{ "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deleted" },
--
-- 			-- Visual mode git mappings
-- 			{
-- 				"<leader>ghs",
-- 				function()
-- 					require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- 				end,
-- 				desc = "Stage Selected Hunk",
-- 				mode = "v",
-- 			},
-- 			{
-- 				"<leader>ghr",
-- 				function()
-- 					require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- 				end,
-- 				desc = "Reset Selected Hunk",
-- 				mode = "v",
-- 			},
--
-- 			-- Text object (for operating on git hunks)
-- 			{ "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select Hunk", mode = { "o", "x" } },
-- 			{
-- 				"]c",
-- 				function()
-- 					if vim.wo.diff then
-- 						vim.cmd.normal({ "]c", bang = true })
-- 					else
-- 						require("gitsigns").next_hunk()
-- 					end
-- 				end,
-- 				desc = "Next Git Hunk",
-- 			},
--
-- 			{
-- 				"[c",
-- 				function()
-- 					if vim.wo.diff then
-- 						vim.cmd.normal({ "[c", bang = true })
-- 					else
-- 						require("gitsigns").prev_hunk()
-- 					end
-- 				end,
-- 				desc = "Previous Git Hunk",
-- 			},
--
-- 			-- Buffer mappings
-- 			{ "<leader>b", group = "Buffer" },
-- 			{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
-- 			{ "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
-- 			{ "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },
-- 			{ "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "Switch Buffer" },
--
-- 			-- Window mappings (continued)
-- 			{ "<leader>wc", "<cmd>close<CR>", desc = "Close Window" },
-- 			{ "<leader>wo", "<cmd>only<CR>", desc = "Close Other Windows" },
-- 			{ "<leader>w=", "<C-w>=", desc = "Balance Windows" },
--
-- 			-- Quick actions
-- 			{ "<leader>,", "<cmd>Telescope buffers<CR>", desc = "Switch Buffer" },
-- 			{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Search Project" },
-- 			{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find File" },
-- 		})
-- 	end,
-- }
