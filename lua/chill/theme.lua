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
		bg1 = "#2A342F", -- Secondary background (status line, floating windows)
		bg2 = "#384740", -- Lighter background (line nr, folded text)
		bg3 = "#4B5E54", -- Subtle selection background
		fg0 = "#D3C7B1", -- Main foreground
		fg1 = "#B7AC95", -- Secondary foreground
		fg2 = "#9A9082", -- Dimmed foreground

		-- Accent colors (nature inspired)
		green = "#7C9C73", -- Moss/lichen
		green_dim = "#5F7959", -- Deeper moss
		blue = "#8BA59B", -- Misty blue-green
		blue_dim = "#6D8980", -- Deeper misty blue
		aqua = "#A1B5A8", -- Sage
		aqua_dim = "#839089", -- Deeper sage
		purple = "#A68F92", -- Faded berry
		purple_dim = "#846F72", -- Deeper faded berry
		yellow = "#D1B171", -- Autumn leaf
		yellow_dim = "#B39556", -- Deeper autumn leaf
		orange = "#C39B6A", -- Oak
		orange_dim = "#A57D4F", -- Deeper oak
		red = "#B07676", -- Faded red mushroom
		red_dim = "#925B5B", -- Deeper red mushroom
		grey = "#808B82", -- Stone grey

		-- Special purpose
		error = "#C25D64", -- Error text
		warning = "#CBAD7E", -- Warning text
		hint = "#8DA3A3", -- Hint text
		info = "#7E9C8F", -- Info text

		-- Diff
		diff_add = "#475844", -- Added line
		diff_mod = "#4D5B5D", -- Modified line
		diff_del = "#5C4A4B", -- Deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for dark theme (high contrast)
	local dark_high = {
		-- Main colors (same as normal contrast)
		bg0 = "#1C2321", -- Main background
		bg1 = "#2A342F", -- Secondary background (status line, floating windows)
		bg2 = "#384740", -- Lighter background (line nr, folded text)
		bg3 = "#4B5E54", -- Subtle selection background
		fg0 = "#E3D7C1", -- Brighter main foreground
		fg1 = "#C7BCA5", -- Brighter secondary foreground
		fg2 = "#AAA092", -- Brighter dimmed foreground

		-- Accent colors (brighter for better contrast)
		green = "#94B48B", -- Brighter moss/lichen
		green_dim = "#79A171", -- Brighter deeper moss
		blue = "#9CBFC3", -- Brighter misty blue-green
		blue_dim = "#7FA3A8", -- Brighter deeper misty blue
		aqua = "#B5D0C7", -- Brighter sage
		aqua_dim = "#97B2A9", -- Brighter deeper sage
		purple = "#C9A0BC", -- Brighter faded berry
		purple_dim = "#AB829E", -- Brighter deeper faded berry
		yellow = "#F0CC70", -- Brighter autumn leaf
		yellow_dim = "#D2AE52", -- Brighter deeper autumn leaf
		orange = "#E5B06C", -- Brighter oak
		orange_dim = "#C79251", -- Brighter deeper oak
		red = "#D88C8C", -- Brighter faded red mushroom
		red_dim = "#BA6E6E", -- Brighter deeper red mushroom
		grey = "#98A49A", -- Brighter stone grey

		-- Special purpose
		error = "#D26D74", -- Brighter error text
		warning = "#DBBD8E", -- Brighter warning text
		hint = "#9DB3B3", -- Brighter hint text
		info = "#8EAC9F", -- Brighter info text

		-- Diff
		diff_add = "#526854", -- Brighter added line
		diff_mod = "#5D6B6D", -- Brighter modified line
		diff_del = "#6C5A5B", -- Brighter deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for light theme (normal contrast)
	local light_normal = {
		-- Main colors
		bg0 = "#F3F0E9", -- Main background
		bg1 = "#E5E0D5", -- Secondary background (status line, floating windows)
		bg2 = "#D7CFBF", -- Lighter background (line nr, folded text)
		bg3 = "#C8C0AF", -- Subtle selection background
		fg0 = "#435049", -- Main foreground
		fg1 = "#566459", -- Secondary foreground
		fg2 = "#6A796F", -- Dimmed foreground

		-- Accent colors (nature inspired)
		green = "#5E8055", -- Moss/lichen
		green_dim = "#4B694A", -- Deeper moss
		blue = "#5D7C72", -- Misty blue-green
		blue_dim = "#455E56", -- Deeper misty blue
		aqua = "#61897A", -- Sage
		aqua_dim = "#4E6D62", -- Deeper sage
		purple = "#7E696C", -- Faded berry
		purple_dim = "#664E51", -- Deeper faded berry
		yellow = "#A78738", -- Autumn leaf
		yellow_dim = "#8B6F2A", -- Deeper autumn leaf
		orange = "#9A6E3B", -- Oak
		orange_dim = "#815428", -- Deeper oak
		red = "#925B5B", -- Faded red mushroom
		red_dim = "#794848", -- Deeper red mushroom
		grey = "#7B8579", -- Stone grey

		-- Special purpose
		error = "#AE404B", -- Error text
		warning = "#A68A46", -- Warning text
		hint = "#5A8080", -- Hint text
		info = "#4F7E67", -- Info text

		-- Diff
		diff_add = "#D1DBCD", -- Added line
		diff_mod = "#D1DADB", -- Modified line
		diff_del = "#E2D1D1", -- Deleted line

		-- None is used to reset highlight
		none = "NONE",
	}

	-- Palette for light theme (high contrast)
	local light_high = {
		-- Main colors (same as normal contrast)
		bg0 = "#F3F0E9", -- Main background
		bg1 = "#E5E0D5", -- Secondary background (status line, floating windows)
		bg2 = "#D7CFBF", -- Lighter background (line nr, folded text)
		bg3 = "#C8C0AF", -- Subtle selection background
		fg0 = "#313E35", -- Darker main foreground
		fg1 = "#445249", -- Darker secondary foreground
		fg2 = "#58675F", -- Darker dimmed foreground

		-- Accent colors (darker/more saturated for better contrast in light mode)
		green = "#3E6035", -- Darker moss/lichen
		green_dim = "#2B492A", -- Darker deeper moss
		blue = "#3D5C52", -- Darker misty blue-green
		blue_dim = "#253E36", -- Darker deeper misty blue
		aqua = "#41695A", -- Darker sage
		aqua_dim = "#2E4D42", -- Darker deeper sage
		purple = "#5E494C", -- Darker faded berry
		purple_dim = "#462E31", -- Darker deeper faded berry
		yellow = "#876718", -- Darker autumn leaf
		yellow_dim = "#6B4F0A", -- Darker deeper autumn leaf
		orange = "#7A4E1B", -- Darker oak
		orange_dim = "#613408", -- Darker deeper oak
		red = "#723B3B", -- Darker faded red mushroom
		red_dim = "#592828", -- Darker deeper red mushroom
		grey = "#5B6559", -- Darker stone grey

		-- Special purpose
		error = "#9E303B", -- Darker error text
		warning = "#967A36", -- Darker warning text
		hint = "#4A7070", -- Darker hint text
		info = "#3F6E57", -- Darker info text

		-- Diff
		diff_add = "#C1CBBD", -- Darker added line
		diff_mod = "#C1CACB", -- Darker modified line
		diff_del = "#D2C1C1", -- Darker deleted line

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

		["@variable"] = { fg = p.fg0 },
		["@variable.builtin"] = { fg = p.red, italic = use_italic },

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
		["@field"] = { fg = p.blue },
		["@property"] = { fg = p.blue },
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
