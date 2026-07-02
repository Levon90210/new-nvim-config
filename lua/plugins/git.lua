return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, desc, opts)
        opts = opts or {}
        opts.buffer = bufnr
        opts.desc = "Gitsigns: " .. desc
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end, "Next Hunk")

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end, "Prev Hunk")

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, "Stage Hunk")
      map('n', '<leader>hr', gitsigns.reset_hunk, "Reset Hunk")

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "Stage Visual Hunk")

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "Reset Visual Hunk")

      map('n', '<leader>hS', gitsigns.stage_buffer, "Stage Buffer")
      map('n', '<leader>hR', gitsigns.reset_buffer, "Reset Buffer")
      map('n', '<leader>hp', gitsigns.preview_hunk, "Preview Hunk Popup")
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, "Preview Hunk Inline")

      map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
      end, "Blame Line (Full)")

      map('n', '<leader>hd', gitsigns.diffthis, "Diff This (Index)")

      map('n', '<leader>hD', function()
        gitsigns.diffthis('~')
      end, "Diff This (Last Commit)")

      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, "Send All Hunks to Quickfix")
      map('n', '<leader>hq', gitsigns.setqflist, "Send Buffer Hunks to Quickfix")

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, "Toggle Line Blame")
      map('n', '<leader>tw', gitsigns.toggle_word_diff, "Toggle Word Diff")

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk, "Select Hunk")
    end
  },
}
