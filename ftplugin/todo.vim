" File:        todo.txt-vim/ftplugin/todo.vim
" Description: Todo.txt filetype plugin
" Author:      Leandro Freitas <freitass@gmail.com>
"              Eike von Seggern <eikevons@yahoo.de>
" Licence:     Vim licence
" Website:     http://github.com/eikevons/todo.txt-vim

" Prevent multiple execution
if exists('b:did_ftplugin')
    finish
else
    let b:did_ftplugin = 1
endif

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

if !hasmapto("<leader>D",'n')
    nnoremap <script> <silent> <buffer> <leader>D Ix <C-R>=strftime("%Y-%m-%d")<CR> <Esc>
endif

" Folding {{{1
function! TodoFold(lnum)
    let l:line = getline(a:lnum)
    if l:line =~ '^\s*$'
        return '-1'
    endif
    let l:ind = indent(a:lnum)


    " line contains only a context/project -> new task group
    if l:line =~ '^\s*[@+][^@+[:blank:]]\+$'
        return '>'. ( l:ind / &shiftwidth + 1)
    " line contains a done task
    elseif l:line =~? '^\s*x\s.*$'
        " previous line is an undone task and next line is a done task ->
        " start done's-fold
        if l:ind < indent(a:lnum - 1) || getline(a:lnum - 1) !~? '^\s*x\s.' && getline(a:lnum + 1) =~? '^\s*x\s.' 
            return '>'. ( l:ind / &shiftwidth + 1)
        else
            return  l:ind / &shiftwidth + 1
        endif
    else
        return l:ind / &shiftwidth
    endif

    return '-1'
endfun

function TodoFoldText()
    let l:line = getline(v:foldstart)
    if l:line =~? '^\s*x\s.'
        let l:desc = (v:foldend - v:foldstart + 1) . ' done tasks'
    else
        " Note: Folds start only at done tasks or at task groups so we do not need to
        " check explicetly if were in a task group.
        " elseif l:line =~? '^\s*[@+]'
        let l:desc = substitute(l:line, '\s', '', 'g') . ' (' . (v:foldend - v:foldstart) . ' tasks)'
    endif

    return v:folddashes . ' ' . l:desc
endfun

setlocal foldexpr=TodoFold(v:lnum)
setlocal foldtext=TodoFoldText()
setlocal foldmethod=expr
" Restore context {{{1
let &cpo = s:save_cpo
" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
