return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		scratch = { enabled = true },
		terminal = { enabled = true },
		rename = { enabled = true },
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
			"<leader>ts",
			function()
				Snacks.terminal()
			end,
			desc = "Snacks: Toggle terminal",
		},
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Snacks: Browse in Git",
		},
		{
			"<leader>gg",
			function()
				Snacks.scratch()
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
}
