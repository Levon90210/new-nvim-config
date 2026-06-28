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
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            return {
                window = {
                    margin = {
                        horizontal = 1,
                        vertical = 0,
                    },
                },
                highlight = {
                    groups = {
                        InclineNormal = { guibg = "#1f2335", guifg = "#a9b1d6" },
                        InclineNormalNC = { guibg = "#16161e", guifg = "#787c99" }, -- Dims out on inactive splits
                    },
                },
                render = function(props)
                    local buf_name = vim.api.nvim_buf_get_name(props.buf)
                    local filename = vim.fn.fnamemodify(buf_name, ":t")

                    if filename == "" then
                        filename = "[No Name]"
                    end

                    local devicons = require("nvim-web-devicons")
                    local icon, icon_color = devicons.get_icon_color(filename)

                    local buffer_display = {}

                    if icon then
                        table.insert(buffer_display, { icon .. " ", guifg = icon_color })
                    end

                    local is_modified = vim.api.nvim_get_option_value("modified", { buf = props.buf })
                    if is_modified then
                        table.insert(buffer_display, { filename, gui = "bold,italic", guifg = "#ff9e64" })
                        table.insert(buffer_display, { " ●", guifg = "#ff9e64" })
                    else
                        table.insert(buffer_display, { filename })
                    end

                    local severities = {
                        error = vim.diagnostic.severity.ERROR,
                        warn = vim.diagnostic.severity.WARN,
                    }

                    local error_count = #vim.diagnostic.get(props.buf, { severity = severities.error })
                    local warn_count = #vim.diagnostic.get(props.buf, { severity = severities.warn })

                    if error_count > 0 or warn_count > 0 then
                        table.insert(buffer_display, { " │ " })
                        if error_count > 0 then
                            table.insert(buffer_display, { " " .. error_count .. " ", guifg = "#db4b4b" })
                        end
                        if warn_count > 0 then
                            table.insert(buffer_display, { " " .. warn_count, guifg = "#e0af68" })
                        end
                    end

                    return buffer_display
                end,
            }
        end,
    },
}
