local M = {}

if vim.g.code_statusline_color == nil or vim.g.code_statusline_color:gsub("%s+", "") == "" then
	M.status_color = "nord"
else
	M.status_color = vim.g.code_statusline_color:gsub("%s+", "")
end

M.wombat = {
	default_fg = "#d0d0d0",
	default_bg = "#444444",
	colors = {
		bg1 = "#585858",
		bg2 = "#808080",
		dark = "#303030",
		light = "#FFFFFF",
		normal = "#89c6f2",
		visual = "#f2c68a",
		insert = "#95e454",
		replace = "#e5796d",
		command = "#e5796d",
		op = "#f0a0c0",
	},
}
M.gruvbox = {
	default_fg = "#bdae93",
	default_bg = "#3c3836",
	colors = {
		bg1 = "#504945",
		bg2 = "#7c6f65",
		dark = "#282828",
		light = "#fbf1c7",
		normal = "#a89984",
		visual = "#fe8019",
		insert = "#83a598",
		replace = "#689d6a",
		command = "#458588",
		op = "#83a598",
	},
}
M.nord = {
	default_fg = "#8FBCBB",
	default_bg = "#3a4252",
	colors = {
		bg1 = "#3b4252",
		bg2 = "#4c566a",
		dark = "#2e3440",
		light = "#d8dee9",
		normal = "#87c0d0",
		visual = "#a3be8c",
		insert = "#5E81AC",
		replace = "#bf616a",
		command = "#B48EAD",
		op = "#D08770",
	},
}
M.neon = {
	default_fg = "#abb2bf",
	default_bg = "#333644",
	colors = {
		bg1 = "#363a49",
		bg2 = "#676E95",
		dark = "#2b2d37",
		light = "#c5cdd9",
		normal = "#a9a1e1",
		visual = "#ADD8E6",
		insert = "#d38aea",
		replace = "#ECBE7B",
		command = "#4db5bd",
		op = "#a9a1e1",
	},
}

return M
