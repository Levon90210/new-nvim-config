return {
    -- Tokyo Night Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- Load immediately on startup
        priority = 1000, -- Ensure it loads before everything else
        config = function()
            vim.cmd([[colorscheme tokyonight-storm]])
        end,
    },
    {
        "echasnovski/mini.icons",
        lazy = false,
        opts = {},
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "echasnovski/mini.icons" },
        opts = function()
            return {
                options = {
                    component_separators = { left = "│", right = "│" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = { "grug-far", "oil" },
                        winbar = {},
                    },
                    globalstatus = true,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    },
                },
                sections = {
                    lualine_b = {
                        { "branch", icon = "" },
                        {
                            "diff",
                            symbols = { added = " ", modified = " ", removed = " " }
                        },
                    },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            path = 1,
                        },
                    },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            sections = { "error", "warn", "info", "hint" },
                            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype", icon_only = false },
                    },
                },
                extensions = { "lazy", "fzf", "oil" },
            }
        end,
    },
}
