local key = vim.keymap.set

key("n", "<leader>w", "<cmd>update<CR>", { desc = "Save buffer if modified" })
key("n", "<leader>.", "<cmd>e #<CR>", { desc = "Switch to alternate buffer" })
key("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
key("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
key("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

key("v", "<", "<gv", { silent = true, desc = "Indent left" })
key("v", ">", ">gv", { silent = true, desc = "Indent right" })

key("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
key("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })
key("v", "p", '"_dP', { silent = true, desc = "Paste without overwriting register" })

key("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
key("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
key("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
key("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

key("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
key("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
key("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
key("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

key("n", "n", "nzzzv", { desc = "Next search match" })
key("n", "N", "Nzzzv", { desc = "Previous search match" })

key("n", "q", "<Nop>")
key("n", "<leader>q", "q")
