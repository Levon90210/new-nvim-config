local function augroup(name)
    return vim.api.nvim_create_augroup("core_" .. name, { clear = true })
end

-- Visual confirmation when copying text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("yank_highlight"),
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Streamlined Terminal behavior
vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("terminal_settings"),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd("startinsert")
    end,
})

-- Auto-refresh files altered externally (e.g., git checkouts)
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("check_time"),
    callback = function()
        if vim.o.buftype == "" then
            vim.cmd("checktime")
        end
    end,
})

-- Snap cursor back to the last known position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_location"),
    callback = function(event)
        local exclude = { gitcommit = true, gitrebase = true }
        if exclude[vim.bo[event.buf].filetype] then
            return
        end

        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(event.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Clean trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("trim_whitespace"),
    pattern = "*",
    callback = function()
        -- Save cursor position to prevent jumping
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Create an autocmd that runs whenever an LSP attaches to a file
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        vim.lsp.inlay_hint.enable(true, { buffer = event.buf })
    end

    local fzf = require("fzf-lua")

    vim.keymap.set('n', 'gd', fzf.lsp_definitions, { buffer = event.buf, desc = "Fzf: Go to definition" })
    vim.keymap.set('n', 'gi', fzf.lsp_implementations, { buffer = event.buf, desc = "Fzf: Go to implementation" })
    vim.keymap.set('n', 'gr', fzf.lsp_references, { buffer = event.buf, desc = "Fzf: Go to references" })
    vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, { buffer = event.buf, desc = "Fzf: Code actions" })

    vim.keymap.set('n', '<leader>d', fzf.diagnostics_document, { buffer = event.buf, desc = "Fzf: Document diagnostics" })
    vim.keymap.set('n', '<leader>D', fzf.diagnostics_workspace, { buffer = event.buf, desc = "Fzf: Workspace diagnostics" })

    vim.keymap.set('n', 'K',     vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Hover documentation" })
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = event.buf, desc = "LSP: Signature help" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: Rename symbol" })

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = event.buf, desc = "LSP: Go to previous diagnostic" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = event.buf, desc = "LSP: Go to next diagnostic" })
end,
})
