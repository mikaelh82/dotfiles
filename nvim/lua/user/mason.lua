return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Core
					"lua_ls", -- Lua
					"pyright", -- Python
					"clangd", -- C/C++
					"rust_analyzer", -- Rust
					"tflint",
					"terraformls", -- Terraform

					-- Web Development
					"ts_ls", -- TypeScript/JavaScript
					"html", -- HTML
					"cssls", -- CSS
					"eslint", -- JavaScript/TypeScript linting
					"tailwindcss", -- Tailwind CSS
					"prismals", -- Prisma
					"jsonls", -- JSON
					"emmet_ls", -- Emmet for HTML/CSS
				},
				automatic_installation = true,
			})
		end,
	},
}
