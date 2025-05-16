local M = {}

function M.generate(config)
	local variant = config.variant or "dark"
	local contrast = config.contrast or "normal"
	local transparent = config.transparent or false
	local italics = config.italics
	if italics == nil then
		italics = true
	end

	-- Palette for dark theme (normal contrast)
	local dark_normal = {
		-- Main colors
		bg0 = "#27312E", -- Main background (slightly lighter green)
		bg1 = "#2C3833", -- Secondary background (status line, floating windows)
		bg2 = "#3A4A43", -- Lighter background (line nr, folded text)
		bg3 = "#4F6358", -- Subtle selection background
		fg0 = "#D8CBB8", -- Main foreground
		fg1 = "#BCAF9A", -- Secondary foreground
		fg2 = "#9F9485", -- Dimmed foreground

		-- Accent colors (nature inspired)
		green = "#85A57C", -- Moss/lichen
		green_dim = "#678B63", -- Deeper moss
		blue = "#94B0A3", -- Misty blue-green
		blue_dim = "#76988A", -- Deeper misty blue
		aqua = "#A9C0B2", -- Sage
		aqua_dim = "#8B9F92", -- Deeper sage
		purple = "#B09296", -- Faded berry
		purple_dim = "#92757A", -- Deeper faded berry
		yellow = "#D9B97A", -- Autumn leaf
		yellow_dim = "#B89E5F", -- Deeper autumn leaf
		orange = "#CBA374", -- Oak
		orange_dim = "#AD8559", -- Deeper oak
		red = "#BA7F7F", -- Faded red mushroom
		red_dim = "#9C6464", -- Deeper red mushroom
		grey = "#8A958A", -- Stone grey

		-- Special purpose
		error = "#C96A71", -- Error text
		warning = "#D3B486", -- Warning text
		hint = "#95B0B0", -- Hint text
		info = "#88A89A", -- Info text

		-- Diff
		diff_add = "#4F6550", -- Added line
		diff_mod = "#566464", -- Modified line
		diff_del = "#654F50", -- Deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for dark theme (high contrast)
	local dark_high = {
		-- Main colors (same as normal contrast)
		bg0 = "#1E2623", -- Main background
		bg1 = "#2C3833", -- Secondary background (status line, floating windows)
		bg2 = "#3A4A43", -- Lighter background (line nr, folded text)
		bg3 = "#4F6358", -- Subtle selection background
		fg0 = "#E8DCC8", -- Brighter main foreground
		fg1 = "#CCBFA8", -- Brighter secondary foreground
		fg2 = "#AFA495", -- Brighter dimmed foreground

		-- Accent colors (brighter for better contrast)
		green = "#9DBD94", -- Brighter moss/lichen
		green_dim = "#82A37A", -- Brighter deeper moss
		blue = "#A5C7C9", -- Brighter misty blue-green
		blue_dim = "#88AFAF", -- Brighter deeper misty blue
		aqua = "#C0E0D2", -- Brighter sage
		aqua_dim = "#A2C2B4", -- Brighter deeper sage
		purple = "#D1A8C6", -- Brighter faded berry
		purple_dim = "#B48AA8", -- Brighter deeper faded berry
		yellow = "#F8D478", -- Brighter autumn leaf
		yellow_dim = "#DAB85A", -- Brighter deeper autumn leaf
		orange = "#F0C07C", -- Brighter oak
		orange_dim = "#D2A261", -- Brighter deeper oak
		red = "#E09C9C", -- Brighter faded red mushroom
		red_dim = "#C27E7E", -- Brighter deeper red mushroom
		grey = "#A2B0A2", -- Brighter stone grey

		-- Special purpose
		error = "#E27A81", -- Brighter error text
		warning = "#EBCD9E", -- Brighter warning text
		hint = "#ADBFBF", -- Brighter hint text
		info = "#9EB8A9", -- Brighter info text

		-- Diff
		diff_add = "#5A765A", -- Brighter added line
		diff_mod = "#667676", -- Brighter modified line
		diff_del = "#765A5B", -- Brighter deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for light theme (normal contrast)
	local light_normal = {
		-- Main colors
		bg0 = "#F5F2EB", -- Main background
		bg1 = "#E7E2D7", -- Secondary background (status line, floating windows)
		bg2 = "#D9D1C1", -- Lighter background (line nr, folded text)
		bg3 = "#CAC0B1", -- Subtle selection background
		fg0 = "#47544D", -- Main foreground
		fg1 = "#5A645B", -- Secondary foreground
		fg2 = "#6E7A71", -- Dimmed foreground

		-- Accent colors (nature inspired)
		green = "#678F5D", -- Moss/lichen
		green_dim = "#547A50", -- Deeper moss
		blue = "#678F7A", -- Misty blue-green
		blue_dim = "#4F6F60", -- Deeper misty blue
		aqua = "#6A9B85", -- Sage
		aqua_dim = "#577F6A", -- Deeper sage
		purple = "#8A7376", -- Faded berry
		purple_dim = "#70585A", -- Deeper faded berry
		yellow = "#B08F40", -- Autumn leaf
		yellow_dim = "#94732A", -- Deeper autumn leaf
		orange = "#A87A43", -- Oak
		orange_dim = "#8F5E30", -- Deeper oak
		red = "#9C6464", -- Faded red mushroom
		red_dim = "#835050", -- Deeper red mushroom
		grey = "#858F83", -- Stone grey

		-- Special purpose
		error = "#B24A55", -- Error text
		warning = "#B6924E", -- Warning text
		hint = "#628A8A", -- Hint text
		info = "#577E6F", -- Info text

		-- Diff
		diff_add = "#D9E3D5", -- Added line
		diff_mod = "#D9E0E1", -- Modified line
		diff_del = "#EAE1E1", -- Deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for light theme (high contrast)
	local light_high = {
		-- Main colors (same as normal contrast)
		bg0 = "#F5F2EB", -- Main background
		bg1 = "#E7E2D7", -- Secondary background (status line, floating windows)
		bg2 = "#D9D1C1", -- Lighter background (line nr, folded text)
		bg3 = "#CAC0B1", -- Subtle selection background
		fg0 = "#354237", -- Darker main foreground
		fg1 = "#47544D", -- Darker secondary foreground
		fg2 = "#5B645B", -- Darker dimmed foreground

		-- Accent colors (darker/more saturated for better contrast in light mode)
		green = "#4E703D", -- Darker moss/lichen
		green_dim = "#3B5932", -- Darker deeper moss
		blue = "#4E7060", -- Darker misty blue-green
		blue_dim = "#365042", -- Darker deeper misty blue
		aqua = "#517F6A", -- Darker sage
		aqua_dim = "#3E6350", -- Darker deeper sage
		purple = "#6E5558", -- Darker faded berry
		purple_dim = "#563A3D", -- Darker deeper faded berry
		yellow = "#9F7718", -- Darker autumn leaf
		yellow_dim = "#835F0A", -- Darker deeper autumn leaf
		orange = "#8A5E1B", -- Darker oak
		orange_dim = "#714408", -- Darker deeper oak
		red = "#7A3B3B", -- Darker faded red mushroom
		red_dim = "#612828", -- Darker deeper red mushroom
		grey = "#6B7569", -- Darker stone grey

		-- Special purpose
		error = "#AE303B", -- Darker error text
		warning = "#A67A36", -- Darker warning text
		hint = "#4A7070", -- Darker hint text
		info = "#3F6E57", -- Darker info text

		-- Diff
		diff_add = "#C9D3C5", -- Darker added line
		diff_mod = "#C9D2D3", -- Darker modified line
		diff_del = "#D9C9C9", -- Darker deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Select palette based on variant and contrast
	local p
	if variant == "light" then
		if contrast == "high" then
			p = light_high
		else
			p = light_normal
		end
	else
		if contrast == "high" then
			p = dark_high
		else
			p = dark_normal
		end
	end

	-- Set direct attribute values instead of using computed keys
	local use_italic = italics
	local use_bold = true
	local use_underline = true
	local use_undercurl = true

	-- Transparent background helper
	local bg = transparent and { bg = p.none } or { bg = p.bg0 }

	-- Theme highlight groups
	local theme = {
		-- Base
		Normal = { fg = p.fg0, bg = bg.bg },
		NormalFloat = { fg = p.fg0, bg = p.bg1 },
		NormalNC = {}, -- Normal in non-current windows
		NormalDim = { fg = p.fg2, bg = p.bg1 }, -- For dimmed windows

		-- Window/UI
		ColorColumn = { bg = p.bg1 },
		Conceal = { fg = p.grey },
		Cursor = { fg = p.bg0, bg = p.fg0 },
		CursorColumn = { bg = p.bg1 },
		CursorLine = { bg = p.bg1 },
		CursorIM = { fg = p.bg0, bg = p.fg0 },
		CursorLineNr = { fg = p.yellow, bg = p.bg1 },
		LineNr = { fg = p.grey, bg = bg.bg },
		SignColumn = { fg = p.fg1, bg = bg.bg },
		SignColumnDim = { fg = p.fg2, bg = p.bg1 }, -- For dimmed windows
		VertSplit = { fg = p.bg2, bg = bg.bg },
		WinSeparator = { fg = p.bg2, bg = bg.bg },
		Visual = { bg = p.bg3 },
		VisualNOS = { bg = p.bg3 },

		-- Folds
		Folded = { fg = p.grey, bg = p.bg1, italic = use_italic },
		FoldColumn = { fg = p.grey, bg = bg.bg },

		-- Search/Replace
		IncSearch = { fg = p.bg0, bg = p.orange },
		Search = { fg = p.bg0, bg = p.yellow_dim },
		Substitute = { fg = p.bg0, bg = p.green },

		-- Messages
		ErrorMsg = { fg = p.error, bold = use_bold },
		WarningMsg = { fg = p.warning, bold = use_bold },
		MoreMsg = { fg = p.green, bold = use_bold },
		ModeMsg = { fg = p.yellow, bold = use_bold },
		Question = { fg = p.yellow },

		-- Tabs/Statusline
		StatusLine = { fg = p.fg1, bg = p.bg1 },
		StatusLineNC = { fg = p.grey, bg = p.bg1 },
		TabLine = { fg = p.fg1, bg = p.bg1 },
		TabLineFill = { fg = p.fg1, bg = p.bg1 },
		TabLineSel = { fg = p.green, bg = p.bg0, bold = use_bold },

		-- File navigation
		Directory = { fg = p.green },
		Title = { fg = p.green, bold = use_bold },

		-- Popups/Menus
		Pmenu = { fg = p.fg0, bg = p.bg1 },
		PmenuSel = { fg = p.bg0, bg = p.green },
		PmenuSbar = { bg = p.bg2 },
		PmenuThumb = { bg = p.fg2 },

		-- Diff
		DiffAdd = { bg = p.diff_add },
		DiffChange = { bg = p.diff_mod },
		DiffDelete = { bg = p.diff_del, fg = p.bg3 },
		DiffText = { bg = p.diff_mod, bold = use_bold },

		-- Diagnostics
		DiagnosticError = { fg = p.error },
		DiagnosticWarn = { fg = p.warning },
		DiagnosticInfo = { fg = p.info },
		DiagnosticHint = { fg = p.hint },

		DiagnosticUnderlineError = { sp = p.error, undercurl = use_undercurl },
		DiagnosticUnderlineWarn = { sp = p.warning, undercurl = use_undercurl },
		DiagnosticUnderlineInfo = { sp = p.info, undercurl = use_undercurl },
		DiagnosticUnderlineHint = { sp = p.hint, undercurl = use_undercurl },

		-- Special
		NonText = { fg = p.bg3 },
		SpecialKey = { fg = p.bg3 },
		MatchParen = { fg = p.fg0, bg = p.bg3, bold = use_bold },
		SpellBad = { undercurl = use_undercurl, sp = p.error },
		SpellCap = { undercurl = use_undercurl, sp = p.warning },
		SpellLocal = { undercurl = use_undercurl, sp = p.info },
		SpellRare = { undercurl = use_undercurl, sp = p.hint },

		-- Syntax highlighting
		Comment = { fg = p.grey, italic = use_italic },

		Constant = { fg = p.purple },
		String = { fg = p.green },
		Character = { fg = p.green },
		Number = { fg = p.purple },
		Boolean = { fg = p.purple },
		Float = { fg = p.purple },

		Identifier = { fg = p.blue },
		Function = { fg = p.aqua },

		Statement = { fg = p.red },
		Conditional = { fg = p.red },
		Repeat = { fg = p.red },
		Label = { fg = p.red },
		Operator = { fg = p.fg0 },
		Keyword = { fg = p.red },
		Exception = { fg = p.red },

		PreProc = { fg = p.aqua },
		Include = { fg = p.aqua },
		Define = { fg = p.aqua },
		Macro = { fg = p.aqua },
		PreCondit = { fg = p.aqua },

		Type = { fg = p.yellow },
		StorageClass = { fg = p.orange },
		Structure = { fg = p.aqua },
		Typedef = { fg = p.yellow },

		Special = { fg = p.orange },
		SpecialChar = { fg = p.orange },
		Tag = { fg = p.orange },
		Delimiter = { fg = p.fg2 },
		SpecialComment = { fg = p.grey, italic = use_italic },
		Debug = { fg = p.orange },

		Underlined = { underline = use_underline },
		Ignore = { fg = p.bg1 },
		Error = { fg = p.error, bold = use_bold },
		Todo = { fg = p.yellow, bold = use_bold },

		-- LSP
		LspReferenceText = { bg = p.bg2 },
		LspReferenceRead = { bg = p.bg2 },
		LspReferenceWrite = { bg = p.bg2 },

		-- Treesitter
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { fg = p.red },
		["@keyword.return"] = { fg = p.red },
		["@keyword.operator"] = { fg = p.red },

		["@variable"] = { fg = p.blue }, -- Highlight variables
		["@variable.member"] = { fg = p.aqua }, -- Highlight member variables

		["@constructor"] = { fg = p.yellow },
		["@tag"] = { fg = p.red },
		["@tag.attribute"] = { fg = p.blue },
		["@tag.delimiter"] = { fg = p.fg2 },

		["@punctuation"] = { fg = p.fg2 },
		["@punctuation.bracket"] = { fg = p.fg2 },
		["@punctuation.delimiter"] = { fg = p.fg2 },
		["@punctuation.special"] = { fg = p.red },

		["@comment"] = { link = "Comment" },
		["@string"] = { link = "String" },
		["@string.regex"] = { fg = p.orange },
		["@string.escape"] = { fg = p.orange },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = p.aqua, italic = use_italic },
		["@function.macro"] = { fg = p.aqua },
		["@method"] = { fg = p.aqua },
		["@parameter"] = { fg = p.fg0, italic = use_italic },
		["@field"] = { fg = p.blue, bg = p.none, bold = false, italic = false }, -- Explicitly highlight fields like `req`
		["@property"] = { fg = p.blue, bg = p.none, bold = false, italic = false }, -- Explicitly highlight properties like `query` and `zip`
		["@conditional"] = { link = "Conditional" },

		["@namespace"] = { fg = p.yellow_dim },
		["@include"] = { link = "Include" },
		["@type"] = { link = "Type" },

		-- Git
		gitcommitSummary = { fg = p.green },
		gitcommitUntracked = { fg = p.grey },
		gitcommitDiscarded = { fg = p.grey },
		gitcommitSelected = { fg = p.grey },
		gitcommitUnmerged = { fg = p.grey },
		gitcommitOnBranch = { fg = p.grey },
		gitcommitArrow = { fg = p.grey },
		gitcommitFile = { fg = p.green_dim },

		-- GitSigns
		GitSignsAdd = { fg = p.green_dim, bg = bg.bg },
		GitSignsChange = { fg = p.blue_dim, bg = bg.bg },
		GitSignsDelete = { fg = p.red_dim, bg = bg.bg },

		-- Telescope
		TelescopeNormal = { fg = p.fg0, bg = p.bg1 },
		TelescopeBorder = { fg = p.bg2, bg = p.bg1 },
		TelescopePromptNormal = { fg = p.fg0, bg = p.bg1 },
		TelescopePromptBorder = { fg = p.bg2, bg = p.bg1 },
		TelescopePromptTitle = { fg = p.bg0, bg = p.green },
		TelescopePreviewTitle = { fg = p.bg0, bg = p.blue },
		TelescopeResultsTitle = { fg = p.bg0, bg = p.yellow },

		-- NvimTree
		NvimTreeNormal = { fg = p.fg0, bg = transparent and p.none or p.bg1 },
		NvimTreeFolderName = { fg = p.blue },
		NvimTreeFolderIcon = { fg = p.blue },
		NvimTreeOpenedFolderName = { fg = p.blue, bold = use_bold },
		NvimTreeEmptyFolderName = { fg = p.grey },
		NvimTreeIndentMarker = { fg = p.bg3 },
		NvimTreeSymlink = { fg = p.aqua, bold = use_bold },
		NvimTreeRootFolder = { fg = p.grey, bold = use_bold },

		-- WhichKey
		WhichKey = { fg = p.aqua },
		WhichKeyGroup = { fg = p.blue },
		WhichKeyDesc = { fg = p.fg0 },
		WhichKeySeparator = { fg = p.grey },
		WhichKeyFloat = { bg = p.bg1 },

		-- Indent Blankline
		IndentBlanklineChar = { fg = p.bg2 },
		IndentBlanklineContextChar = { fg = p.grey },
	}

	-- Add terminal colors
	vim.g.terminal_color_0 = p.bg2
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_5 = p.purple
	vim.g.terminal_color_6 = p.aqua
	vim.g.terminal_color_7 = p.fg1
	vim.g.terminal_color_8 = p.grey
	vim.g.terminal_color_9 = p.red
	vim.g.terminal_color_10 = p.green
	vim.g.terminal_color_11 = p.yellow
	vim.g.terminal_color_12 = p.blue
	vim.g.terminal_color_13 = p.purple
	vim.g.terminal_color_14 = p.aqua
	vim.g.terminal_color_15 = p.fg0

	return theme
end

return M
