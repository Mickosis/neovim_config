return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			line_num = {
				enable = true,
				style = "#806d9c",
				priority = 10,
				use_treesitter = true,
			},
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = "#806d9c",
				use_treesitter = true,
				duration = 1,
				delay = 1,
			},
		})
	end,
}
