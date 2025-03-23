local colors = {
	bg = "#101010",
	bg_dark = "#1C2526",
	bg_alt = "#2D2D2D",
	gray_dark = "#4A4A4A",
	gray = "#6B6B6B",
	gray_light = "#8C8C8C",
	base = "#ADADAD",
	fg_alt = "#C9C9C9",
	fg = "#EBEBEB",
	highlight = "#F5F5F5",
	error = "#FF5370",
	warn = "#F78C6C",
	info = "#82AAFF",
	hint = "#C3E88D",
}

local function set_highlights()
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg_alt })
	vim.api.nvim_set_hl(0, "LineNr", { fg = colors.gray })
	vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray_dark, italic = true })
	vim.api.nvim_set_hl(0, "Visual", { bg = colors.gray })

	vim.api.nvim_set_hl(0, "@keyword", { fg = colors.base, bold = true })
	vim.api.nvim_set_hl(0, "@function", { fg = colors.base })
	vim.api.nvim_set_hl(0, "@string", { fg = colors.fg_alt })
	vim.api.nvim_set_hl(0, "@type", { fg = colors.gray_light })
	vim.api.nvim_set_hl(0, "@variable", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@constant", { fg = colors.base })

	vim.api.nvim_set_hl(0, "@comment", { fg = colors.gray })
	vim.api.nvim_set_hl(0, "@operator", { fg = colors.gray_light })
	vim.api.nvim_set_hl(0, "@punctuation", { fg = colors.gray_dark })
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@conditional", { fg = colors.fg_alt })
	vim.api.nvim_set_hl(0, "@repeat", { fg = colors.fg_alt })
	vim.api.nvim_set_hl(0, "@exception", { fg = colors.fg_alt })
	vim.api.nvim_set_hl(0, "@parameter", { fg = colors.gray_light })
	vim.api.nvim_set_hl(0, "@method", { fg = colors.base })
	vim.api.nvim_set_hl(0, "@field", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@property", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@number", { fg = colors.fg_alt })
	vim.api.nvim_set_hl(0, "@tag", { fg = colors.base })
	vim.api.nvim_set_hl(0, "@label", { fg = colors.base })
	vim.api.nvim_set_hl(0, "@namespace", { fg = colors.gray_light })

	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warn })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.hint })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warn })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })
end

local M = {}

function M.setup(opts)
	opts = opts or {}

	if opts.colors then
		for k, v in pairs(opts.colors) do
			colors[k] = v
		end
	end

	return M
end

function M.load()
	vim.g.colors_name = "mana"
	set_highlights()
end

M.load()
return M
