return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end,
			mode = "",
			desc = "Conform: Format buffer",
		},
	},
	opts = {
		default_format_opts = { lsp_format = "fallback" },

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			rust = { "rustfmt" },
			haskell = { "ormolu" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		formatters = {
			shfmt = { append_args = { "-i", "2" } },
		},
		notify_on_error = true,
		notify_no_formatters = false,
		log_level = vim.log.levels.ERROR,
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
