-- Keymaps relacionados a Git

-- Git diff keymaps
vim.keymap.set("n", "<leader>gd", "<cmd>:Gvdiffsplit!<CR>")
vim.keymap.set("n", "<leader>gq", "<cmd>diffoff!<CR><cmd>only<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:diffget //2<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>:diffget //3<CR>")
vim.keymap.set("n", "<leader>H", "<cmd>:%diffget //2<CR>")
vim.keymap.set("n", "<leader>L", "<cmd>:%diffget //3<CR>")

-- LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")
vim.keymap.set("v", "<leader>gg", "<cmd>LazyGit<CR>")

