return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
		"cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		-- Handler setup
		local config = {
			virtual_text = false,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		-- Setup diagnostics signs
		local signs = {
			{ name = "DiagnosticSignError", text = "󰅙" }, --
			{ name = "DiagnosticSignWarn", text = "󰀦" }, --
			{ name = "DiagnosticSignHint", text = "󰌵" }, --
			{ name = "DiagnosticSignInfo", text = "󰋼" }, --
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		vim.diagnostic.config(config)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		-- Keymaps setup
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }

				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- -- Buffer local mappings
				-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				-- vim.keymap.set("n", "<leader>wl", function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, opts)
				-- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- vim.keymap.set("n", "<leader>f", function()
				-- 	vim.lsp.buf.format({ async = true })
				-- end, opts)
				--
				-- -- Diagnostic keymaps
				-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
			end,
		})

		-- Server setup
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Load server configurations
		local clangd = require("user.lspconfig.servers.clangd")
		local lua_ls = require("user.lspconfig.servers.lua_ls")
		local web = require("user.lspconfig.servers.web")
		local pyright = require("user.lspconfig.servers.pyright")

		-- Merge all server configurations
		local servers = vim.tbl_extend("force", {}, clangd, lua_ls, web, pyright)

		-- Setup all servers
		for server, config in pairs(servers) do
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
}
