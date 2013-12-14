" File:        todo.txt.vim
" Description: Todo.txt filetype detection
" Author:      Leandro Freitas <freitass@gmail.com>
" Licence:     Vim licence
" Website:     http://github.com/freitass/todo.txt.vim
" Version:     0.4

" Save context {{{1
let s:save_cpo = &cpo
set cpo&vim

" General options {{{1
" Some options lose their values when window changes. They will be set every
" time this script is invocated, which is whenever a file of this type is
" created or edited.
setlocal textwidth=0
setlocal wrapmargin=0
setlocal shiftwidth=2
setlocal softtabstop=2 " negative -> use value of shiftwidth
setlocal autoindent

" Mappings {{{1
" Sort tasks {{{2


" Insert date {{{2
if !hasmapto("<leader>d",'n')
    nnoremap <script> <silent> <buffer> <leader>d "=strftime("%Y-%m-%d")<CR>P
endif

if !hasmapto("date<Tab>",'i')
    inoremap <script> <silent> <buffer> date<Tab> <C-R>=strftime("%Y-%m-%d")<CR>
endif

if !hasmapto("<leader>d",'v')
    vnoremap <script> <silent> <buffer> <leader>d c<C-R>=strftime("%Y-%m-%d")<CR><Esc>
endif

if !hasmapto("<leader>t",'n')
    nnoremap <script> <silent> <buffer> <leader>t A due: <ESC>"=strftime("%Y-%m-%d")<CR>P
endif

" if !hasmapto("<leader>P",'n')
    " nnoremap <script> <silent> <buffer> <leader>P :.! today-int postpone 1<CR>
" endif

" if !hasmapto("<leader>C",'n')
    " nnoremap <script> <silent> <buffer> <leader>C :.! today-int complete<CR>
" endif

" Mark done {{{2
if !hasmapto("<leader>x",'n')
    nnoremap <script> <silent> <buffer> <leader>x Ix <Esc>
endif

" Restore context {{{1
let &cpo = s:save_cpo
" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
