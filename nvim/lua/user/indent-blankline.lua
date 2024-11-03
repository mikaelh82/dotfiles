return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│", -- This is the character used for indentation lines
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
		},
		exclude = {
			filetypes = {
				"help",
				"dashboard",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
}
