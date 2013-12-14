### About

This plugin gives syntax highlighting to [todo.txt](http://todotxt.com/) files.

In contrast to the original todo.txt definition, in this version the syntax
allows nesting of projects or contexts, e.g.

    @office
      (A) an important office task
      call someone
    x done task
    +world-peace
      ...

It also defines a few mappings, to help with edition of these files:

`<leader>-d` : Insert the current date

`<leader>-D` : Insert the current date with leading `x` (completed)

`date<tab>` : (Insert mode) Insert the current date

`<leader>-x` : Mark current task as completed

### Quick install

    git clone git://github.com/eikevons/todo.txt-vim.git
    cd todo.txt-vim
    cp -R * ~/.vim

If you want the help installed run ":helptags ~/.vim/doc" inside vim after
having copied the files. Then you will be able to get the commands help with:
:h todo.txt
