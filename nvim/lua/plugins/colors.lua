return {
	{ 'echasnovski/mini.colors', version = false },
	{"rktjmp/lush.nvim"},
	{
		"https://github.com/nyoom-engineering/oxocarbon.nvim",
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function ()
			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme gruvbox]])
			vim.cmd([[hi String gui=none]])
			vim.cmd([[hi Todo gui=bold]])
			vim.cmd([[hi Comment gui=none]])
		end,
		opts = ...
	},
}
