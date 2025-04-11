local colors = {
	bg = "#101010",
	bg_alt = "#252525",
	gray_darker = "#353535",
	gray_dark = "#4D4D4D",
	gray = "#6A6A6A",
	gray_light = "#888888",
	base = "#BDBDBD",
	fg_alt = "#DEDEDE",
	fg = "#ECECEC",
	highlight = "#FFFFFF",

	error = "#FF5370",
	warn = "#F78C6C",
	info = "#82AAFF",
	hint = "#C3E88D",

	error_sp = "#FF5370",
	warn_sp = "#F78C6C",
	info_sp = "#82AAFF",
	hint_sp = "#C3E88D",
}

local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local function set_highlights(opts)
	vim.cmd.hi("clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd.syntax("reset")
	end
	vim.g.colors_name = "mana"

	local transparent = opts and opts.transparent or false
	if not transparent then
		hl("Normal", { fg = colors.fg, bg = colors.bg })
		hl("SignColumn", { fg = colors.gray_dark, bg = colors.bg })
	else
		hl("Normal", { fg = colors.fg, bg = "NONE" })
		hl("SignColumn", { fg = colors.gray_dark, bg = "NONE" })
	end

	hl("CursorLine", { bg = colors.bg_alt })
	hl("CursorLineNr", { fg = colors.highlight, bg = colors.bg_alt, bold = true })
	hl("LineNr", { fg = colors.gray })
	hl("Folded", { fg = colors.gray, bg = colors.gray_darker, italic = true })
	hl("Visual", { bg = colors.gray_dark })
	hl("Search", { fg = colors.bg, bg = colors.base, bold = true })
	hl("IncSearch", { fg = colors.bg, bg = colors.gray_light })
	hl("VertSplit", { fg = colors.gray_darker, bg = colors.bg })
	hl("StatusLine", { fg = colors.fg, bg = colors.bg_alt, bold = true })
	hl("StatusLineNC", { fg = colors.gray, bg = colors.gray_darker })
	hl("TabLine", { fg = colors.gray, bg = colors.gray_darker })
	hl("TabLineSel", { fg = colors.highlight, bg = colors.bg, bold = true })
	hl("TabLineFill", { bg = colors.gray_darker })
	hl("Directory", { fg = colors.base })

	-- Popup Menu (Completion, etc.)
	hl("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
	hl("PmenuSel", { fg = colors.bg, bg = colors.highlight })
	hl("PmenuSbar", { bg = colors.gray_darker })
	hl("PmenuThumb", { bg = colors.gray })

	-- Comments
	hl("@comment", { fg = colors.gray, italic = true })
	hl("Comment", { link = "@comment" })

	-- Basic Syntax
	hl("@keyword", { fg = colors.highlight, bold = true }) -- Make keywords pop
	hl("@conditional", { fg = colors.highlight }) -- if, else, etc. (slightly less prominent than keyword)
	hl("@repeat", { fg = colors.highlight }) -- for, while, etc.
	hl("@exception", { fg = colors.highlight }) -- try, catch
	hl("@operator", { fg = colors.gray_light }) -- +, -, =, etc.

	-- Literals
	hl("@string", { fg = colors.fg_alt })
	hl("@character", { fg = colors.fg_alt })
	hl("@number", { fg = colors.base })
	hl("@boolean", { fg = colors.base, bold = true })
	hl("@float", { link = "@number" })

	-- Identifiers
	hl("@function", { fg = colors.fg })
	hl("@function.macro", { fg = colors.fg, bold = true })
	hl("@method", { link = "@function" })
	hl("@constructor", { fg = colors.fg, bold = true })
	hl("@variable", { fg = colors.fg }) -- Default variables
	hl("@parameter", { fg = colors.gray_light, italic = true }) -- Function parameters less important
	hl("@constant", { fg = colors.base, bold = true })
	hl("@field", { fg = colors.base }) -- Struct/class fields
	hl("@property", { link = "@field" })

	-- Types & Structure
	hl("@type", { fg = colors.gray_light })
	hl("@type.builtin", { fg = colors.gray_light, bold = true })
	hl("@storageclass", { fg = colors.gray_light, bold = true }) -- static, const, etc.
	hl("@namespace", { fg = colors.gray_light })
	hl("@include", { fg = colors.highlight }) -- include, import, require
	hl("@label", { fg = colors.base, bold = true })

	-- Punctuation
	hl("@punctuation.delimiter", { fg = colors.gray_light }) -- ; , .
	hl("@punctuation.bracket", { fg = colors.fg }) -- () [] {}
	hl("@punctuation.special", { fg = colors.base }) -- # in markdown, $ in bash

	-- Tags (HTML, XML, etc.)
	hl("@tag", { fg = colors.base })
	hl("@tag.delimiter", { fg = colors.gray_light })
	hl("@tag.attribute", { fg = colors.gray_light, italic = true })

	-- Markup (Markdown, etc.)
	hl("@markup.heading", { fg = colors.highlight, bold = true })
	hl("@markup.bold", { bold = true })
	hl("@markup.italic", { italic = true })
	hl("@markup.strikethrough", { strikethrough = true })
	hl("@markup.link", { fg = colors.base, underline = true })
	hl("@markup.link.url", { fg = colors.gray, underline = true })
	hl("@markup.raw", { fg = colors.fg_alt, bg = colors.bg_alt }) -- Inline code
	hl("@markup.quote", { fg = colors.gray, italic = true })
	hl("@markup.list", { fg = colors.base })

	-- == Diagnostics ==
	hl("DiagnosticError", { fg = colors.error, bold = true })
	hl("DiagnosticWarn", { fg = colors.warn }) -- Maybe add italic? { fg = colors.warn, italic = true }
	hl("DiagnosticInfo", { fg = colors.info })
	hl("DiagnosticHint", { fg = colors.hint, italic = true })

	hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.error_sp })
	hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warn_sp })
	hl("DiagnosticUnderlineInfo", { underline = true, sp = colors.info_sp }) -- Use simple underline for info
	hl("DiagnosticUnderlineHint", { underdashed = true, sp = colors.hint_sp }) -- Dashed for hint

	-- == LSP Highlighting (Semantic Tokens, etc.) ==
	-- Types
	hl("@lsp.type.enum", { link = "@type" })
	hl("@lsp.type.interface", { link = "@type" })
	hl("@lsp.type.typeParameter", { link = "@type" })

	-- Functions and Methods
	hl("@lsp.type.function", { link = "@function" })
	hl("@lsp.type.method", { link = "@method" })

	-- Properties & Fields
	hl("@lsp.type.property", { link = "@property" })
	hl("@lsp.type.field", { link = "@field" })

	-- Keywords & Operators
	hl("@lsp.type.keyword", { link = "@keyword" })
	hl("@lsp.type.operator", { link = "@operator" })

	-- Literals
	hl("@lsp.type.enumMember", { link = "@constant" })
	hl("@lsp.type.boolean", { link = "@boolean" })
	hl("@lsp.type.string", { link = "@string" })
	hl("@lsp.type.number", { link = "@number" })

	-- Misc
	hl("@lsp.type.namespace", { link = "@namespace" })
	hl("@lsp.type.module", { link = "@module" })
	hl("@lsp.type.parameter", { link = "@parameter" })
	hl("@lsp.type.variable", { link = "@variable" })
	hl("@lsp.type.constant", { link = "@constant" })
	hl("@lsp.type.label", { link = "@label" })

	-- Built-in types (e.g., `int`, `string`)
	hl("@lsp.type.builtinType", { link = "@type.builtin" })

	-- GitSigns / Diff
	hl("DiffAdd", { fg = colors.fg, bg = "#2A402A" })
	hl("DiffChange", { fg = colors.fg, bg = "#2A354F" })
	hl("DiffDelete", { fg = colors.fg, bg = "#4D2528" })
	hl("DiffText", { fg = colors.bg, bg = colors.base, bold = true })
	hl("GitSignsAdd", { fg = colors.base })
	hl("GitSignsChange", { fg = colors.gray_light })
	hl("GitSignsDelete", { fg = colors.gray })

	-- Fallback / Generic
	hl("Delimiter", { fg = colors.gray_light })
	hl("Special", { fg = colors.base })
	hl("SpecialKey", { fg = colors.gray_dark })
end

local M = {}
local config = {
	transparent = false,
}

function M.load()
	vim.g.colors_name = "mana"
	set_highlights(config)
end

function M.setup(opts)
	opts = opts or {}

	if opts.colors then
		for k, v in pairs(opts.colors) do
			colors[k] = v
		end
	end

	if opts.transparent ~= nil then
		config.transparent = opts.transparent
	end

	M.load()

	return M
end

-- M.load()
return M
