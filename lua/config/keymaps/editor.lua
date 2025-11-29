-- Keymaps do editor

-- Search
vim.keymap.set("v", "<C-f>", 'y/<C-R>"<CR>')

-- Neotree
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle reveal=true<CR>")

-- Clipboard
vim.keymap.set("n", "<leader>p", '"+p<CR>')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>y", '"+y<CR>')
vim.keymap.set("v", "p", "pgvyw")

-- Code formatting
vim.keymap.set("x", "*", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
