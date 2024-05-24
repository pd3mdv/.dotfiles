vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open netrw"})

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
