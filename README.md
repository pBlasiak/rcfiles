My settings for vimrc, gvimrc and bashrc
========================================


Useful mappings in vim
------------

- F-buttons mappings

&nbsp;

    <F2>           - Turn on file explorer on the left
    <F3>           - Turn on buffer explorer
    <F6>           - Compile latex-suite and forward search to pdf
    <F7>           - Turn on tag bar on the right
    <F8>           - Switch to main view in Golden View
	<S-F8>         - Switch back from main view in Golden View

- Ctrl-buttons mappings

&nbsp;

    <C-]>          - Jump to the tag under cursor
    <C-LeftMouse>  - Jump to the tag under cursor
    <C-L>          - Vertical split
    <C-N>          - Go to next view
    <C-P>          - Go to previous view
    <C-K>          - Go to next buffer
    <C-H>          - Go to previous buffer
    <C-C>          - Buffer kill without closing buffer


- leader-buttons mappings 

&nbsp;

    <leader>s      - Source vimrc
    <leader>n      - Set file as nomodifiable
    <leader>m      - Set file as modifiable
    <leader>q      - Close the most left window
    <leader>e      - Open netrw in current buffer
    <leader>d      - YouCompleter GoTo
    <leader>gh     - YouCompleter GoToDeclaration
    <leader>gd     - YouCompleter GoToDefinition

- Useful commands

&nbsp;

    :A             - Switches to the header file and vice versa
    g;             - Go back to previous cursor position
    :Ag            - Search for a word as follows :Ag [options] {pattern} [{directory}]
    :FZF ~         - Search for a file starting from the ~/ directory
    ;              - After 'f' command go to next occurance of a word searched
    ,              - After 'f' command go to previous occurance of a word searched

- Mappings for vimdiff

&nbsp;

	<leader>t      - diffthis
	<leader>o      - diffoff
	<leader>u      - diffupdate
	<leader>gl     - diffget LO
	<leader>gb     - diffget BA
	<leader>gr     - diffget RE
