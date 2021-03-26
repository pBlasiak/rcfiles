My settings for vimrc, gvimrc and bashrc
========================================


Useful mappings in vim
------------

- F-buttons mappings

&nbsp;

    <F1>           - Open file explorer in the current buffer (:Ex)
    <F2>           - Turn on file explorer on the left 
    <F3>           - Turn on buffer explorer
    <F4>           - Turn on TagBar
    <F5>           - In insert or normal mode while on an empty line, 
	                 Latex-Suite prompts you with a list of environments you might want to insert. 
					 You can either choose one from the list or type in a new environment name. 
					 If you press <F5> on a line which already has a word, then that word is used instead of prompting.
					 You can also select a portion of text visually and press <F5> while still in visual mode.
    <F6>           - Compile Latex-Suite and forward search to pdf
    <F7>           - In insert or normal mode while the cursor is touching a word will insert a command 
	                 formed from the word touching the cursor (Latex-Suite). You can select a portion of text 
					 visually and press <F7> while still in visual mode. This will prompt you with a list of commands.
    <F8>           - Switch to main view in Golden View
	<S-F8>         - Switch back from main view in Golden View
    <F9>           - For \cite, \ref and file completion in Latex-Suite

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
	~              - Switch case (e.g. lowercase to uppercase letters)
	U              - Upper case of marked area
	:%s/old/new/gc - replace all old with new throughout file with confirmations
	:Sexplore      - Opens the file explorer in horizontal spllit
	:Vexplore      - Opens the file explorer in vertical spllit
	ctrl+v         - In insert mode it inserts character literally (e.g. IMAP in latex-suite is off) 

- Mappings for vimdiff

&nbsp;

	<leader>t      - diffthis
	<leader>o      - diffoff
	<leader>u      - diffupdate
	<leader>gl     - diffget LO
	<leader>gb     - diffget BA
	<leader>gr     - diffget RE
