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

key("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
key("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal vertical" })
key("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal horizontal" })
key("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: Go to left window" })
key("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: Go to lower window" })
key("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: Go to upper window" })
key("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: Go to right window" })

key("n", "n", "nzzzv", { desc = "Next search match" })
key("n", "N", "Nzzzv", { desc = "Previous search match" })

key("n", "q", "<Nop>")
key("n", "<leader>q", "q")
