highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mana"

lua require('mana').load()
