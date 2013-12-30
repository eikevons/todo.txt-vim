" File:        todo.txt-vim/syntax/todo.vim
" Description: Todo.txt syntax settings
" Author:      Leandro Freitas <freitass@gmail.com>
"              Eike von Seggern <eikevons@yahoo.de>
" Licence:     Vim licence
" Website:     http://github.com/eikevons/todo.txt-vim

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoDone       '^\s*[xX]\s.\+$'              contains=NONE
syntax  match  TodoPriorityA  '^\s*([aA])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityB  '^\s*([bB])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityC  '^\s*([cC])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityD  '^\s*([dD])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityE  '^\s*([eE])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityF  '^\s*([fF])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityG  '^\s*([gG])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityH  '^\s*([hH])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityI  '^\s*([iI])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityJ  '^\s*([jJ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityK  '^\s*([kK])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityL  '^\s*([lL])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityM  '^\s*([mM])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityN  '^\s*([nN])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityO  '^\s*([oO])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityP  '^\s*([pP])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityQ  '^\s*([qQ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityR  '^\s*([rR])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityS  '^\s*([sS])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityT  '^\s*([tT])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityU  '^\s*([uU])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityV  '^\s*([vV])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityW  '^\s*([wW])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityX  '^\s*([xX])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityY  '^\s*([yY])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoPriorityZ  '^\s*([zZ])\s.\+$'            contains=TodoDate,TodoProject,TodoContext,TodoDue,TodoRec
syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}' contains=NONE
syntax  match  TodoProject    '+[^+@[:blank:]]\+'          contains=NONE
syntax  match  TodoContext    '@[^+@[:blank:]]\+'          contains=NONE
syntax  match  TodoDue        'due:'                     contains=NONE
syntax  match  TodoRec        'rec:\d\{1,\}[dwmy]'       contains=NONE

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoPriorityA  Constant
highlight  default  link  TodoPriorityB  Statement
highlight  default  link  TodoPriorityC  Identifier
highlight  default  link  TodoDate       PreProc
highlight  default  link  TodoProject    Special
highlight  default  link  TodoContext    Special
highlight  default  link  TodoRec    Type
highlight  default  link  TodoDue    Type

" setlocal fdm=syntax
" syntax region todotxtDoneFold
  " \ start="^\z(\s*[xX]\s\)"
  " \ end="^\z1\@!"
  " \ fold transparent contains=ALLBUT,todotxtDoneFold

" syntax region todoGroupToplevel
  " \ start="^[+@][^+@[:blank:]]\+$"
  " \ end="\ze\n\S"
  " \ fold transparent

" syntax region todoGroupNested
  " \ start="^\z(\s\+\)\%([+@][^+@[:blank:]]\+\)$"
  " \ skip="^\s*$"
  " \ end="\ze\n\%(\z1.\+\)\@!"
  " \ fold transparent

let b:current_syntax = "todo"
