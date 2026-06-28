return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- Core Navigation
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fzf: Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Fzf: Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Fzf: Buffers" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Fzf: Recent Files" },
    -- Git Operations
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Fzf: Git Files" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Fzf: Git Status" },
    -- Advanced Pickers & Search Engineering
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Fzf: Resume Last Search" },
    { "<leader>fc", "<cmd>FzfLua combine pickers=oldfiles;git_files<cr>", desc = "Fzf: Combined (Recent + Git)" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Fzf: Search Word Under Cursor" },
  },
  opts = function()
    local actions = require("fzf-lua.actions")
    return {
      -- Set the base profile strategy
      "default",
      winopts = {
        height = 0.85,
        width = 0.85,
        row = 0.35,
        col = 0.50,
        border = "rounded", -- Elegant border style
        fullscreen = false,
        preview = {
          border = "rounded",
          wrap = "nowrap",      -- Avoid line wrapping inside the code previewer
          default = "builtin",  -- Use fzf-lua's lightning-fast native Lua previewer
          layout = "flex",      -- Flips horizontal/vertical dynamically based on terminal aspect ratio
          flip_columns = 120,   -- Columns required to switch to horizontal split
          scrollbar = "float",
        },
      },
      keymap = {
        -- Keymaps active within the built-in preview/prompt windows
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          -- Native fzf binary keybind overrides go here
          ["ctrl-a"] = "toggle-all",
          ["ctrl-q"] = "select-all+accept", -- Send all matched selections to the Quickfix list
        },
      },
      actions = {
        files = {
          -- Inherit standard actions (open in split, vsplit, tab, etc.)
          ["default"] = actions.file_edit_or_qf,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
        },
      },
      pickers = {
        files = {
          -- Displays the filename cleanly first, followed by the parent directory path
          formatter = "path.filename_first",
        },
        buffers = {
          formatter = "path.filename_first",
        },
      },
      -- Customizing provider flags to ensure maximum execution speed via external utilities
      files = {
        cmd = "fd --type f --hidden --follow --exclude .git",
      },
      grep = {
        cmd = "rg --vimgrep --hidden --line-number --column --glob '!.git/'",
      },
    }
  end,
}
