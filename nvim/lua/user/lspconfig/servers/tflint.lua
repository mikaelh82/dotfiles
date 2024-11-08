return {
	tflint = {
		cmd = { "/opt/homebrew/bin/tflint", "--langserver" },
		filetypes = { "terraform", "tf" },
		root_dir = require("lspconfig.util").root_pattern(".tflint.hcl", ".git"),
	},
}
