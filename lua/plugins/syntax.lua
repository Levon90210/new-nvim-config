return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local group = vim.api.nvim_create_augroup("plugins_treesitter_start", { clear = true })

			require("nvim-treesitter").install({
				"c",
				"cpp",
				"haskell",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				pattern = { "c", "cpp", "lua", "rust", "python", "haskell", "markdown" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^4.0.0",
		event = "VeryLazy",
		opts = {},
	},
}
