return {
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        opts = {
            at_edge = "stop",
            default_amount = 3,
        },
        keys = {
            { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move left across splits" },
            { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move down across splits" },
            { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move up across splits" },
            { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move right across splits" },
            { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
            { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
            { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
            { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
        },
    },
}
