return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				on_attach = function(bufnr)
					local gs = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- -- Navigation
					-- map('n', ']c', function()
					--   if vim.wo.diff then
					--     vim.cmd.normal({']c', bang = true})
					--   else
					--     gs.next_hunk()
					--   end
					-- end, { desc = "Next git hunk" })
					--
					-- map('n', '[c', function()
					--   if vim.wo.diff then
					--     vim.cmd.normal({'[c', bang = true})
					--   else
					--     gs.prev_hunk()
					--   end
					-- end, { desc = "Previous git hunk" })
					--
					-- -- Actions
					-- map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
					-- map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
					-- map('v', '<leader>hs', function()
					--   gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
					-- end, { desc = "Stage selected hunk" })
					-- map('v', '<leader>hr', function()
					--   gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
					-- end, { desc = "Reset selected hunk" })
					-- map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
					-- map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
					-- map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
					-- map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
					-- map('n', '<leader>hb', function()
					--   gs.blame_line{full=true}
					-- end, { desc = "Blame line" })
					-- map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle line blame" })
					-- map('n', '<leader>hd', gs.diffthis, { desc = "Diff this" })
					-- map('n', '<leader>hD', function()
					--   gs.diffthis('~')
					-- end, { desc = "Diff this ~" })
					-- map('n', '<leader>td', gs.toggle_deleted, { desc = "Toggle deleted" })
					--
					-- -- Text object
					-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
				end,
			})
		end,
	},
}
