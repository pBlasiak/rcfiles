set nocompatible              " be iMproved, required
filetype off                  " required

" ********** VUNDLE BEGIN **********
 set rtp+=~/.vim/bundle/Vundle.vim
 set rtp+=~/.fzf
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'vim-scripts/a.vim'
 Plugin 'qpkorr/vim-bufkill'

 Plugin 'micha/vim-colors-solarized'
 Plugin 'rking/ag.vim'
 Plugin 'junegunn/fzf', { 'do': './install --all' }
 Plugin 'junegunn/fzf.vim'
 Plugin 'jlanzarotta/bufexplorer'
 Plugin 'majutsushi/tagbar'
 Plugin 'gerw/vim-latex-suite'
 Plugin 'gerw/vim-tex-syntax'
 Plugin 'octol/vim-cpp-enhanced-highlight'
 Plugin 'ap/vim-css-color'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
 "Plugin 'Townk/vim-autoclose' " it turns off latex-suite
 Plugin 'chrisbra/improvedft'
 Plugin 'chaoren/vim-wordmotion'

 Plugin 'zefei/vim-wintabs'
 Plugin 'zefei/vim-wintabs-powerline'
 "Plugin 'restore_view.vim' " causes clash with ctrl+h shortcut

" ********** VUNDLE END **********
" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

   
   syntax on
   filetype plugin indent on

" ********** TAGS **********
set tags=./.tags,.tags,/home/$USER/OpenFOAM/OpenFOAM-v2106/.tags,/home/$USER/OpenFOAM/przemek-v2106/.tags


" ********** BASIC SETTINGS **********
set mouse=a
set hidden
set autoread
set autoindent
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set hlsearch
set path+=.
set nocp
set number
set gfn=Ubuntu\ Mono\ 12
set timeoutlen=450 " Time to wait after ESC (default causes an annoying delay)
set showmatch
set belloff=all "turns off the bell while tab is pressed
set smartindent
if &diff
	set diffopt+=vertical
endif

" ########## MAPPINGS ##########

" ********* MAPPINGS FOR WINDOWS ###########
nmap <silent> <C-L> :vs<CR><C-W><C-W>
nmap <silent> <C-M> :sp<CR><C-W><C-W>
nmap <silent> <C-N> <C-W><C-W>
nmap <silent> <C-P> <C-W><S-W>

" ********* MAPPINGS FOR UPDATE TAGS ###########
nmap \t :!(cd %:p:h; ctags --c++-kinds=+p --language-force=C++ --extra=+qf --fields=+iaS --exclude=**/.git/** --exclude=**/bin/** --exclude=**/platforms/** --exclude=**/build/** --exclude=**/doc/** --exclude=**/etc/** --exclude=**/modules/** --exclude=ThirdParty --exclude=**/tutorials/** --exclude=**/wmake/** -f .tags *.[CH])&
nnoremap <C-]> g<C-]>
nnoremap <C-LeftMouse> g<C-]>

" ********* MAPPINGS FOR LOAD VIMRC ***********
map <leader>s :source ~/.vimrc<CR>

" ********* MAPPINGS FOR READ ONLY FILE ***********
map <leader>n :set nomodifiable<CR>
map <leader>m :set modifiable<CR>

" ********* MAPPINGS FOR VIMDIFF ***********
if &diff
	syntax off
	map <leader>t :diffthis<CR>
	map <leader>o :diffoff<CR>
	map <leader>u :diffupdate<CR>
	map <leader>gl :diffget LO<CR>
	map <leader>gb :diffget BA<CR>
	map <leader>gr :diffget RE<CR>
endif

" ********* MAPPINGS FOR COPY/PASTE TO/FROM CLIPBOARD REGISTER ***********
noremap <Leader>y "+y
noremap <Leader>p "+p

" ********* OTHER MAPPINGS ***********
map E ea
map <Leader>g :Gvdiffsplit HEAD~1:%
"nnoremap <leader>tm :topleft term<cr>
nnoremap <leader>tm :rightbelow term<cr>

" insert { } and enter between them
inoremap {<CR> {<CR>}<ESC>O 

" insert ( ) and enter between them
inoremap (<CR> (<CR>)<ESC>O <space><space><space><space>

" highlights the line with the cursor
map <Leader>h :set cursorline<CR> & :highlight CursorLine guibg=lightblue ctermbg=lightgrey<CR>
map <Leader>H :set nocursorline<CR>

" ########## PLUGINS SETTINGS ##########

" ********** NETRW **********
map  <F2> :Explore.<CR>
"map  <F2> :Lexplore.<CR>
nmap <leader>q :1wincmd c<CR>
"map  <F2> :e.<CR>
map <leader>e :Ex<CR>

let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4 " open files in previous window (the current split you have beside netrw split)
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_use_errorwindow = 0
autocmd FileType netrw setl bufhidden=wipe

" ********** LATEX-SUITE **********
map  <F6> :wall<CR> <leader>ll <leader>ls

" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'

let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'okular --unique'

augroup MyIMAPs
    au!
	au VimEnter * call IMAP('()', '(<++>)<++>', '')
	au VimEnter * call IMAP('[]', '[<++>]<++>', '')
	au VimEnter * call IMAP('{}', '{<++>}<++>', '')
	au VimEnter * call IMAP('""', '"<++>"<++>', '')
	au VimEnter * call IMAP('HHH', '\href{<++>}{<++>}<++>', '')
	au VimEnter * call IMAP('hl', '\hl{<++>}<++>', '')
	au VimEnter * call IMAP('<>', '<<++>><++>', '')
augroup END

" ********** TAGBAR **********
nmap <F4> :TagbarToggle<CR>    
nmap <F5> :TagbarTogglePause<CR>    

let g:tagbar_sort = 0

" ********** YouCompleteMe **********
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

"let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_key_list_stop_completion = ['<Esc>'] " <Esc> is used the Delete
"button does not work

" ********** BUFFERS EXPLORER **********
nnoremap <silent> <F3> :BufExplorer<CR>

" ********** BUFKILL **********
map <C-c> :BD<cr>

" ********** FZF **********
"nnoremap <C-j> :FZF ~<Cr>
"nnoremap <C-g> :Rg<Cr>

" ********** IMPROVEDFT **********
"let g:ft_improved_nohighlight = 1
let g:ft_improved_consistent_comma = 1
let g:ft_improved_multichars = 1
"let g:ft_improved_ignorecase = 1

" ********** VIM-WORDMOTION **********
let g:wordmotion_uppercase_spaces = ['_', '/', '.', ',', ';', '::', '>', '"', '[', ']', '(', ')', '{', '}']

" ********** WINTABS **********
"let g:wintabs_ui_readonly='-'
"let g:wintabs_ui_sep_leftmost=''
"let g:wintabs_ui_sep_inbetween='|'
"let g:wintabs_ui_sep_rightmost='|'
map <C-H> <Plug>(wintabs_previous)
map <C-K> <Plug>(wintabs_next)
" close current buffer (like Ctrl+C)
map <C-T>c <Plug>(wintabs_close)
" undo recently closed buffer 
map <C-T>u <Plug>(wintabs_undo)
" close all but current buffer 
map <C-T>o <Plug>(wintabs_only)
" close current window
map <C-W>c <Plug>(wintabs_close_window)
" close all but current window 
map <C-W>o <Plug>(wintabs_only_window)
" loads all buffers from current tab to current window
map <leader>w <Plug>(wintabs_all)
" loads all buffers from all tabs to current window
command! Wallbufferfs WintabsAllBuffers
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab
