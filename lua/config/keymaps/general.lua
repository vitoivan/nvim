-- Keymaps gerais

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>m", "@a")

-- Save and duplicate
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<C-d>", "<Esc>yyp")
vim.keymap.set("v", "<C-d>", "ykpgv")

-- Window management
vim.keymap.set("n", "<leader>s", "<cmd>wa<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Close window" })
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<C-z>", "")
vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("n", "q:", "")

