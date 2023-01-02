set nocompatible              " be iMproved, required
filetype off                  " required

" ********** VUNDLE BEGIN **********
 set rtp+=~/.vim/bundle/Vundle.vim
 set rtp+=~/.fzf
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 "Plugin 'The-NERD-tree'
 Plugin 'tpope/vim-fugitive'
 Plugin 'vim-scripts/a.vim'
 Plugin 'qpkorr/vim-bufkill'

 "Plugin 'vim-airline/vim-airline'
 "Plugin 'vim-airline/vim-airline-themes'
 Plugin 'micha/vim-colors-solarized'
 "Plugin 'kien/ctrlp.vim'
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
 "Plugin 'tpope/vim-commentary'
 "Plugin 'Townk/vim-autoclose' " it turns off latex-suite
 Plugin 'chrisbra/improvedft'
 "Plugin 'spolu/dwm.vim'
 "Plugin 'zhaocai/GoldenView.Vim'
 "Plugin 'dahu/vim-fanfingtastic'
 "Plugin 'craigemery/vim-autotag'
 "Plugin 'https://bitbucket.org/shor-ty/vimextensionopenfoam/src/master/'
 "Plugin 'lervag/vim-foam'
 "Plugin 'SirVer/ultisnips'
 "Plugin 'honza/vim-snippets'
 
 ""Plugin 'LucHermitte/lh-vim-lib'
 ""Plugin 'LucHermitte/lh-brackets'

 "Plugin 'statox/betterTabs.vim'

 "Plugin 'bkad/CamelCaseMotion'
 Plugin 'chaoren/vim-wordmotion'

 Plugin 'zefei/vim-wintabs'
 Plugin 'zefei/vim-wintabs-powerline'
 Plugin 'restore_view.vim' " causes clash with ctrl+h shortcut

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
"set tags=./tags;/,tags;,~/OpenFOAM/przemek-v1612+/tags;/
"set tags=./tags;,tags;./.tags;,.tags;,/home/przemek/OpenFOAM/przemek-v1612+/.tags
"set tags=./.tags,.tags,/home/$USER/OpenFOAM/OpenFOAM-v1612+/.tags,/home/$USER/OpenFOAM/przemek-v1612+/.tags
"set tags=./.tags;,.tags;/home/$USER/OpenFOAM/OpenFOAM-v1612+/.tags;/home/$USER/OpenFOAM/przemek-v1612+/.tags
set tags=./.tags,.tags,/home/$USER/OpenFOAM/OpenFOAM-v2106/.tags,/home/$USER/OpenFOAM/przemek-v2106/.tags



" ********** BASIC SETTINGS **********
set mouse=a
set hidden
"set textwidth=80
set autoread
set autoindent
"set backspace=2 " make backspace work like most other apps
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
"set nowrap
set smartindent
if &diff
	set diffopt+=vertical
endif
"set splitbelow
"set splitright

" "highlights column to see how many space left
"set colorcolumn=110
"highlight ColorColumn ctermbg=darkgray
"

" " path option to contain a comma-separated list of directories to look for
" " the file
"let &path.="src/include,/usr/include,"
"
"   set ts=2
"   set sw=2
"   set expandtab


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

"" ********** GOLDEN-VIEW **********
"" 1. split to tiled windows
" nmap <silent> <C-L>  <Plug>GoldenViewSplit
"" 2. quickly switch current window with the main pane
"" and toggle back
" nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
" nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle
"" 3. jump to next and previous window
" nmap <silent> <C-N>  <Plug>GoldenViewNext
" nmap <silent> <C-P>  <Plug>GoldenViewPrevious
"
"let g:goldenview__enable_at_startup = 0
""let g:goldenview__enable_default_mapping = 0
"let g:goldenview__ignore_urule={
"\   'filetype' : [
"\     ''        ,
"\     'qf'      , 'vimpager', 'undotree', 'tagbar',
"\     'nerdtree', 'vimshell', 'vimfiler', 'voom'  ,
"\     'tabman'  , 'unite'   , 'quickrun', 'Decho' ,
"\     'ControlP', 'diff'    , 'extradite'
"\   ],
"\   'buftype' : [
"\     'nofile'  , 'terminal'
"\   ],
"\   'bufname' : [
"\     'GoToFile'                  , 'diffpanel_\d\+'      , 
"\     '__Gundo_Preview__'         , '__Gundo__'           , 
"\     '\[LustyExplorer-Buffers\]' , '\-MiniBufExplorer\-' , 
"\     '_VOOM\d\+$'                , '__Urannotate_\d\+__' , 
"\     '__MRU_Files__' , 'FencView_\d\+$'
"\   ],
"\ }





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
	au VimEnter * call IMAP('()', '(<++>)', '')
	au VimEnter * call IMAP('[]', '[<++>]', '')
	au VimEnter * call IMAP('{}', '{<++>}', '')
	au VimEnter * call IMAP('<>', '<<++>>', '')
	au VimEnter * call IMAP('""', '"<++>"', '')
	au VimEnter * call IMAP('HHH', '\href{<++>}{<++>}', '')
	au VimEnter * call IMAP('hl', '\hl{<++>}', '')
augroup END




" ********** TAGBAR **********
nmap <F4> :TagbarToggle<CR>    

"let g:tagbar_ctags_bin = '/snap/bin/ctags'





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
"map  <C-k> :bn<CR>
"map  <C-h> :bprevious<CR>





" ********** BUFKILL **********
map <C-c> :BD<cr>




" ********** FZF **********
"nnoremap <C-j> :FZF ~<Cr>
"nnoremap <C-g> :Rg<Cr>
"
"command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>, <bang>0)





" ********** CtrlP **********
"let g:ctrlp_working_path_mode = 'rw'
""let g:ctrlp_working_path_mode = 'ra' 
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=1000
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']






" ********** VIM-AIRLINE **********
"let g:airline#extensions#tabline#formatter = 'unique-tail_improved'
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'




" ********** IMPROVEDFT **********
"let g:ft_improved_nohighlight = 1
let g:ft_improved_consistent_comma = 1
let g:ft_improved_multichars = 1
"let g:ft_improved_ignorecase = 1


"" ********** ULTISNIPS **********
"let g:UltiSnipsExpandTrigger="<space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" ********** AUTOTAG **********
"let g:autotagTagsFile="tags"




" ********** BUFKILL **********
"let g:BufKillOverrideCtrlCaret


" ********** CAMELCASEMOTION **********
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"map <silent> ge <Plug>CamelCaseMotion_ge
"sunmap w
"sunmap b
"sunmap e
"sunmap ge
"
"imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
"imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w


" ********** VIM-WORDMOTION **********
let g:wordmotion_uppercase_spaces = ['_', '/', '.', ',', ';', '::', '>', '"', '[', ']', '(', ')', '{', '}']

" ********** LH-BRACKETS **********
""imap <C-G>      <Plug>MarkersJumpF
"" map <C-G>      <Plug>MarkersJumpF


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

" ********** RESTORE-VIM **********
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim'] 
