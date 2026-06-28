return {
  "MagicDuck/grug-far.nvim",
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open({ transient = true })
      end,
      mode = { "n" },
      desc = "Grug: Search & Replace (Project)",
    },
    {
      "<leader>sr",
      function()
        require("grug-far").with_visual_selection({ transient = true })
      end,
      mode = { "v" },
      desc = "Grug: Search & Replace Visual Selection",
    },
    {
      "<leader>sf",
      function()
        local current_file = vim.fn.expand("%")
        require("grug-far").open({
          prefills = { paths = current_file },
          transient = true,
        })
      end,
      mode = { "n" },
      desc = "Grug: Search & Replace (Current File)",
    },
  },
  opts = {
    debounceMs = 150,
    transient = true,
    maxWindowHeight = 0,
    wrap = false,
    icons = {
      enabled = true,
    },
    keymaps = {
      replace = "<localleader>r",
      syncLine = "<localleader>l",
      syncAll = "<localleader>s",
      historyOpen = "<localleader>h",
      abort = "<localleader>a",
      toggleBestMatch = "<localleader>b",
    },
  },
}
