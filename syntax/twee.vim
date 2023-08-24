" Vim syntax file
" Language: Twee + Sugarcube 2
" Maintainer: mcombeau
" Latest Revision: 24 August 2023
" Based on: https://github.com/PolyCement/vim-tweego/
" Based on: https://gist.github.com/thricedotted/6590696

" Include HTML syntax highlighting
runtime! syntax/html.vim
unlet b:current_syntax
syn spell default " HTML enables spell-checking globally, turn it off

if exists("b:current_syntax")
    finish
endif

" ---- Define Syntax Elements

" Twee Keywords
syn	keyword	tweeConditional	if not else elseif contained
syn	keyword	tweeRepeat		for break continue contained
syn	keyword	tweeLabel		switch case default contained
syn	keyword	tweeOperator	to is isnot eq neq gt gte lt lte not and or def ndef contained
syn	keyword	tweeKeyword		capture set unset run script include nobr print silently type button checkbox cycle link linkappend linkprepend linkreplace listbox numberbox radiobutton textarea textbox actions back choice return addclass append copy prepend remove removeclass replace toggleclass audio cacheaudio createplaylist masteraudio playlist removeaudiogroup removeplaylist waitforaudio done goto repeat stop timed widget contained
syn keyword tweeBool		true false contained

" Twee Comments and Escape Character
syn region	tweeComment	start="<!--" end="-->"
syn keyword	tweeToDo	TODO XXX FIXME
syn match	tweeEOL		'\\$'

" Twee Passages and Variables
syn match tweePassage	"^::.*$" contains=tweePassageTitle,tweeTag
syn match tweeVariable	"[$_]\w*.\S*" contained
syn match tweeSubVariable	"[.]\w*" contained containedin=tweeVariable
syn match tweeString	"\(["']\).*\1" contained containedin=tweeLink
syn match tweeNumber	"\d\+" contained

" Twee Macros and Links
syn region tweeMacro	start="<<" end=">>" contains=tweeConditional,tweeRepeat,tweeLabel,tweeOperator,tweeKeyword,tweeVariable,tweeString,tweeBool,tweeNumber
syn region tweeLink		start="\[\[" end="\]\]" contains=tweeLinkedPassage,tweeVariable keepend


" Matching Passage Names in Titles and Links
" ::x
syn match tweePassageTitle	"::\zs[^|<>:\[\]]*" contained
" [[x]]
syn match tweeLinkedPassage	"\[\[\zs[^|<>]*\ze\]\]" contained
"[[y|x]]
syn match tweeLinkedPassage	"\v\|\zs([^]]*)" contained containedin=tweeLink
" [[y->x]]
syn match tweeLinkedPassage	"\v\-\>\zs([^]]*)" contained containedin=tweeLink
" [[x<-y]]
syn match tweeLinkedPassage	"\v\<-\zs([^]]*)" contained containedin=tweeLink

" " " Passage Tags
syn match tweeTag	"\[\zs.*\ze\]" contained


" Twee Markdown
syn region	tweeItalic		start="//" end="//"
syn region	tweeBold		start="''" end="''"
syn region	tweeUnderline	start="__" end="__"
syn match	tweeList		'^[*#]'

" ---- Set Syntax Elements

hi def link	tweeConditional		Conditional
hi def link	tweeRepeat			Repeat
hi def link	tweeLabel			Label
hi def link	tweeOperator		Operator
hi def link	tweeKeyword			Keyword
hi def link tweeVariable		Identifier
hi def link tweeSubVariable		Structure
hi def link tweeString			String
hi def link tweeBool			Boolean
hi def link tweeNumber			Number
hi def link tweeLinkedPassage	StorageClass
hi def link tweePassageTitle	StorageClass
hi def link tweeComment			Comment
hi def link tweeEOL				Comment
hi def link tweeToDo			Todo
hi def link tweeTag				Function

hi def tweeItalic		term=italic cterm=italic gui=italic
hi def tweeUnderline	term=underline cterm=underline gui=underline
hi def tweeBold			term=bold cterm=bold gui=bold
hi def tweeList			term=bold cterm=bold gui=bold

let b:current_syntax = "twee"
