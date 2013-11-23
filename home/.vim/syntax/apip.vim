" Vim syntax file
" Language:     APIP format for Applied Pi calculus-style embedding in tamarin
" Maintainer:
" Last Change:  2010 12 17
" based on Claudio Fleiner's <claudio@fleiner.com> apip syntax highlighting
" file.

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='apip'
  syn region apipFold start="{" end="}" transparent fold
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ SpthyHiLink hi link <args>
else
  command! -nargs=+ SpthyHiLink hi def link <args>
endif

" some characters that cannot be in a apip program (outside a string)
" syn match apipError "[\\@`]"
" syn match apipError "<<<\|\.\.\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"
" syn match apipOK "\.\.\."

syn match apipLAtom	        ":>"
syn match apipLAtom	        "--|"
syn match apipLAtom	        "<:"
syn match apipLAtom	        ">+>"
syn match apipLAtom	        ">->"
syn match apipLAtom	        "="
syn match apipLAtom	        "@"
syn match apipLAtom	        "<"


syn keyword apipConstr         aenc sdec senc sdec sign verify hashing signing
syn match apipConstr           "\<h("he=e-1
syn match apipConstr           "\<sk("he=e-1
syn match apipConstr           "\<pk("he=e-1
syn match apipConstr           "\<fr("he=e-1
syn match apipConstr           "\<pb("he=e-1
syn match apipConstr           "\<lts("he=e-1
syn match apipConstr           "*"
syn match apipConstr           "\^"
syn match apipConstr           "\<diffie-hellman"
syn match apipConstr           "\<symmetric-encryption"
syn match apipConstr           "\<asymmetric-encryption"

syn keyword apipDecl           axiom lemma equations functions builtins protocol property in let theory begin end subsection section text
syn match apipDecl             "\<exists-trace"
syn match apipDecl             "\<all-traces"
syn match apipDecl             "\<enable"
syn match apipDecl             "\<rule"
syn match apipDecl             "\<assertions"
syn match apipDecl             "\<modulo"
syn match apipDecl             "\<default_rules"
syn match apipDecl             "\<anb-proto"
syn match apipDecl             ":"
syn match apipDecl             "{\*"
syn match apipDecl             "\*}"
syn match apipDecl             "\""
syn match apipDecl             "\d\+\."

syn match apipTransfer         "->"
syn match apipTransfer         "<-"
syn match apipDecl             "-->"
syn match apipDecl             "--\["
syn match apipDecl             "\]->"

syn keyword apipTransfer       new in out lookup as in else if lock unlock event insert delete
syn match apipTransfer         "||"
syn match apipTransfer         "!"

syn region apipLiteral          start="'" end="'"

syn match apipLogicOp          "==>"
syn match apipLogicOp          "<=>"
syn keyword apipLogicOp        F T All Ex
syn match apipLogicOp          "|"
syn match apipLogicOp          "&"
syn match apipLogicOp          "\."




" The following cluster contains all apip groups except the contained ones
syn cluster apipTop add=apipLAtom,apipDecl


" Comments
syn keyword apipTodo		 contained TODO FIXME XXX
syn region  apipComment		 start="/\*"  end="\*/" contains=apipTodo
syn match   apipLineComment      "//.*" contains=apipTodo

syn cluster apipTop add=apipComment,apipLineComment

" Strings and constants
" syn match   apipSpecialError     contained "\\."
" syn match   apipSpecialCharError contained "[^']"
" syn match   apipSpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\+\x\{4\}\)"
" syn region  apipString		start=+"+ end=+"+ end=+$+ contains=apipSpecialChar,apipSpecialError,@Spell
" " next line disabled, it can cause a crash for a long line
" "syn match   apipStringError	  +"\([^"\\]\|\\.\)*$+
" syn match   apipCharacter	 "'[^']*'" contains=apipSpecialChar,apipSpecialCharError
" syn match   apipCharacter	 "'\\''" contains=apipSpecialChar
" syn match   apipCharacter	 "'[^\\]'"
" syn match   apipNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
" syn match   apipNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
" syn match   apipNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
" syn match   apipNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
"
" " unicode characters
" syn match   apipSpecial "\\u\+\d\{4\}"
"
" syn cluster apipTop add=apipString,apipCharacter,apipNumber,apipSpecial,apipStringError

" catch errors caused by wrong parenthesis
" syn region  apipParenT  transparent matchgroup=apipParen  start="("  end=")" contains=@apipTop,apipParenT1
" syn region  apipParenT1 transparent matchgroup=apipParen1 start="(" end=")" contains=@apipTop,apipParenT2 contained
" syn region  apipParenT2 transparent matchgroup=apipParen2 start="(" end=")" contains=@apipTop,apipParenT  contained
" syn match   apipParenError       ")"
" " catch errors caused by wrong square parenthesis
" syn region  apipParenT  transparent matchgroup=apipParen  start="\["  end="\]" contains=@apipTop,apipParenT1
" syn region  apipParenT1 transparent matchgroup=apipParen1 start="\[" end="\]" contains=@apipTop,apipParenT2 contained
" syn region  apipParenT2 transparent matchgroup=apipParen2 start="\[" end="\]" contains=@apipTop,apipParenT  contained
" syn match   apipParenError       "\]"
"
" SpthyHiLink apipParenError       apipError

if !exists("apip_minlines")
  let apip_minlines = 10
endif
exec "syn sync ccomment apipComment minlines=" . apip_minlines

" The default highlighting.
if version >= 508 || !exists("did_apip_syn_inits")
  if version < 508
    let did_apip_syn_inits = 1
  endif
  SpthyHiLink apipLAtom		Operator
  SpthyHiLink apipProc		Operator
  SpthyHiLink apipComment		Comment
  SpthyHiLink apipDocComment		Comment
  SpthyHiLink apipLineComment		Comment
  SpthyHiLink apipError		Error
  SpthyHiLink apipDecl		        Typedef
  SpthyHiLink apipTransfer             Typedef
  SpthyHiLink apipConstr               Function
  SpthyHiLink apipLiteral              String
  SpthyHiLink apipTODO                 Todo
  SpthyHiLink apipLogicOp              Boolean
"  SpthyHiLink apipVarArg               Function
"  SpthyHiLink apipBraces		Function
"  SpthyHiLink apipBranch		Conditional
"  SpthyHiLink apipUserLabelRef		apipUserLabel
"  SpthyHiLink apipLabel		Label
"  SpthyHiLink apipUserLabel		Label
"  SpthyHiLink apipConditional		Conditional
"  SpthyHiLink apipRepeat		Repeat
"  SpthyHiLink apipExceptions		Exception
"  SpthyHiLink apipAssert		Statement
"  SpthyHiLink apipStorageClass		StorageClass
"  SpthyHiLink apipMethodDecl		apipStorageClass
"  SpthyHiLink apipClassDecl		apipStorageClass
"  SpthyHiLink apipScopeDecl		apipStorageClass
"  SpthyHiLink apipBoolean		Boolean
"  SpthyHiLink apipSpecial		Special
"  SpthyHiLink apipSpecialError		Error
"  SpthyHiLink apipSpecialCharError	Error
"  SpthyHiLink apipString		String
"  SpthyHiLink apipCharacter		Character
"  SpthyHiLink apipSpecialChar		SpecialChar
"  SpthyHiLink apipNumber		Number
"  SpthyHiLink apipStringError		Error
"  SpthyHiLink apipStatement		Statement
"  SpthyHiLink apipOperator		Operator
"  SpthyHiLink apipComment		Comment
"  SpthyHiLink apipDocComment		Comment
"  SpthyHiLink apipLineComment		Comment
"  SpthyHiLink apipConstant		Constant
"  SpthyHiLink apipTypedef		Typedef
"  SpthyHiLink apipTodo			Todo
"  SpthyHiLink apipAnnotation             PreProc
"
"  SpthyHiLink apipCommentTitle		SpecialComment
"  SpthyHiLink apipDocTags		Special
"  SpthyHiLink apipDocParam		Function
"  SpthyHiLink apipDocSeeTagParam		Function
"  SpthyHiLink apipCommentStar		apipComment
"
"  SpthyHiLink apipType			Type
"  SpthyHiLink apipExternal		Include
"
"  SpthyHiLink htmlComment		Special
"  SpthyHiLink htmlCommentPart		Special
"  SpthyHiLink apipSpaceError		Error
endif

delcommand SpthyHiLink

let b:current_syntax = "apip"

if main_syntax == 'apip'
  unlet main_syntax
endif

let b:spell_options="contained"

" vim: ts=8
