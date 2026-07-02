return {
    "NickTsaizer/splitasm.nvim",
    cmd = {
        "SplitAsm",
        "SplitAsmOpen",
        "SplitAsmSetup",
        "SplitAsmConfig",
        "SplitAsmToggleSync",
        "SplitAsmToggleLineNumbers",
        "SplitAsmToggleHideAddress",
    },
    keys = {
        { "<leader>ao", "<cmd>SplitAsmOpen<cr>", desc = "SplitAsm: Open Assembly Split" },
        { "<leader>ac", "<cmd>SplitAsmConfig<cr>", desc = "SplitAsm: Show/Update Config" },
        { "<leader>as", "<cmd>SplitAsmToggleSync<cr>", desc = "SplitAsm: Toggle Sync" },
    },
    opts = {
        auto_sync = true,
        hide_address = false,
        source_row_colors = true,
        show_line_numbers = true,
        compiler_cmd = nil,
        executable_path = nil,
        source_path_mappings = {},
    },
}
