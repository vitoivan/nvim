-- Your custom keybindings (replace with your own)
vim.g.mapleader = " "

local register_keymap = function(modes, cmd, mapping, opts)
	for _, mode in ipairs(modes) do
		if mode == "sv" then
			mapping = "<Esc>" .. mapping
			mode = "v"
		end
		vim.api.nvim_set_keymap(mode, cmd, mapping, opts)
	end
end

-- normal mode
-- Packer

register_keymap({ "n", "sv" }, "<leader>ps", "<cmd>PackerSync<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>th", "<cmd>LocalHighlightToggle<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>fw", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

register_keymap({ "n", "v" }, "<C-z>", "", { noremap = true, silent = true })
register_keymap({ "n", "v" }, "q", "", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>RR", "<cmd>so $NVIM_PATH/init.lua<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>q", ":q<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>Q", ":qa!<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<leader>s", "<cmd>wa<CR>", { noremap = true, silent = true })
register_keymap({ "n", "v" }, "<C-c>", "<Esc>", { noremap = true, silent = true })
register_keymap({ "n" }, "<C-d>", "<Esc>yyp", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>p", '"+p<CR>', { noremap = true, silent = true })
register_keymap({ "n" }, "q:", "", { noremap = true, silent = true })
register_keymap({ "n" }, "<C-q>", "", { noremap = true, silent = true })
register_keymap({ "n" }, "<C-t>", "<cmd>tabnew<CR>", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>1", "1gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>1", "1gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>2", "2gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>3", "3gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>4", "4gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<leader>5", "5gt", { noremap = true, silent = true })
register_keymap({ "n" }, "<C-f>", "za", { noremap = true, silent = true })
register_keymap({ "n" }, "<C-_>", "gcc", { noremap = false, silent = true })
register_keymap({ "n", "sv" }, "<leader>gg", "<cmd>LazyGit<CR>", { noremap = false, silent = true })
register_keymap({ "n" }, "<leader>tt", "<cmd>TransparentToggle<CR>", { noremap = false, silent = true })
register_keymap({ "n" }, "<C-n>", "<cmd>Neotree toggle reveal=true<CR>", { noremap = false, silent = true })

-- visual mode
register_keymap({ "v" }, "<leader>y", '"+y<CR>', { noremap = true, silent = true })
register_keymap({ "v" }, "<C-d>", "ykpgv", { noremap = true, silent = true })
register_keymap({ "v" }, "p", "pgvyw", { noremap = true, silent = true })
register_keymap({ "v" }, "<leader>p", '"+p', { noremap = true, silent = true })
register_keymap({ "v" }, "<C-_>", "gcgv", { noremap = false, silent = true })

register_keymap({ "x" }, "*", "/\\<<C-R>=expand('<cword>')<CR>\\><CR>", { noremap = true, silent = true })
register_keymap({ "x" }, "<", "<gv", { noremap = true, silent = true })
register_keymap({ "x" }, ">", ">gv", { noremap = true, silent = true })
register_keymap({ "x" }, "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
register_keymap({ "x" }, "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- insert mode
register_keymap({ "i" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
register_keymap({ "i" }, "<Esc><leader>q", "<Esc>:q<CR>", { noremap = true, silent = true })

-- Telescope
register_keymap({ "n", "sv" }, "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
register_keymap({ "n", "sv" }, "<C-P>", "<cmd>Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
register_keymap(
	{ "n", "sv" },
	"<leader>?",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ noremap = true, silent = true }
)

-- Gitsigns
register_keymap({ "n", "sv" }, "<leader>gd", ":Gitsigns diffthis<CR><C-w>h", { noremap = true, silent = true })
