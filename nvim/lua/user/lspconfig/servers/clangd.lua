return {
	clangd = {
		capabilities = (function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.offsetEncoding = { "utf-16" }
			return capabilities
		end)(),
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
		},
	},
}
