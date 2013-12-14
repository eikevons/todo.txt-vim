" File:        todo.txt-vim/ftdetect/todo.vim
" Description: Todo.txt filetype detection
" Author:      Leandro Freitas <freitass@gmail.com>
"              Eike von Seggern <eikevons@yahoo.de>
" Licence:     Vim licence
" Website:     http://github.com/eikevons/todo.txt-vim

autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=todo
