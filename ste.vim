" Name:			ste-dark.vim
" Maintainer:	Sengthai Te
"
" Resource:		https://github.com/crusoexia/vim-monokai
"
" Initialization
" ==============

highlight clear
if exists("syntax_on")
	syntax reset
endif
set background=dark

if !has("gui_running") && &t_Co < 256
	finish
endif

let color_name = "ste"
let g:termcolors = 256

" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')),
  \       'synIDattr(v:val, "name")')
endfunc

"
function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction




" Palettes
" --------

let s:gray15			= { "gui": "#262626", "cterm": "235" }
let s:gray85      = { "gui": "#dadada", "cterm": "253" }
let s:gray70      = { "gui": "#b2b2b2", "cterm": "249" }
let s:white				= { "gui": "#ffffff", "cterm": "15" }
let s:deep_pink1  = { "gui": "#ff0087", "cterm": "198" }
let s:sky_blue3   = { "gui": "#5fafd7", "cterm": "74" }
let s:dark_orange3= { "gui": "#af5f00", "cterm": "130" }
let s:indian_red  = { "gui": "#d75f5f", "cterm": "167" }
let s:gold3       = { "gui": "#d7af00", "cterm": "178" }
let s:orange1     = { "gui": "#ffaf00", "cterm": "214" }
let s:orange_red1 = { "gui": "#ff5f00", "cterm": "202" }
let s:magenta3    = { "gui": "#af00af", "cterm": "127" }
let s:dark_olive_green3  = { "gui": "#87d75f", "cterm": "113" }
let s:dark_slate_gray3   = { "gui": "#87d7d7", "cterm": "116" }
let s:dark_khaki  = { "gui": "#afaf5f", "cterm": "143" }
let s:yellow3     = { "gui": "#afd700", "cterm": "148" }
let s:gray35      = { "gui": "#585858", "cterm": "240" }
let s:gray35      = { "gui": "#585858", "cterm": "240" }
let s:cyan3       = { "gui": "#00d7af", "cterm": "43" }

" Highlighting
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:gray15 })
call s:h("ColorColumn",   {                     "bg": s:gray85 })
call s:h("Cursor",        { "fg": s:gray15,      "bg": s:white })
call s:h("CursorColumn",  {                     "bg": s:deep_pink1 })
call s:h("CursorLine",    {                     "bg": s:deep_pink1 })
call s:h("NonText",       { "fg": s:white })
call s:h("StatusLine",    { "fg": s:deep_pink1,   "bg": s:sky_blue3,        "format": "reverse" })
call s:h("StatusLineNC",  { "fg": s:deep_pink1,   "bg": s:sky_blue3,     "format": "reverse" })
call s:h("TabLine",       { "fg": s:gray70,      "bg": s:gray15,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:sky_blue3 })
call s:h("Search",        { "fg": s:dark_orange3,      "bg": s:white })
call s:h("MatchParen",    { "fg": s:indian_red,                           "format": "underline,bold" })
call s:h("Question",      { "fg": s:gold3 })
call s:h("ModeMsg",       { "fg": s:gold3 })
call s:h("MoreMsg",       { "fg": s:gold3 })
call s:h("ErrorMsg",      { "fg": s:orange_red1,      "bg": s:white,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:orange1 })
call s:h("VertSplit",     { "fg": s:gray70,   "bg": s:gray70 })
call s:h("LineNr",        { "fg": s:gray15,       "bg": s:gray15 })
call s:h("CursorLineNr",  { "fg": s:deep_pink1,     "bg": s:gray15 })
call s:h("SignColumn",    {                     "bg": s:gray15 })

" spell
call s:h("SpellBad",      { "fg": s:indian_red,                              "format": "underline" })
call s:h("SpellCap",      { "fg": s:dark_olive_green3,                           "format": "underline" })
call s:h("SpellRare",     { "fg": s:dark_slate_gray3,                             "format": "underline" })
call s:h("SpellLocal",    { "fg": s:indian_red,                             "format": "underline" })

" misc
call s:h("SpecialKey",    { "fg": s:magenta3 })
call s:h("Title",         { "fg": s:indian_red })
call s:h("Directory",     { "fg": s:dark_slate_gray3 })

" diff
call s:h("DiffAdd",       { "fg": s:indian_red,      "bg": s:yellow3 })
call s:h("DiffDelete",    { "fg": s:white,      "bg": s:deep_pink1 })
call s:h("DiffChange",    { "fg": s:dark_khaki,   "bg": s:gold3 })
call s:h("DiffText",      { "fg": s:white,      "bg": s:gray15 })

" fold
call s:h("Folded",        { "fg": s:gray35,   "bg": s:gray15 })
call s:h("FoldColumn",    {                     "bg": s:gray15 })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:white,     "bg": s:indian_red })
call s:h("PmenuSel",      { "fg": s:white,       "bg": s:indian_red,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:white, "bg": s:indian_red })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:deep_pink1 })
call s:h("Number",        { "fg": s:deep_pink1 })
call s:h("Float",         { "fg": s:deep_pink1 })
call s:h("Boolean",       { "fg": s:deep_pink1 })
call s:h("Character",     { "fg": s:gold3 })
call s:h("String",        { "fg": s:gold3 })

call s:h("Type",          { "fg": s:magenta3 })
call s:h("Structure",     { "fg": s:magenta3 })
call s:h("StorageClass",  { "fg": s:magenta3 })
call s:h("Typedef",       { "fg": s:magenta3 })

call s:h("Identifier",    { "fg": s:orange_red1 })
call s:h("Function",      { "fg": s:orange_red1 })

call s:h("Statement",     { "fg": s:orange1 })
call s:h("Operator",      { "fg": s:orange1 })
call s:h("Label",         { "fg": s:orange1 })
call s:h("Keyword",       { "fg": s:orange1 })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:cyan3 })
call s:h("Include",       { "fg": s:cyan3 })
call s:h("Define",        { "fg": s:cyan3 })
call s:h("Macro",         { "fg": s:cyan3 })
call s:h("PreCondit",     { "fg": s:cyan3 })

call s:h("Special",       { "fg": s:deep_pink1 })
call s:h("SpecialChar",   { "fg": s:deep_pink1 })
call s:h("Delimiter",     { "fg": s:deep_pink1 })
call s:h("SpecialComment",{ "fg": s:sky_blue3 })
call s:h("Tag",           { "fg": s:deep_pink1 })
"        Debug"

call s:h("Todo",          { "fg": s:orange1,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:gray70, "format": "italic" })

call s:h("Underlined",    { "fg": s:white })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:orange_red1, "bg": s:white })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow3 })
call s:h("NERDTreeClosable",        { "fg": s:yellow3 })
call s:h("NERDTreeHelp",            { "fg": s:yellow3 })
call s:h("NERDTreeBookmarksHeader", { "fg": s:deep_pink1 })
call s:h("NERDTreeBookmarksLeader", { "fg": s:gray15 })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow3 })
call s:h("NERDTreeCWD",             { "fg": s:deep_pink1 })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:gray35 })
call s:h("NERDTreeDir",             { "fg": s:gray35 })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:gray70, "bg": s:orange1 })

" coc
" ---

hi! link CocErrorSign Error
call s:h("CocErrorHighlight",       { "fg": s:indian_red, "format": "underline" })
call s:h("CocErrorFloat",           { "fg": s:orange_red1, "bg": s:gray70 })

call s:h("CocWarningSign",          { "fg": s:yellow3, "bg": s:gray70 })
call s:h("CocWarningHighlight",     { "format": "underline" })
call s:h("CocWarningFloat",         { "fg": s:yellow3, "bg": s:gray70 })

call s:h("CocInfoSign",             { "fg": s:yellow3, "bg": s:gray70 })
call s:h("CocInfoHighlight",        { "format": "underline" })

call s:h("CocHintSign",             { "fg": s:white, "bg": s:gray70 })
call s:h("CocHintHighlight",        { "format": "underline" })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:deep_pink1 })

" Vim command
call s:h("vimCommand",              { "fg": s:deep_pink1 })

" Javascript
call s:h("jsClassKeyword",      { "fg": s:sky_blue3, "format": "italic" })
call s:h("jsGlobalObjects",     { "fg": s:sky_blue3, "format": "italic" })
call s:h("jsFuncName",          { "fg": s:dark_olive_green3 })
call s:h("jsThis",              { "fg": s:orange1, "format": "italic" })
call s:h("jsObjectKey",         { "fg": s:white })
call s:h("jsFunctionKey",       { "fg": s:dark_olive_green3 })
call s:h("jsPrototype",         { "fg": s:gold3 })
call s:h("jsExceptions",        { "fg": s:gold3 })
call s:h("jsFutureKeys",        { "fg": s:gold3 })
call s:h("jsBuiltins",          { "fg": s:gold3 })
call s:h("jsArgsObj",           { "fg": s:gold3 })
call s:h("jsStatic",            { "fg": s:gold3 })
call s:h("jsSuper",             { "fg": s:orange1, "format": "italic" })
call s:h("jsFuncArgRest",       { "fg": s:magenta3, "format": "italic" })
call s:h("jsFuncArgs",          { "fg": s:orange1, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:gold3, "format": "italic" })
call s:h("jsDocTags",           { "fg": s:gold3,   "format": "italic" })
call s:h("jsFunction",          { "fg": s:gold3,   "format": "italic" })

" Typescript
call s:h("typescriptBraces",              { "fg": s:white })
call s:h("typescriptParens",              { "fg": s:white })
call s:h("typescriptOperator",            { "fg": s:deep_pink1 })
call s:h("typescriptEndColons",           { "fg": s:white })
call s:h("typescriptModule",              { "fg": s:sky_blue3 })
call s:h("typescriptPredefinedType",      { "fg": s:sky_blue3 })
call s:h("typescriptImport",              { "fg": s:deep_pink1 })
call s:h("typescriptExport",              { "fg": s:deep_pink1 })
call s:h("typescriptIdentifier",          { "fg": s:orange1, "format": "italic" })
call s:h("typescriptVariable",            { "fg": s:sky_blue3 })
call s:h("typescriptCastKeyword",         { "fg": s:deep_pink1 })
call s:h("typescriptAmbientDeclaration",  { "fg": s:deep_pink1 })
call s:h("typescriptTestGlobal",          { "fg": s:deep_pink1 })
call s:h("typescriptFuncKeyword",         { "fg": s:indian_red })
call s:h("typescriptFuncTypeArrow",       { "fg": s:indian_red })
call s:h("typescriptFuncType",            { "fg": s:orange1, "format": "italic" })
call s:h("typescriptFuncName",            { "fg": s:dark_olive_green3 })
call s:h("typescriptArrowFuncArg",        { "fg": s:orange1, "format": "italic" })
call s:h("typescriptCall",                { "fg": s:orange1, "format": "italic" })
call s:h("typescriptClassKeyword",        { "fg": s:sky_blue3,   "format": "italic" })
call s:h("typescriptClassName",           { "fg": s:white })
call s:h("typescriptClassHeritage",       { "fg": s:white })
call s:h("typescriptInterfaceKeyword",    { "fg": s:sky_blue3,   "format": "italic" })
call s:h("typescriptInterfaceName",       { "fg": s:white })
call s:h("typescriptObjectLabel",         { "fg": s:dark_olive_green3 })
call s:h("typescriptMember",              { "fg": s:dark_olive_green3 })
call s:h("typescriptTypeReference",       { "fg": s:magenta3, "format": "italic" })
call s:h("typescriptTypeParameter",       { "fg": s:magenta3, "format": "italic" })
call s:h("typescriptOptionalMark",        { "fg": s:deep_pink1 })
call s:h("tsxAttrib",                     { "fg": s:dark_olive_green3 })
call s:h("tsxTagName",                    { "fg": s:deep_pink1 })

" Dart
call s:h("dartStorageClass",    { "fg": s:deep_pink1 })
call s:h("dartExceptions",      { "fg": s:deep_pink1 })
call s:h("dartConditional",     { "fg": s:deep_pink1 })
call s:h("dartRepeat",          { "fg": s:deep_pink1 })
call s:h("dartTypedef",         { "fg": s:deep_pink1 })
call s:h("dartKeyword",         { "fg": s:deep_pink1 })
call s:h("dartConstant",        { "fg": s:magenta3 })
call s:h("dartBoolean",         { "fg": s:magenta3 })
call s:h("dartCoreType",        { "fg": s:sky_blue3 })
call s:h("dartType",            { "fg": s:sky_blue3 })

" HTML
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:deep_pink1 })
call s:h("htmlArg",             { "fg": s:dark_olive_green3 })
call s:h("htmlSpecialChar",     { "fg": s:magenta3 })

" XML
call s:h("xmlTag",              { "fg": s:deep_pink1 })
call s:h("xmlEndTag",           { "fg": s:deep_pink1 })
call s:h("xmlTagName",          { "fg": s:orange1 })
call s:h("xmlAttrib",           { "fg": s:dark_olive_green3 })

" JSX
call s:h("jsxTag",              { "fg": s:white })
call s:h("jsxCloseTag",         { "fg": s:white })
call s:h("jsxCloseString",      { "fg": s:white })
call s:h("jsxPunct",            { "fg": s:white })
call s:h("jsxClosePunct",       { "fg": s:white })
call s:h("jsxTagName",          { "fg": s:deep_pink1 })
call s:h("jsxComponentName",    { "fg": s:deep_pink1 })
call s:h("jsxAttrib",           { "fg": s:dark_olive_green3 })
call s:h("jsxEqual",            { "fg": s:white })
call s:h("jsxBraces",           { "fg": s:white })

" CSS
call s:h("cssProp",             { "fg": s:yellow3 })
call s:h("cssUIAttr",           { "fg": s:yellow3 })
call s:h("cssFunctionName",     { "fg": s:sky_blue3 })
call s:h("cssColor",            { "fg": s:magenta3 })
call s:h("cssPseudoClassId",    { "fg": s:magenta3 })
call s:h("cssClassName",        { "fg": s:dark_olive_green3 })
call s:h("cssValueLength",      { "fg": s:magenta3 })
call s:h("cssCommonAttr",       { "fg": s:deep_pink1 })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:deep_pink1 })
call s:h("cssURL",              { "fg": s:orange1, "format": "underline,italic" })

" LESS
call s:h("lessVariable",        { "fg": s:dark_olive_green3 })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:dark_olive_green3 })
call s:h("rubyStringDelimiter",         { "fg": s:yellow3 })
call s:h("rubyRegexp",                  { "fg": s:yellow3 })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow3 })
call s:h("rubySymbol",                  { "fg": s:magenta3 })
call s:h("rubyEscape",                  { "fg": s:magenta3 })
call s:h("rubyInclude",                 { "fg": s:deep_pink1 })
call s:h("rubyOperator",                { "fg": s:deep_pink1 })
call s:h("rubyControl",                 { "fg": s:deep_pink1 })
call s:h("rubyClass",                   { "fg": s:deep_pink1 })
call s:h("rubyDefine",                  { "fg": s:deep_pink1 })
call s:h("rubyException",               { "fg": s:deep_pink1 })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange1 })
call s:h("rubyRailsARMethod",           { "fg": s:orange1 })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange1 })
call s:h("rubyRailsMethod",             { "fg": s:orange1 })
call s:h("rubyConstant",                { "fg": s:sky_blue3 })
call s:h("rubyBlockArgument",           { "fg": s:orange1 })
call s:h("rubyBlockParameter",          { "fg": s:orange1 })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:sky_blue3 })

" c
call s:h("cLabel",                      { "fg": s:deep_pink1 })
call s:h("cStructure",                  { "fg": s:sky_blue3 })
call s:h("cStorageClass",               { "fg": s:deep_pink1 })
call s:h("cInclude",                    { "fg": s:deep_pink1 })
call s:h("cDefine",                     { "fg": s:deep_pink1 })
call s:h("cSpecial",                    { "fg": s:magenta3 })
