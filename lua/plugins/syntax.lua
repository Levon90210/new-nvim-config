return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "rust", "python", "haskell", "cpp"
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp", "lua", "rust", "python", "haskell", "markdown" },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "^4.0.0",
        event = "VeryLazy",
        opts = {},
    }
}
