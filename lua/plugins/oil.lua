return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil: Open Parent Directory" },
    { "<leader>of", function() require("oil").open_float() end, desc = "Oil: Open Floating Window" },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-v>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"]     = "actions.parent",
      ["_"]     = "actions.open_cwd",
      ["g."]    = "actions.toggle_hidden",
      ["g\\"]   = "actions.toggle_trash",
    },
    float = {
      padding = 2,
      max_width = 80,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
    },
  },
}
