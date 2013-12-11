### Quick install

    git clone git://github.com/kayrick/todo.txt-vim.git
    cd todo.txt-vim
    cp -R * ~/.vim


This plugin gives syntax highlighting to [todo.txt](http://todotxt.com/) files. It also defines a few
mappings, to help with edition of these files:

`<leader>-s` : Sort the file

`<leader>-d` : Insert the current date

`<leader>-D` : Insert the current date with leading `x` (completed)

`date<tab>` : (Insert mode) Insert the current date

The following mapping require [todo.txt support scripts](http://github.com/kayrick/todo-txt.git):

`<leader>-S` : Sort the file according to task due date

`<leader>-X` : Mark current task as completed

`<leader>-P` : Postpone current task

`<leader>-C` : Update task due date if task is recurrent. Otherwise mark it as completed

`<leader>-t` : Mark task as due today

All these commands assume, that task due date is specified as `due:yyyy-mm-dd` and task recurrent interval
is specified as `rec:[0-9]+[dwmy]`

If you want the help installed run ":helptags ~/.vim/doc" inside vim after having copied the files.
Then you will be able to get the commands help with: :h todo.txt
