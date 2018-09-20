# isystem.vim

ISystem is a minimalist interactive system command runner. It populates a buffer with a
default command.  This command will be run and the result stored into the
quick fix or location list.

Run it with
:ISystem {search-command}
This will create a new buffer with the {search-command}.
pressing _\<CR\>_ or _c_ will execute that command and put the result in the quick
fix list.
