return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Hunks" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>t", group = "Toggle/Terminal" },
			{ "<leader>u", group = "Toggles" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Which Key: Buffer Local Keymaps",
		},
	},
}
