return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil: Open Parent Directory" },
    { "<leader>of", function() require("oil").open_float() end, desc = "Oil: Open Floating Window" },
  },
  opts = {
    float = { border = "rounded" },
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false;
        ["<C-r>"] = "actions.refresh"
    },
    view_options = { show_hidden = true },
  },
}
