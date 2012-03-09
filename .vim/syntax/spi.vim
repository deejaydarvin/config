" Vim syntax file
" Language:     ProVerif-like Spi, Expi, Exdef
" Filenames:    *.pvi *.spi *.expi *.exdef
" Maintainers:  Alex Busenius  <s9albuse@uni-saarland.de>
" URL:          http://www.infsec.cs.uni-sb.de/projects/expi2java
" Last Change:  2008-08-22 21:23 - Imported OCaml syntax file
"               2008-08-24 01:17 - Usung spi keywords
"               2008-08-25 19:06 - Removed some unneeded stuff
"               2008-09-15 02:52 - Updated to new syntax, better annotations highlighting
"               2008-09-20 19:04 - Commented some unneeded OCaml matches, proper include and process keywords highlighting
"               2009-03-17 00:05 - Highlighting partial annotation
"               2009-03-23 02:06 - Removed unused statements, better highlighting of different let constructs
"               2009-03-23 13:20 - Highlighting unmatched closing > as an error

" This syntax file is based on the official OCaml syntax file from Vim 7.2


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax") && b:current_syntax == "spi"
  finish
endif

" Spi is case sensitive.
syn case match

" lowercase identifier - the standard way to match
syn match    ocamlLCIdentifier  /\<\(\l\|_\)\(\w\|'\)*\>/

" Errors
syn match    ocamlBraceErr   "}"
syn match    ocamlBrackErr   "\]"
syn match    ocamlArrErr     ">"
syn match    ocamlParenErr   ")"

syn match    ocamlCommentErr "\*)"

syn match    ocamlThenErr    "\<then\>"

" Some convenient clusters
syn cluster  ocamlAllErrs contains=ocamlBraceErr,ocamlBrackErr,ocamlArrErr,ocamlParenErr,ocamlCommentErr,ocamlThenErr

syn cluster  ocamlAENoParen contains=ocamlBraceErr,ocamlBrackErr,ocamlArrErr,ocamlCommentErr,ocamlThenErr

syn cluster  ocamlContained contains=ocamlTodo,ocamlModParam1,ocamlMPRestr2,ocamlMPRestr3,ocamlModTypeRestr,ocamlWith,ocamlFullMod


" Enclosing delimiters
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="(" matchgroup=ocamlKeyword end=")" contains=ALLBUT,@ocamlContained,ocamlParenErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="{" matchgroup=ocamlKeyword end="}" contains=ALLBUT,@ocamlContained,ocamlBraceErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="\[" matchgroup=ocamlKeyword end="\]" contains=ALLBUT,@ocamlContained,ocamlBrackErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="<" matchgroup=ocamlKeyword end=">" contains=ALLBUT,@ocamlContained,ocamlArrErr


"" Comments
syn region   ocamlComment       start="(\*" end="\*)" contains=ocamlComment,ocamlTodo
"syn region   ocamlComment       start="(\*\([^:]\|$\)" end="\*)" contains=ocamlComment,ocamlTodo
"syn region   ocamlComment2      start="(\*" end="\*)" contains=ocamlComment2,ocamlTodo contained
syn keyword  ocamlTodo          contained TODO FIXME XXX NOTE

"" Keyword and Type Annotations
syn region   ocamlTypeAnno      start="(\*:" end="\*)" contains=ocamlType,ocamlTypeVar
syn region   ocamlKeywordAnno   start="(\*#" end="\*)" contains=ocamlInclude,ocamlProcKeywords,ocamlString


" "if"
syn region   ocamlNone matchgroup=ocamlKeyword start="\<if\>" matchgroup=ocamlKeyword end="\<then\>" contains=ALLBUT,@ocamlContained,ocamlThenErr


"" Modules {{{

" Module prefix
"syn match    ocamlModPath      "\u\(\w\|'\)*\."he=e-1

" "module" - somewhat complicated stuff ;-)
"syn region   ocamlModule matchgroup=ocamlKeyword start="\<module\>" matchgroup=ocamlModule end="\<\u\(\w\|'\)*\>" contains=@ocamlAllErrs,ocamlComment skipwhite skipempty nextgroup=ocamlPreDef
"syn region   ocamlPreDef start="."me=e-1 matchgroup=ocamlKeyword end="\l\|="me=e-1 contained contains=@ocamlAllErrs,ocamlComment,ocamlModParam,ocamlModTypeRestr,ocamlModTRWith nextgroup=ocamlModPreRHS
"syn region   ocamlModParam start="([^*]" end=")" contained contains=@ocamlAENoParen,ocamlModParam1
"syn match    ocamlModParam1 "\<\u\(\w\|'\)*\>" contained skipwhite skipempty nextgroup=ocamlPreMPRestr

"syn region   ocamlPreMPRestr start="."me=e-1 end=")"me=e-1 contained contains=@ocamlAllErrs,ocamlComment,ocamlMPRestr,ocamlModTypeRestr

"syn region   ocamlMPRestr start=":" end="."me=e-1 contained contains=@ocamlComment skipwhite skipempty nextgroup=ocamlMPRestr1,ocamlMPRestr2,ocamlMPRestr3
"syn region   ocamlMPRestr1 matchgroup=ocamlModule start="\ssig\s\=" matchgroup=ocamlModule end="\<end\>" contained contains=ALLBUT,@ocamlContained,ocamlModule
"syn region   ocamlMPRestr2 start="\sfunctor\(\s\|(\)\="me=e-1 matchgroup=ocamlKeyword end="->" contained contains=@ocamlAllErrs,ocamlComment,ocamlModParam skipwhite skipempty nextgroup=ocamlFuncWith,ocamlMPRestr2
"syn match    ocamlMPRestr3 "\w\(\w\|'\)*\(\.\w\(\w\|'\)*\)*" contained
"syn match    ocamlModPreRHS "=" contained skipwhite skipempty nextgroup=ocamlModParam,ocamlFullMod
"syn region   ocamlModRHS start="." end=".\w\|([^*]"me=e-2 contained contains=ocamlComment skipwhite skipempty nextgroup=ocamlModParam,ocamlFullMod
"syn match    ocamlFullMod "\<\u\(\w\|'\)*\(\.\u\(\w\|'\)*\)*" contained skipwhite skipempty nextgroup=ocamlFuncWith

"syn region   ocamlFuncWith start="([^*]"me=e-1 end=")" contained contains=ocamlComment,ocamlWith,ocamlFuncStruct skipwhite skipempty nextgroup=ocamlFuncWith
"syn region   ocamlFuncStruct matchgroup=ocamlModule start="[^a-zA-Z]struct\>"hs=s+1 matchgroup=ocamlModule end="\<end\>" contains=ALLBUT,@ocamlContained

"syn match    ocamlModTypeRestr "\<\w\(\w\|'\)*\(\.\w\(\w\|'\)*\)*\>" contained
"syn region   ocamlModTRWith start=":\s*("hs=s+1 end=")" contained contains=@ocamlAENoParen,ocamlWith
"syn match    ocamlWith "\<\(\u\(\w\|'\)*\.\)*\w\(\w\|'\)*\>" contained skipwhite skipempty nextgroup=ocamlWithRest
"syn region   ocamlWithRest start="[^)]" end=")"me=e-1 contained contains=ALLBUT,@ocamlContained

" "module type"
" syn region   ocamlKeyword start="\<module\>\s*\<type\>" matchgroup=ocamlModule end="\<\w\(\w\|'\)*\>" contains=ocamlComment skipwhite skipempty nextgroup=ocamlMTDef
" syn match    ocamlMTDef "=\s*\w\(\w\|'\)*\>"hs=s+1,me=s
" }}}

"" Keywords

syn keyword  ocamlKeyword       in out new else suchthat if then weaksecret
" let is not keyword so we can override the "^let" case (named processes)
syn match    ocamlKeyword       "let"
syn match    ocamlKeyword       "|"
syn match    ocamlKeyword       "!"
syn keyword  ocamlKeyword       among and attacker choice elimtrue ev evinj
syn keyword  ocamlKeyword       mess noninterf not nounif phase putbegin

syn match    ocamlCharacter    "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn match    ocamlCharErr      "'\\\d\d'\|'\\\d'"
syn match    ocamlCharErr      "'\\[^\'ntbr]'"
syn region   ocamlString       start=+"+ skip=+\\\\\|\\"+ end=+"+

syn match    ocamlKeyChar      ":"
syn match    ocamlKeyChar      "->"
syn match    ocamlKeyChar      ";"
syn match    ocamlKeyChar      "\."
syn match    ocamlKeyChar      "="

syn match    ocamlNumber        "\<\d\d*\>"

" Labels
"syn match    ocamlLabel        "\~\(\l\|_\)\(\w\|'\)*"lc=1
"syn match    ocamlLabel        "?\(\l\|_\)\(\w\|'\)*"lc=1
"syn region   ocamlLabel transparent matchgroup=ocamlLabel start="?(\(\l\|_\)\(\w\|'\)*"lc=2 end=")"me=e-1 contains=ALLBUT,@ocamlContained,ocamlParenErr

" types
syn keyword  ocamlType          Top Int Bool ExpiString Channel ExpiList Data
syn keyword  ocamlType          Pair SymEnc SymKey PubEnc PubKey PrivKey KeyPair Signed SigKey VerKey Hash
" typedefed type
syn match    ocamlType          "$[A-Z][a-zA-Z0-9_]\+\>"
" type configuration
syn match    ocamlTypeVar       "@[A-Z][a-zA-Z0-9_]\+\>"

syn match    ocamlTypeVar       "\(\<[A-Z]\>\(-\|+\)\?\)\|\(\<[A-Z]0\>\)"

syn keyword  ocamlOperator      generative

" configurations
syn keyword  ocamlOperator      abstract extends
syn keyword  ocamlKeyword       class bundle
syn keyword  ocamlScript        type
" FIXME only highlight inside a configuration definition
syn match    ocamlLabel         "\<[a-zA-Z][a-zA-Z0-9_]*_\>"

" keywords
syn match    ocamlScript        "^\(\<data\>\|\<type\>\|\<let\>\|\<process\>\|\<config\>\|\<typedef\>\)"
syn keyword  ocamlScript        fun reduc free
syn keyword  ocamlInclude       include
syn keyword  ocamlProcKeywords  public inline skip
" ProVerif keywords
syn match    ocamlScript        "^\(\<equation\>\|\<clauses\>\|\<param\>\|\<pred\>\|\<query\>\)"
syn keyword  ocamlScript        event
" private fun, private reduc etc.
syn match    ocamlOperator      "^private\>"
" CryptoVerif keywords
syn match    ocamlScript        "^\(\<equiv\>\|\<forall\>\|\<const\>\|\<proba\>\|\<channel\>\)"

" Synchronization
syn sync minlines=50
syn sync maxlines=500

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_spi_syntax_inits")
  if version < 508
    let did_spi_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ocamlBraceErr     Error
  HiLink ocamlBrackErr     Error
  HiLink ocamlParenErr     Error
  HiLink ocamlArrErr       Error

  HiLink ocamlCommentErr   Error
  HiLink ocamlThenErr      Error
  HiLink ocamlCharErr      Error

  HiLink ocamlComment      Comment
  HiLink ocamlComment2     Comment
  HiLink ocamlTypeAnno     Comment
  HiLink ocamlKeywordAnno  Comment

  " modules
  HiLink ocamlFullMod      Include
  HiLink ocamlMPRestr2     Keyword
  HiLink ocamlMPRestr3     Include
"  HiLink ocamlMTDef        Include
  HiLink ocamlModParam1    Include
"  HiLink ocamlModPath      Include
"  HiLink ocamlModPreRHS    Keyword
  HiLink ocamlModTypeRestr Include
"  HiLink ocamlModule       Include
  HiLink ocamlWith         Include

  HiLink ocamlScript       Include
  HiLink ocamlInclude      Include
  HiLink ocamlProcKeywords Keyword

  HiLink ocamlKeyword      Keyword
  HiLink ocamlKeyChar      Keyword
  HiLink ocamlOperator     Keyword

  HiLink ocamlCharacter    Character
  HiLink ocamlNumber       Number
  HiLink ocamlString       String

  HiLink ocamlLabel        Identifier

  HiLink ocamlType         Type
  HiLink ocamlTypeVar      Constant

  HiLink ocamlTodo         Todo

  HiLink ocamlEncl         Keyword

  delcommand HiLink
endif

let b:current_syntax = "spi"

" vim: ts=8
