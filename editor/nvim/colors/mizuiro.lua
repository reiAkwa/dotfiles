local M = {}

M.setup = function()

  vim.o.background = "light"
  vim.g.colors_name = "mizuiro"

  local colors = {
    black = "#3B3B3B",
    white = "#F0F8FF",

    red = "#C998AE",
    green = "#7FAD9C",
    yellow = "#CFB886",
    blue = "#56A0D1",
    magenta = "#CBA0E3",
    cyan = "#99BFD1",
    gray = "#C2C2C2",
  }

  local function hl(groups, opts)
    vim.api.nvim_set_hl(0, groups, opts)
  end

  hl("Normal", { fg = colors.black })
  hl("Directory", { fg = colors.green, underline = true })
  hl("NormalFloat", { fg = colors.black })
  hl("Cursor", { fg = colors.white, bg = colors.blue })
  hl("TermCursor", { fg = colors.white, bg = colors.blue })
  hl("CursorLineNr", { fg = colors.blue })
  hl("MatchParen", { bg = colors.cyan, bold = true })
  hl("ModeMsg", { fg = colors.black , bg = colors.cyan })
  hl("MsgArea", { fg = colors.black ,  bg = colors.white })
  hl("PmenuSel", { fg = colors.white, bg = colors.blue })
  hl("StatusLine", { bg = colors.cyan })
  hl("StatusLineNC", { bg = colors.gray })
  hl("WinBar", { fg = colors.black, bg = colors.cyan })
  hl("WinBarNC", { fg = colors.black, bg = colors.gray })
  hl("Visual", { fg = colors.white, bg = colors.cyan })
  hl("Search", { fg = colors.black, bg = colors.red, bold = true })
  hl("ErrorMsg", { fg = colors.black, bg = colors.red })

  hl("DiffAdd", { fg = colors.black, bg = colors.green })
  hl("DiffChange", { fg = colors.black, bg = colors.gray })
  hl("DiffDelete", { fg = colors.black, bg = colors.red })
  hl("DiffText", { fg = colors.black, bg = colors.cyan })


  hl("Comment", { fg = colors.gray, italic = true })
  hl("String", { fg = colors.green })
  hl("Identifier", { fg = colors.cyan })
  hl("Function", { fg = colors.cyan })
  hl("Keyword", { fg = colors.blue, italic = true })
  hl("Error", { fg = colors.black, bg = colors.red })
  hl("Number", { fg = colors.yellow })
  hl("Character", { fg = colors.yellow, underline = true })
  hl("Constant", { fg = colors.red, underline = true })
  hl("Boolean", { fg = colors.red, italic = true, underline = false })
  hl("Special", { fg = colors.black })

  hl("Todo", { fg = colors.blue })

  hl("Add", { fg = colors.green })
  hl("Changed", { fg = colors.cyan })
  hl("Removed", { fg = colors.red })

  hl("Conditional", { fg = colors.red, italic = true })
  hl("Repeat", { fg = colors.red, italic = true })
  hl("Exception", { fg = colors.red, italic = true })
  hl("Label", { fg = colors.red, italic = true })

  hl("Type", { fg = colors.blue })

  hl("PreProc", { fg = colors.blue, italic = true })

  local which_key_ok, _ = pcall(vim.api.nvim_get_hl_by_name, "WhichKey", true)
  if which_key_ok then
    hl("WhichKeyDesc", { fg = colors.black })
  end
end

M.setup()
