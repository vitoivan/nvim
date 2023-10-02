return {
		"xiyaowong/transparent.nvim",
		event = "BufWinEnter",
		config = function()
			vim.cmd([[TransparentEnable]])
		end,
}
