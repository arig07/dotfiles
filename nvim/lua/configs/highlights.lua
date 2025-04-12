--- @class Highlight
--- @field setup fun(opts?: string): nil
return {
  setup = function(opts)
    local thm = {}
    local b16 = {
      { 'black', os.getenv 'BLACK_HEX' },
      { 'red', os.getenv 'RED_HEX' },
      { 'green', os.getenv 'GREEN_HEX' },
      { 'yellow', os.getenv 'YELLOW_HEX' },
      { 'blue', os.getenv 'BLUE_HEX' },
      { 'magenta', os.getenv 'MAGENTA_HEX' },
      { 'cyan', os.getenv 'CYAN_HEX' },
      { 'white', os.getenv 'WHITE_HEX' },
      { 'brightblack', os.getenv 'BRIGHTBLACK_HEX' },
      { 'brightred', os.getenv 'BRIGHTRED_HEX' },
      { 'brightgreen', os.getenv 'BRIGHTGREEN_HEX' },
      { 'brightyellow', os.getenv 'BRIGHTYELLOW_HEX' },
      { 'brightblue', os.getenv 'BRIGHTBLUE_HEX' },
      { 'brightmagenta', os.getenv 'BRIGHTMAGENTA_HEX' },
      { 'brightcyan', os.getenv 'BRIGHTCYAN_HEX' },
      { 'brightwhite', os.getenv 'BRIGHTWHITE_HEX' },
    }

    ---------------------------- Terminal ---------------------------------------
    for i, color in ipairs(b16) do
      vim.g['terminal_color_' .. (i - 1)] = assert(color[2], string.upper(color[1]) .. '_HEX not set!')
      thm[color[1]] = color[2]
    end

    ---------------------------- Theme Extras ---------------------------------------
    thm = vim.tbl_deep_extend('force', thm, {
      background = os.getenv 'NVIM_BG',
      grey = os.getenv 'GREY_HEX',
      dark = os.getenv 'DARK_HEX',
    })

    ---------------------------- Spectre ----------------------------------
    if opts == 'spectre' then
      for group, options in pairs {
        SpectreHeader = { fg = thm.brightmagenta, bg = thm.background, bold = true },
        SpectreBody = { fg = thm.black, bg = thm.background, bold = true },
        SpectreFile = { fg = thm.yellow, bg = thm.background },
        SpectreDir = { fg = thm.blue, bg = thm.background },
        SpectreSearch = { fg = thm.brightred, bg = thm.grey },
        SpectreBorder = { fg = thm.brightblack, bg = thm.background },
        SpectreReplace = { fg = thm.brightgreen, bg = thm.grey },
      } do
        vim.api.nvim_set_hl(0, group, options)
      end

      return
    end

    for group, options in pairs {
      ---------------------------- Defaults ----------------------------------

      Added = { fg = thm.green },
      Changed = { fg = thm.yellow },
      ColorColumn = { bg = thm.black },
      Comment = { fg = thm.brightblack, italic = true },
      Conceal = { bg = thm.background },
      Debug = { fg = thm.white },
      DevIconDefault = { fg = thm.red },
      Directory = { fg = thm.blue },
      Error = { fg = thm.black, bg = thm.background },
      ErrorMsg = { fg = thm.red, bg = thm.background },
      Exception = { fg = thm.magenta },

      -- Cursor
      Cursor = { fg = thm.black, bg = thm.grey },
      CursorColumn = { bg = thm.grey },
      CursorLine = { bg = thm.grey },
      CursorLineNr = { fg = thm.brightmagenta },

      -- QuickFix
      qfLineNr = { fg = thm.brightyellow, bg = thm.background },
      qfFileName = { fg = thm.black, bg = thm.background },
      QuickFixLine = { bold = true, bg = thm.grey },

      -- Folds
      Folded = { fg = thm.black, bg = thm.background, italic = true },
      FoldColumn = { fg = thm.brightblue, bg = thm.background },
      CursorLineFold = { fg = thm.brightmagenta, bg = thm.background },

      LineNr = { fg = thm.brightblack },
      FloatBorder = { fg = thm.brightblack },
      FloatTitle = { fg = thm.magenta },
      Macro = { fg = thm.white },
      MatchParen = { link = 'MatchWord' },
      MatchWord = { bg = thm.grey, fg = thm.brightred },
      ModeMsg = { fg = thm.green },
      MoreMsg = { fg = thm.green },
      NonText = { fg = thm.black },
      Normal = { fg = thm.white, bg = thm.background },
      NormalFloat = { bg = thm.background },
      NvimInternalError = { fg = thm.red },

      Pmenu = { bg = thm.dark },
      PmenuSbar = { bg = thm.dark },
      PmenuSel = { fg = thm.brightgreen, bg = thm.grey },
      PmenuThumb = { bg = thm.background },

      Question = { fg = thm.blue },
      Removed = { fg = thm.red },
      SignColumn = { fg = thm.black },
      SpecialKey = { fg = thm.black },
      Substitute = { fg = thm.brightred, bg = thm.grey },
      Title = { fg = thm.blue },
      TooLong = { fg = thm.white },
      Visual = { bg = thm.grey },
      VisualNOS = { fg = thm.white },
      WarningMsg = { fg = thm.white, bg = thm.background },
      WildMenu = { fg = thm.yellow, bg = thm.grey },
      WinBar = { bg = thm.background },
      WinBarNC = { bg = thm.background },
      WinSeparator = { fg = thm.brightblack },
      healthSuccess = { bg = thm.green, fg = thm.black },
      YankFlash = { fg = thm.brightyellow, bg = thm.grey },

      ---------------------------- Syntax ----------------------------------

      Boolean = { fg = thm.red },
      Character = { fg = thm.cyan },
      Conditional = { fg = thm.magenta },
      Constant = { fg = thm.black },
      Define = { fg = thm.magenta, sp = 'none' },
      Delimiter = { fg = thm.cyan },
      Float = { fg = thm.brightyellow },
      Variable = { fg = thm.black },
      Function = { fg = thm.blue },
      Identifier = { fg = thm.red, sp = 'none' },
      Include = { fg = thm.brightmagenta },
      Keyword = { fg = thm.magenta },
      Label = { fg = thm.yellow },
      Number = { fg = thm.brightyellow },
      Operator = { fg = thm.black, sp = 'none' },
      PreProc = { fg = thm.yellow },
      Repeat = { fg = thm.yellow },
      Special = { fg = thm.blue },
      SpecialChar = { fg = thm.cyan },
      Statement = { fg = thm.magenta },
      StorageClass = { fg = thm.yellow },
      String = { fg = thm.green },
      Structure = { fg = thm.red },
      Tag = { fg = thm.brightyellow },
      Todo = { fg = thm.cyan },
      Type = { fg = thm.yellow, sp = 'none' },
      Typedef = { fg = thm.yellow },

      -- Treesitter
      ['@variable'] = { fg = thm.black },
      ['@variable.builtin'] = { fg = thm.yellow },
      ['@variable.parameter'] = { fg = thm.white },
      ['@variable.member'] = { fg = thm.white },
      ['@variable.member.key'] = { fg = thm.white },

      ['@module'] = { fg = thm.white },
      -- ["@module.builtin"] = { fg = thm.white },

      ['@constant'] = { fg = thm.white },
      ['@constant.builtin'] = { fg = thm.yellow },
      ['@constant.macro'] = { fg = thm.white },

      ['@string'] = { fg = thm.green },
      ['@string.regex'] = { fg = thm.cyan },
      ['@string.escape'] = { fg = thm.cyan },
      ['@character'] = { fg = thm.white },
      -- ["@character.special"] = { fg = thm.white },
      ['@number'] = { fg = thm.red },
      ['@number.float'] = { fg = thm.red },

      ['@annotation'] = { fg = thm.black },
      ['@attribute'] = { fg = thm.yellow },
      ['@error'] = { fg = thm.white },

      ['@keyword.exception'] = { fg = thm.white },
      ['@keyword'] = { fg = thm.magenta },
      ['@keyword.function'] = { fg = thm.magenta },
      ['@keyword.return'] = { fg = thm.magenta },
      ['@keyword.operator'] = { fg = thm.magenta },
      ['@keyword.import'] = { link = 'Include' },
      ['@keyword.conditional'] = { fg = thm.magenta },
      ['@keyword.conditional.ternary'] = { fg = thm.magenta },
      ['@keyword.repeat'] = { fg = thm.yellow },
      ['@keyword.storage'] = { fg = thm.yellow },
      ['@keyword.directive.define'] = { fg = thm.magenta },
      ['@keyword.directive'] = { fg = thm.yellow },

      ['@function'] = { fg = thm.blue },
      ['@function.builtin'] = { fg = thm.blue },
      ['@function.macro'] = { fg = thm.white },
      ['@function.call'] = { fg = thm.blue },
      ['@function.method'] = { fg = thm.blue },
      ['@function.method.call'] = { fg = thm.blue },
      ['@constructor'] = { fg = thm.cyan },

      ['@operator'] = { fg = thm.black },
      ['@reference'] = { fg = thm.black },
      ['@punctuation.bracket'] = { fg = thm.black },
      ['@punctuation.delimiter'] = { fg = thm.black },
      ['@symbol'] = { fg = thm.green },
      ['@tag'] = { fg = thm.yellow },
      ['@tag.attribute'] = { fg = thm.white },
      ['@tag.delimiter'] = { fg = thm.black },
      ['@text'] = { fg = thm.black },
      ['@text.emphasis'] = { fg = thm.yellow },
      ['@text.strike'] = { fg = thm.black, strikethrough = true },
      ['@type.builtin'] = { fg = thm.yellow },
      ['@definition'] = { sp = thm.grey, underline = true },
      ['@scope'] = { bold = true },
      ['@property'] = { fg = thm.white },

      ['@markup.heading'] = { fg = thm.blue },
      ['@markup.raw'] = { fg = thm.yellow },
      ['@markup.link'] = { fg = thm.white },
      ['@markup.link.url'] = { fg = thm.yellow, underline = true },
      ['@markup.link.label'] = { fg = thm.cyan },
      ['@markup.list'] = { fg = thm.white },
      ['@markup.strong'] = { bold = true },
      ['@markup.underline'] = { underline = true },
      ['@markup.italic'] = { italic = true },
      ['@markup.strikethrough'] = { strikethrough = true },
      ['@markup.quote'] = { bg = thm.red },

      ['@comment'] = { fg = thm.brightblack, italic = true },
      ['@comment.todo'] = { fg = thm.brightblue },
      ['@comment.warning'] = { fg = thm.brightyellow },
      ['@comment.note'] = { fg = thm.brightcyan },
      ['@comment.danger'] = { fg = thm.brightred },

      ['@diff.plus'] = { fg = thm.green },
      ['@diff.minus'] = { fg = thm.red },
      ['@diff.delta'] = { fg = thm.black },

      ---------------------------- LSP ----------------------------------

      -- Completions
      CmpBorder = { fg = thm.brightmagenta },
      CmpItemAbbr = { fg = thm.black },
      CmpItemAbbrMatch = { fg = thm.brightred },
      CmpDoc = { bg = thm.background },
      CmpDocBorder = { fg = thm.brightmagenta },

      CmpPmenu = { bg = thm.background },
      CmpSel = { bg = thm.grey },

      CmpItemKindConstant = { fg = thm.brightyellow },
      CmpItemKindFunction = { fg = thm.blue },
      CmpItemKindIdentifier = { fg = thm.red },
      CmpItemKindField = { fg = thm.red },
      CmpItemKindVariable = { fg = thm.black },
      CmpItemKindSnippet = { fg = thm.brightmagenta },
      CmpItemKindText = { fg = thm.white },
      CmpItemKindStructure = { fg = thm.brightmagenta },
      CmpItemKindType = { fg = thm.yellow },
      CmpItemKindKeyword = { fg = thm.magenta },
      CmpItemKindMethod = { fg = thm.blue },
      CmpItemKindConstructor = { fg = thm.brightyellow },
      CmpItemKindFolder = { fg = thm.blue },
      CmpItemKindModule = { fg = thm.yellow },
      CmpItemKindProperty = { fg = thm.red },
      CmpItemKindEnum = { fg = thm.blue },
      CmpItemKindUnit = { fg = thm.brightmagenta },
      CmpItemKindClass = { fg = thm.yellow },
      CmpItemKindFile = { fg = thm.brightmagenta },
      CmpItemKindInterface = { fg = thm.green },
      CmpItemKindColor = { fg = thm.white },
      CmpItemKindReference = { fg = thm.cyan },
      CmpItemKindEnumMember = { fg = thm.yellow },
      CmpItemKindStruct = { fg = thm.brightmagenta },
      CmpItemKindValue = { fg = thm.white },
      CmpItemKindEvent = { fg = thm.yellow },
      CmpItemKindOperator = { fg = thm.cyan },
      CmpItemKindTypeParameter = { fg = thm.red },
      CmpItemKindCopilot = { fg = thm.green },
      CmpItemKindCodeium = { fg = thm.brightgreen },
      CmpItemKindTabNine = { fg = thm.magenta },
      CmpItemKindSuperMaven = { fg = thm.yellow },

      -- Mason
      MasonHeader = { fg = thm.brightmagenta },
      MasonHighlight = { fg = thm.blue },
      MasonHighlightBlock = { fg = thm.brightgreen },
      MasonHighlightBlockBold = { link = 'MasonHighlightBlock' },
      MasonHeaderSecondary = { link = 'MasonHighlightBlock' },
      MasonMuted = { fg = thm.grey },
      MasonMutedBlock = { fg = thm.black },

      -- Lspconfig
      LspReferenceText = { bg = thm.grey },
      LspReferenceRead = { bg = thm.grey },
      LspReferenceWrite = { bg = thm.grey },

      DiagnosticError = { fg = thm.brightred },
      DiagnosticWarn = { fg = thm.brightyellow },
      DiagnosticHint = { fg = thm.brightmagenta },
      DiagnosticInfo = { fg = thm.brightblue },

      LspSignatureActiveParameter = { fg = thm.black, bg = thm.green },
      LspInlayHint = { fg = thm.grey },

      ---------------------------- Search and Refactor ----------------------------------

      Search = { fg = thm.brightred, bg = thm.grey, bold = true },
      CurSearch = { fg = thm.brightcyan, bg = thm.grey, bold = true },
      IncSearch = { fg = thm.brightyellow, bg = thm.grey, bold = true },

      -- Dashboard
      DashAscii = { fg = thm.brightmagenta },
      DashLine = { fg = thm.black },
      DashPlugins = { fg = thm.brightyellow },
      DashFiles = { fg = thm.red },
      DashRecent = { fg = thm.green },
      DashTrigger = { fg = thm.yellow },
      DashSettings = { fg = thm.blue },
      DashWord = { fg = thm.magenta },
      DashCmdHist = { fg = thm.cyan },
      DashBuffers = { fg = thm.white },
      DashNvimCmds = { fg = thm.brightblue },
      DashGitFiles = { fg = thm.brightred },
      DashGitLog = { fg = thm.brightgreen },
      DashGitStatus = { fg = thm.brightcyan },
      DashGitSwitch = { fg = thm.brightwhite },

      -- Nvim-Tree
      NvimTreeNormal = { fg = thm.black },
      NvimTreeCursorLine = { bg = thm.grey, bold = true },
      NvimTreeFileName = { fg = thm.black },
      NvimTreeExecFile = { fg = thm.brightgreen },
      NvimTreeSpecialFile = { fg = thm.brightyellow },
      NvimTreeFolderIcon = { fg = thm.blue },
      NvimTreeIndentMarker = { fg = thm.brightmagenta },
      NvimTreeSymlink = { fg = thm.yellow },
      NvimTreeSymlinkFolderName = { fg = thm.yellow },
      NvimTreeModifiedIcon = { fg = thm.red },
      NvimTreeGitNew = { fg = thm.red },
      NvimTreeGitDirty = { fg = thm.yellow },
      NvimTreeGitStaged = { fg = thm.green },
      NvimTreeGitRenamed = { link = 'NvimTreeGitStaged' },
      NvimTreeGitIgnored = { fg = thm.brightblack, italic = true },

      -- Fzf-lua
      FzfLuaTitle = { fg = thm.magenta },
      FzfLuaBorder = { fg = thm.brightblack },
      FzfLuaPreviewTitle = { fg = thm.brightmagenta },
      FzfLuaPreviewBorder = { fg = thm.brightblack },

      ---------------------------- Notifications ----------------------------------

      -- Noice
      NoiceCmdlinePopupBorder = { fg = thm.brightgreen, bg = thm.background },
      NoiceCmdlinePopupTitle = { fg = thm.brightgreen, bg = thm.background },
      -- NoicePop = { fg = thm.black },
      NoicePopupmenuSelected = { fg = thm.green, bg = thm.grey },
      NoiceCmdlineIcon = { fg = thm.blue, bg = thm.background },

      -- Notify
      NotifyERRORBorder = { fg = thm.brightred, bg = thm.background },
      NotifyERRORIcon = { fg = thm.brightred, bg = thm.background },
      NotifyERRORTitle = { fg = thm.brightred, bg = thm.background },

      NotifyWARNBorder = { fg = thm.brightyellow, bg = thm.background },
      NotifyWARNIcon = { fg = thm.brightyellow, bg = thm.background },
      NotifyWARNTitle = { fg = thm.brightyellow, bg = thm.background },

      NotifyINFOBorder = { fg = thm.brightblue, bg = thm.background },
      NotifyINFOIcon = { fg = thm.brightblue, bg = thm.background },
      NotifyINFOTitle = { fg = thm.brightblue, bg = thm.background },

      NotifyDEBUGBorder = { fg = thm.brightmagenta, bg = thm.background },
      NotifyDEBUGIcon = { fg = thm.brightmagenta, bg = thm.background },
      NotifyDEBUGTitle = { fg = thm.brightmagenta, bg = thm.background },

      NotifyTRACEBorder = { fg = thm.brightcyan, bg = thm.background },
      NotifyTRACEIcon = { fg = thm.brightcyan, bg = thm.background },
      NotifyTRACETitle = { fg = thm.brightcyan, bg = thm.background },

      ---------------------------- Meta Assistance ----------------------------------

      -- WhichKey
      WhichKey = { fg = thm.magenta },
      WhichKeyBorder = { fg = thm.brightblack },
      WhichKeySeparator = { fg = thm.black },
      WhichKeyDesc = { fg = thm.blue },
      WhichKeyGroup = { fg = thm.yellow },
      WhichKeyValue = { fg = thm.brightmagenta },

      -- Avante
      AvanteTitle = { fg = thm.brightgreen, bg = thm.background },
      AvanteReversedTitle = { fg = thm.background, bg = thm.background },
      AvanteSubtitle = { fg = thm.brightblue, bg = thm.background },
      AvanteReversedSubtitle = { fg = thm.background, bg = thm.brightblue },
      AvanteThirdTitle = { fg = thm.brightyellow, bg = thm.background },
      AvanteReversedThirdTitle = { fg = thm.background, bg = thm.brightyellow },
      AvanteConflictCurrent = { fg = thm.brightred, bg = thm.background },
      AvanteConflictIncoming = { fg = thm.brightcyan, bg = thm.background },
      AvanteConflictCurrentLabel = { fg = thm.brightred, bg = thm.brightblack },
      AvanteConflictIncomingLabel = { fg = thm.brightcyan, bg = thm.brightblack },
      AvantePopupHint = { fg = thm.brightyellow, bg = thm.background },
      AvanteInlineHint = { fg = thm.brightcyan, bg = thm.background },

      ---------------------------- Productivity ----------------------------------

      -- Git
      diffOldFile = { fg = thm.brightred },
      diffNewFile = { fg = thm.brightgreen },
      DiffAdd = { fg = thm.green },
      DiffAdded = { fg = thm.green },
      DiffChange = { fg = thm.yellow },
      DiffChangeDelete = { fg = thm.red },
      DiffModified = { fg = thm.yellow },
      DiffDelete = { fg = thm.red },
      DiffRemoved = { fg = thm.red },
      DiffText = { fg = thm.white, bg = thm.grey },

      gitcommitOverflow = { fg = thm.red },
      gitcommitSummary = { fg = thm.green },
      gitcommitComment = { fg = thm.grey },
      gitcommitUntracked = { fg = thm.grey },
      gitcommitDiscarded = { fg = thm.grey },
      gitcommitSelected = { fg = thm.grey },
      gitcommitHeader = { fg = thm.brightmagenta },
      gitcommitSelectedType = { fg = thm.blue },
      gitcommitUnmergedType = { fg = thm.blue },
      gitcommitDiscardedType = { fg = thm.blue },
      gitcommitBranch = { fg = thm.yellow, bold = true },
      gitcommitUntrackedFile = { fg = thm.yellow },
      gitcommitUnmergedFile = { fg = thm.red, bold = true },
      gitcommitDiscardedFile = { fg = thm.red, bold = true },
      gitcommitSelectedFile = { fg = thm.green, bold = true },

      -- Lazy
      LazyH1 = { fg = thm.brightcyan, bold = true },
      LazyBorder = { fg = thm.brightblack },
      LazyButton = { fg = thm.brightblack },
      LazyButtonActive = { fg = thm.white, bold = true },
      LazyH2 = { fg = thm.magenta, bold = true },
      LazyReasonPlugin = { fg = thm.red },
      LazyValue = { fg = thm.cyan },
      LazyDir = { fg = thm.blue },
      LazyUrl = { fg = thm.red },
      LazyCommit = { fg = thm.green },
      LazyNoCond = { fg = thm.red },
      LazyReasonFt = { fg = thm.brightmagenta },
      LazyOperator = { fg = thm.white },
      LazyReasonKeys = { fg = thm.cyan },
      LazyTaskOutput = { fg = thm.white },
      LazyCommitIssue = { fg = thm.magenta },
      LazyReasonEvent = { fg = thm.yellow },
      LazyReasonStart = { fg = thm.white },
      LazyReasonRuntime = { fg = thm.brightyellow },
      LazyReasonCmd = { fg = thm.yellow },
      LazyReasonSource = { fg = thm.cyan },
      LazyReasonImport = { fg = thm.white },
      LazyProgressDone = { fg = thm.green },
      LazySpecial = { fg = thm.green },

      -- Indent Blankline
      IblIndent = { fg = thm.brightblack },
      IblWhitespace = { fg = thm.grey },
      IblScope = { fg = thm.brightmagenta },

      -- Todo
      TodoBgFix = { fg = thm.grey, bg = thm.red, bold = true },
      TodoBgHack = { fg = thm.grey, bg = thm.brightyellow, bold = true },
      TodoBgNote = { fg = thm.grey, bg = thm.white, bold = true },
      TodoBgPerf = { fg = thm.grey, bg = thm.brightmagenta, bold = true },
      TodoBgTest = { fg = thm.grey, bg = thm.brightmagenta, bold = true },
      TodoBgTodo = { fg = thm.grey, bg = thm.yellow, bold = true },
      TodoBgWarn = { fg = thm.brightyellow, bold = true },
      TodoFgFix = { fg = thm.red },
      TodoFgHack = { fg = thm.brightyellow },
      TodoFgNote = { fg = thm.white },
      TodoFgPerf = { fg = thm.brightmagenta },
      TodoFgTest = { fg = thm.brightmagenta },
      TodoFgTodo = { fg = thm.yellow },
      TodoFgWarn = { fg = thm.brightyellow },
      TodoSignFix = { link = 'TodoFgFix' },
      TodoSignHack = { link = 'TodoFgHack' },
      TodoSignNote = { link = 'TodoFgNote' },
      TodoSignPerf = { link = 'TodoFgPerf' },
      TodoSignTest = { link = 'TodoFgTest' },
      TodoSignTodo = { link = 'TodoFgTodo' },
      TodoSignWarn = { link = 'TodoFgWarn' },

      ---------------------------- UI and Status ----------------------------------

      -- StatusLine
      StatusLine = { fg = thm.yellow, bg = thm.background },

      StText = { fg = thm.brightgreen, bg = thm.background },

      St_file = { fg = thm.black, bg = thm.background },
      St_filemod = { fg = thm.red, bold = true, underline = true },
      St_cursor = { fg = thm.black, bg = thm.background },
      St_cwd = { fg = thm.blue, bg = thm.background },
      St_ft = { fg = thm.brightblue, bg = thm.background },

      St_lspMsg = { fg = thm.brightyellow, bg = thm.background },
      St_lspError = { fg = thm.brightred, bg = thm.background },
      St_lspWarning = { fg = thm.brightyellow, bg = thm.background },
      St_lspHints = { fg = thm.brightmagenta, bg = thm.background },
      St_lspInfo = { fg = thm.brightblue, bg = thm.background },
      St_lsp = { fg = thm.cyan, bg = thm.background },

      St_GitAdded = { fg = thm.green, bg = thm.background },
      St_GitChanged = { fg = thm.yellow, bg = thm.background },
      St_GitRemoved = { fg = thm.red, bg = thm.background },
      St_GitAhead = { fg = thm.brightblue, bg = thm.background },
      St_GitBehind = { fg = thm.brightblue, bg = thm.background },
      St_GitUntracked = { fg = thm.red, bg = thm.background },
      St_GitBranch = { fg = thm.magenta, bg = thm.background },
      St_GitConflicted = { fg = thm.brightred, bg = thm.background },

      St_NormalMode = { fg = thm.brightblue, bg = thm.background },
      St_VisualMode = { fg = thm.brightcyan, bg = thm.background },
      St_InsertMode = { fg = thm.brightred, bg = thm.background },
      St_TerminalMode = { fg = thm.brightgreen, bg = thm.background },
      St_NTerminalMode = { fg = thm.yellow, bg = thm.background },
      St_ReplaceMode = { fg = thm.brightyellow, bg = thm.background },
      St_ConfirmMode = { fg = thm.cyan, bg = thm.background },
      St_CommandMode = { fg = thm.brightgreen, bg = thm.background },
      St_SelectMode = { fg = thm.blue, bg = thm.background },

      -- Render-markdown
      RenderMarkdownCode = { bg = thm.dark },
      RenderMarkdownCodeInline = { fg = thm.brightred },
      RenderMarkdownH1Bg = { fg = thm.cyan, bold = true },
      markdownh1 = { fg = thm.cyan, bold = true },
      markdownh2 = { fg = thm.magenta, bold = true },
      markdownh3 = { fg = thm.blue, bold = true },
      markdownh4 = { fg = thm.white, bold = true },
      markdownh5 = { fg = thm.black, bold = true },
      markdownh6 = { fg = thm.brightblack, bold = true },

      -- Code
      -- markdowncode = { fg = thm.brightred, bg = thm.dark },
      markdowncodeblock = { fg = thm.brightyellow },
      markdowncodedelimiter = { fg = thm.brightblack },

      -- Links
      markdownurl = { fg = thm.brightblack, underline = true },
      markdownlinktext = { fg = thm.yellow, underline = true },
      markdownlinkdelimiter = { fg = thm.blue },

      -- Emphasis and Formatting
      markdownitalic = { fg = thm.yellow, italic = true },
      markdownbold = { fg = thm.red, bold = true },
      markdownbolditalic = { fg = thm.cyan, bold = true, italic = true },
      markdownstrike = { fg = thm.brightblue, strikethrough = true },

      -- Blockquotes and Rules
      markdownblockquote = { fg = thm.brightblack, italic = true },
      markdownrule = { fg = thm.brightblack },

      -- Lists
      markdownlistmarker = { fg = thm.white },
      markdowntable = { fg = thm.blue },

      -- Tasks
      markdowntaskchecked = { fg = thm.brightgreen },
      markdowntaskunchecked = { fg = thm.brightblack },

      -- Highlight Groups for Code Syntax
      markdowncomment = { fg = thm.brightblack },
      markdowncommentpreproc = { fg = thm.brightcyan },
      markdownkeyword = { fg = thm.magenta },
      markdownkeywordtype = { fg = thm.blue },
      markdownoperator = { fg = thm.black },
      markdownpunctuation = { fg = thm.white },

      -- String and Literals
      markdownstring = { fg = thm.green },
      markdownstringescape = { fg = thm.brightcyan },

      -- Errors and Inserts
      markdownerror = { fg = thm.white, bg = thm.brightred },
      markdowninsert = { fg = thm.brightgreen },
      markdowndelete = { fg = thm.red },

      -- Special Elements
      markdowndefinitionterm = { fg = thm.brightmagenta },
      markdowndefinitiondescription = { fg = thm.white },
      markdownenumeration = { fg = thm.blue },

      -- Images
      markdownimage = { fg = thm.brightblack, underline = true },
      markdownimagetext = { fg = thm.yellow },

      -- Devicons
      DevIconc = { fg = thm.blue },
      DevIconcss = { fg = thm.blue },
      DevIcondeb = { fg = thm.cyan },
      DevIconDockerfile = { fg = thm.cyan },
      DevIconhtml = { fg = thm.brightred },
      DevIconjpeg = { fg = thm.magenta },
      DevIconjpg = { fg = thm.magenta },
      DevIconjs = { fg = thm.yellow },
      DevIconkt = { fg = thm.brightyellow },
      DevIconlock = { fg = thm.red },
      DevIconlua = { fg = thm.blue },
      DevIconmp3 = { fg = thm.white },
      DevIconmp4 = { fg = thm.white },
      DevIconout = { fg = thm.white },
      DevIconpng = { fg = thm.magenta },
      DevIconpy = { fg = thm.cyan },
      DevIcontoml = { fg = thm.blue },
      DevIconts = { fg = thm.brightcyan },
      DevIconttf = { fg = thm.white },
      DevIconrb = { fg = thm.magenta },
      DevIconrpm = { fg = thm.brightyellow },
      DevIconvue = { fg = thm.brightgreen },
      DevIconwoff = { fg = thm.white },
      DevIconwoff2 = { fg = thm.white },
      DevIconxz = { fg = thm.yellow },
      DevIconzip = { fg = thm.yellow },
      DevIconZig = { fg = thm.brightyellow },
      DevIconMd = { fg = thm.blue },
      DevIconTSX = { fg = thm.blue },
      DevIconJSX = { fg = thm.blue },
      DevIconSvelte = { fg = thm.red },
      DevIconJava = { fg = thm.brightyellow },
      DevIconDart = { fg = thm.cyan },
    } do
      vim.api.nvim_set_hl(0, group, options)
    end
  end,
}
