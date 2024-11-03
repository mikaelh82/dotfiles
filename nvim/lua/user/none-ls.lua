return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim", -- Add this dependency
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		-- Use LLVM tools from Homebrew
		local llvm_prefix = "/opt/homebrew/opt/llvm/bin/"

		null_ls.setup({
			debug = true,
			sources = {
				-- Formatting
				formatting.prettier, -- javascript, typescript, etc.
				formatting.stylua, -- lua
				formatting.black, -- python
				formatting.clang_format.with({
					command = llvm_prefix .. "clang-format",
				}), -- c/c++

				-- Diagnostics
				require("none-ls.diagnostics.eslint"), -- ESLint from none-ls-extras
				diagnostics.pylint,
				diagnostics.mypy,

				-- Code Actions
				code_actions.gitsigns,
			},
			-- Format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
