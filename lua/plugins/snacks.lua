return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		scratch = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{
			"<leader>,",
			function()
				Snacks.scratch()
			end,
			desc = "Snacks: Toggle scratch buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Snacks: Select scratch buffer",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Buffer: Delete",
		},
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			mode = { "n", "v" },
			desc = "Snacks: Browse in Git",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Snacks: LazyGit",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Snacks: Toggle zen mode",
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		Snacks.toggle.inlay_hints():map("<leader>uh")
	end,
}
