return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "echasnovski/mini.icons" },
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
        return {
            keymap = {
                builtin = {
                    ["<C-d>"] = "preview-page-down",
                    ["<C-u>"] = "preview-page-up",
                },
                fzf = {
                    ["ctrl-a"] = "toggle-all",
                    ["ctrl-q"] = "select-all+accept",
                    ["tab"] = "down",
                    ["shift-tab"] = "up",
                },
            },
            pickers = {
                files = {
                    formatter = "path.filename_first",
                    cmd = "fd --type f --hidden --follow --exclude .git",
                },
                buffers = {
                    formatter = "path.filename_first",
                },
                grep = {
                    cmd = "rg --vimgrep --hidden --line-number --column --glob '!.git/'",
                },
            },
        }
    end,
}
