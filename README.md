My settings for vimrc, gvimrc and bashrc
========================================


Useful mappings in vim
------------

- F-buttons mappings

&nbsp;

	<F1>           - Help
    <F2>           - Open file explorer in the current buffer (:Explore .)
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
    <F8>           - FREE
	<S-F8>         - FREE
    <F9>           - For \cite, \ref and file completion in Latex-Suite

- Ctrl-buttons mappings

&nbsp;

    <C-]>          - Jump to the tag under cursor
    <C-LeftMouse>  - Jump to the tag under cursor
    <C-L>          - Vertical split
    <C-M>          - Horizontal split
    <C-N>          - Go to next view
    <C-P>          - Go to previous view
    <C-K>          - Go to next buffer
    <C-H>          - Go to previous buffer
    <C-C>          - Buffer kill without closing buffer
	<C-T>o         - Close all but current buffer (similar to <C-C>)
	<C-T>c         - Close current buffer
	<C-T>u         - Undo closed buffer
	<C-W>o         - Close all but current window
	<C-W>c         - Close current window


- leader-buttons mappings 

&nbsp;

    <leader>s      - Source vimrc
    <leader>n      - Set file as nomodifiable
    <leader>m      - Set file as modifiable
    <leader>q      - Close the most left window
    <leader>e      - Open netrw in current file directory (:Ex)
    <leader>d      - YouCompleter GoTo
    <leader>gh     - YouCompleter GoToDeclaration
    <leader>gd     - YouCompleter GoToDefinition
    <Leader>y      - "+y
    <Leader>p      - "+p
    <Leader>w      - load all buffers from current tab to current window (:WintabsAll)
    <Leader>h      - highlights the line with the cursor
    <Leader>H      - unset <Leader>h
    <Leader>t      - Rebuild the .tags file in the directory of the current source file

- Useful commands

&nbsp;

    :A             - Switches to the header file and vice versa
	:AS            - Splits and switches
    :AV            - Vertical splits and switches
    :AT            - New tab and switches
    g;             - Go back to previous cursor position
    :Ag            - Search for a word as follows :Ag [options] {pattern} [{directory}]
    :FZF ~         - Search for a file starting from the ~/ directory
    ;              - After 'f' command go to next occurance of a word searched
    ,              - After 'f' command go to previous occurance of a word searched
	~              - Switch case (e.g. lowercase to uppercase letters)
	U              - Upper case of marked area
	:%s/old/new/gc - Replace all old with new throughout file with confirmations
	:Ex            - Opens the directory of the current file
	:Sexplore      - Opens the file explorer in horizontal spllit
	:Vexplore      - Opens the file explorer in vertical spllit
	ctrl+v         - In insert mode it inserts character literally (e.g. IMAP in latex-suite is off) 
	ctrl+]         - In visual model go to the tag (first match)
	g]             - You can visually select a text and press g] to get a list of matching tags
	%              - Move to matching character ( () [] {} )
	$              - Jump to the end of line
    }              - Jump to next paragraph/function/block
    {              - Jump to previous paragraph/function/block
	{<CR>          - Auto close { } and insert new line between them
	(<CR>          - Auto close ( ) and insert new line between them
	zz             - Center cursor on screen
	"xy            - Yank into register x
	"xp            - Paste contents of register x
	"+y            - Yank into the system clipboard register
	"+p            - Paste from the system clipboard register
	qa             - Record macro a
	q              - Stop recording macro
	@a             - Run macro a
	@@             - Rerun last run macro
	:noh           - Remove highlighting of search matches
	E              - Mapping for ea (jump to end of word in insert mode)
	:Wallbuffers   - Load all buffers from all tabs to current window (:WintabsAllBuffers)
	:Gvdiffsplit HEAD~3:%   - Brings up the staged version of the file side by side with the version 3 commits ago

- Mappings for vimdiff

&nbsp;

	<leader>t      - diffthis
	<leader>o      - diffoff
	<leader>u      - diffupdate
	<leader>gl     - diffget LO
	<leader>gb     - diffget BA
	<leader>gr     - diffget RE

- Mappings for LaTeX-Suite

&nbsp;

	VVV            - \verb++
	BBB            - \mathbf{}
	RRR            - \mathrm{}
	TTT            - \todo[size=\small, color=<++>!40]{<++>}<++>
	(((            - \left( \right)

- Other mappings

&nbsp;

	HHH            - \href{}{<++>}
