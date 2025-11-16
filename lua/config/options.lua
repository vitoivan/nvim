-- Configurações básicas do Neovim

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = true
vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true

-- Mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Remove builtin plugins
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1

-- Filetype detection
vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
		templ = "templ",
		tmpl = "templ",
	},
	filename = {},
	pattern = {},
})

-- Shortmess
vim.opt.shortmess = vim.opt.shortmess + {
	A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
	I = true, -- don't give the intro message when starting Vim |:intro|.
	W = true, -- don't give "written" or "[w]" when writing a file
	c = true, -- don't give |ins-completion-menu| messages
	m = true, -- use "[+]" instead of "[Modified]"
}

-- Codeium
vim.g.codeium_disable_bindings = 1

-- Highlight search
vim.opt.hlsearch = true

