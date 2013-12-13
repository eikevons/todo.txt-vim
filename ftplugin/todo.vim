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

" Mappings {{{1
" Sort tasks {{{2
if !hasmapto("<leader>s",'n')
    nnoremap <script> <silent> <buffer> <leader>s :sort<CR>
endif

if !hasmapto("<leader>S",'n')
    nnoremap <script> <silent> <buffer> <leader>S :%!sort-int<CR>
endif


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

if !hasmapto("<leader>X",'n')
    nnoremap <script> <silent> <buffer> <leader>X Ix <Esc>
endif

if !hasmapto("<leader>t",'n')
    nnoremap <script> <silent> <buffer> <leader>t A due: <ESC>"=strftime("%Y-%m-%d")<CR>P
endif

if !hasmapto("<leader>P",'n')
    nnoremap <script> <silent> <buffer> <leader>P :.! today-int postpone 1<CR>
endif

if !hasmapto("<leader>C",'n')
    nnoremap <script> <silent> <buffer> <leader>C :.! today-int complete<CR>
endif

" Mark done {{{2
if !hasmapto("<leader>D",'n')
    nnoremap <script> <silent> <buffer> <leader>D ix  <ESC>"=strftime("%Y-%m-%d")<CR>P
endif

" Folding {{{1
" Options {{{2
setlocal foldmethod=expr
setlocal foldexpr=TodoFoldLevel(v:lnum)
setlocal foldtext=TodoFoldText()

" TodoFoldLevel(lnum) {{{2
function! TodoFoldLevel(lnum)
    " The match function returns the index of the matching pattern or -1 if
    " the pattern doesn't match. In this case, we always try to match a
    " completed task from the beginning of the line so that the matching
    " function will always return -1 if the pattern doesn't match or 0 if the
    " pattern matches. Incrementing by one the value returned by the matching
    " function we will return 1 for the completed tasks (they will be at the
    " first folding level) while for the other lines 0 will be returned,
    " indicating that they do not fold.
    let l:line = getline(a:lnum)
    if l:line =~'^[xX]\s'
        return 1
    elseif l:line =~ '^+[^[:blank:]]\+$'
        return '>1'
    elseif l:line =~ '^\s\+\S' && getline(a:lnum - 1) =~ '^\(\s\+\S\|+[^[:blank:]]\+$\)' 
        if getline(a:lnum+1) =~ '^\s\+\S'
            return 1
        else
            return '<1'
        endif
    endif
    return 0
endfunction

" TodoFoldText() {{{2
function! TodoFoldText()
    " The text displayed at the fold is formatted as '+- N Completed tasks'
    " where N is the number of lines folded.
    if getline(v:foldstart) =~ '^[xX]\s'
        return '+' . v:folddashes . ' '
                    \ . (v:foldend - v:foldstart + 1)
                    \ . ' Completed tasks '
    else
        return '+' . v:folddashes . ' '
                    \ . (v:foldend - v:foldstart)
                    \ . ' tasks for ' . getline(v:foldstart)
endfunction

" Restore context {{{1
let &cpo = s:save_cpo
" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
