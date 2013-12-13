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

" Folding {{{1
" Options {{{2
setlocal foldmethod=expr
setlocal foldexpr=TodoFoldLevel(v:lnum)
setlocal foldtext=TodoFoldText()

" TodoFoldLevel(lnum) {{{2
function! TodoFoldLevel(lnum)
    " Fold consecutive done tasks and tasks grouped by project (i.e. a project
    " only line followed by indented lines).
    let l:line = getline(a:lnum)
    " Done task
    if l:line =~'^[xX]\s'
        return 1
    " Beginning of project group
    elseif l:line =~ '^+[^[:blank:]]\+$' && getline(a:lnum + 1) =~ '^\s\+\S'
        return '>1'
    " Inside project group
    elseif l:line =~ '^\s\+\S' && getline(a:lnum - 1) =~ '^\(\s\+\S\|+[^[:blank:]]\+$\)' 
        " Continuation of project group
        if getline(a:lnum+1) =~ '^\s\+\S'
            return 1
        " End of project group
        else
            return '<1'
        endif
    endif
    return 0
endfunction

" TodoFoldText() {{{2
function! TodoFoldText()
    " For folded completed tasks:
    "     The text displayed at the fold is formatted as '+- N Completed tasks'
    "     where N is the number of lines folded.
    if getline(v:foldstart) =~ '^[xX]\s'
        return '+' . v:folddashes . ' '
                    \ . (v:foldend - v:foldstart + 1)
                    \ . ' Completed tasks '
    " For folded project group: '+- N tasks for PROJECT'
    else
        return '+' . v:folddashes . ' '
                    \ . (v:foldend - v:foldstart)
                    \ . ' tasks for ' . getline(v:foldstart)
endfunction

" Restore context {{{1
let &cpo = s:save_cpo
" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
