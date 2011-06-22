" Vim syntax file
" Language:     LambdaProlog (Teyjus)
" Filenames:    *.mod *.sig
" Maintainer:   Markus Mottl  <markus.mottl@gmail.com>
" URL:          http://www.ocaml.info/vim/syntax/datalog.vim
" Last Change:  2006 Feb 05
"               2001 Apr 26 - Upgraded for new Vim version
"               2000 Jun  5 - Initial release

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Lambda Prolog is case sensitive.
syn case match

syn match   datalogBrackErr    "\]"
syn match   datalogParenErr    ")"

syn cluster datalogContained contains=datalogTodo,datalogTypeNames,datalogTypeName

" Enclosing delimiters
syn region  datalogEncl transparent matchgroup=datalogVariable start="(" matchgroup=datalogVariable end=")" contains=ALLBUT,@datalogContained,datalogParenErr

" General identifiers
syn match   datalogIdentifier  "\<\(\w\|[-+*/\\^<>=`'~?@#$&!_]\)*\>"
syn match   datalogVariable    "\<\u\(\w\|[-+*/\\^<>=`'~?@#$&!]\)*\>"

syn match   datalogOperator  "/"

" Comments
syn region  datalogComment  start="#" end="$" contains=datalogTodo
syn keyword datalogTodo  contained TODO FIXME XXX

syn match   datalogInteger  "\<\d\+\>"
syn match   datalogReal     "\<\(\d\+\)\=\.\d+\>"
syn region  datalogString   start=+"+ skip=+\\\\\|\\"+ end=+"+

" Clause definitions
syn region  datalogClause start="^\w\+" end=")"

" Keywords
syn keyword datalogKeyword   input inputtuples output
syn match   datalogKeyword   "^\.\w*"

" Operators
syn match   datalogSpecial ":-"
syn match   datalogSpecial ","
syn match   datalogSpecial "\\"

syn match   datalogOperator "<"
syn match   datalogOperator ">"
syn match   datalogOperator "=<"
syn match   datalogOperator ">="
syn match   datalogOperator "="
syn match   datalogOperator "!="
syn match   datalogOperator "!"

syn sync minlines=50
syn sync maxlines=500

" Brown text, normal font strength.
hi datalogVariable guifg=brown

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_datalog_syntax_inits")
  if version < 508
    let did_datalog_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink datalogComment     Comment
  HiLink datalogTodo	    Todo

  HiLink datalogSpecial     Special
  HiLink datalogOperator    Special
  HiLink datalogIdentifier  Normal
  HiLink datalogKeyword     Special

  HiLink datalogInteger     Number
  HiLink datalogReal	    Number
  HiLink datalogString	    String

  HiLink datalogCommentErr  Error
  HiLink datalogBrackErr    Error
  HiLink datalogParenErr    Error

  HiLink datalogModuleName  Special
  HiLink datalogTypeName    Identifier

  HiLink datalogVariable    Keyword
  HiLink datalogAtom	    Normal
  HiLink datalogClause	    Type


  delcommand HiLink
endif

let b:current_syntax = "datalog"

" vim: ts=8
