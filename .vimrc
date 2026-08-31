if has('clientserver') && empty(v:servername)
  call remote_startserver('VIM')
endif

set nocompatible              " be iMproved, required

" ============================================================
" VIM-PLUG
" ============================================================

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'
Plug 'qpkorr/vim-bufkill'

Plug 'micha/vim-colors-solarized'
Plug 'rking/ag.vim'

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'

" LaTeX -- KEEP FOR NOW
Plug 'lervag/vimtex'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ap/vim-css-color'

Plug 'Valloric/YouCompleteMe'

" niepotrzebne bo lepiej kompilowac
" z bear i tworzyc plik compile_commands.json
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"Plugin 'Townk/vim-autoclose' " it turns off latex-suite

Plug 'chrisbra/improvedft'
Plug 'chaoren/vim-wordmotion'

Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'

"Plugin 'restore_view.vim' " causes clash with ctrl+h shortcut

call plug#end()

syntax on
filetype plugin indent on

" ============================================================
" TAGS
" ============================================================

set tags=./.tags,.tags,/home/$USER/OpenFOAM/OpenFOAM-v2106/.tags,/home/$USER/OpenFOAM/przemek-v2106/.tags

" ============================================================
" BASIC SETTINGS
" ============================================================

" Ścieżka do SumatraPDF w Windowsie (wybierz właściwą wersję instalacji):
let g:vimtex_view_general_viewer = '/mnt/c/Users/pblasiak/AppData/Local/SumatraPDF/SumatraPDF.exe'
" Lub jeśli instalowano dla wszystkich użytkowników:
" let g:vimtex_view_general_viewer = '/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe'

let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

" Schowek systemowy 
" wymagana kompilacja vim z +clipboard
set clipboard=unnamedplus

set mouse=a
set hidden
set autoread
set backspace=indent,eol,start

"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

set hlsearch
set path+=.
set nocp
set number

" GUI setting -- harmless in terminal Vim
set gfn=Ubuntu\ Mono\ 12

set timeoutlen=450
set showmatch
set belloff=all
set smartindent

if &diff
set diffopt+=vertical
endif

" ============================================================
" MAPPINGS
" ============================================================

" ---------- MAPPINGS FOR WINDOWS ----------

nmap <silent> <C-L> :vs<CR><C-W><C-W>
nmap <silent> <C-M> :sp<CR><C-W><C-W>
nmap <silent> <C-N> <C-W><C-W>
nmap <silent> <C-P> <C-W><S-W>

" ---------- MAPPINGS FOR UPDATE TAGS ----------

nmap <leader>tt :!(cd %:p:h; ctags --c++-kinds=+p --language-force=C++ --extra=+qf --fields=+iaS --exclude=**/.git/** --exclude=**/bin/** --exclude=**/platforms/** --exclude=**/build/** --exclude=**/doc/** --exclude=**/etc/** --exclude=**/modules/** --exclude=ThirdParty --exclude=**/tutorials/** --exclude=**/wmake/** -f .tags *.[CH])&

nnoremap <C-]> g<C-]>
nnoremap <leader>] g<C-]>

" ---------- LOAD VIMRC ----------

map <leader>s :source ~/.vimrc<CR>

" ---------- READ ONLY FILE ----------

map <leader>n :set nomodifiable
map <leader>m :set modifiable

" ---------- VIMDIFF ----------

"if &diff
"    syntax off
"    map <leader>t :diffthis
"    map <leader>o :diffoff
"    map <leader>u :diffupdate
"    map <leader>gl :diffget LO
"    map <leader>gb :diffget BA
"    map <leader>gr :diffget RE
"endif


" ---------- OTHER MAPPINGS ----------

""<++>nnoremap <Leader>r :browse oldfiles<CR>
" ---------- HISTORIA PLIKÓW (QUICKFIX) ----------
function! ShowOldfilesQF()
  let l:list = []
  for f in v:oldfiles
    call add(l:list, {'filename': f})
  endfor
  call setqflist(l:list)
  copen
endfunction

function! OpenQfFile()
  let l:idx = line('.') - 1
  if exists('v:oldfiles') && l:idx >= 0 && l:idx < len(v:oldfiles)
    let l:file = v:oldfiles[l:idx]
    cclose
    execute 'edit ' . fnameescape(expand(l:file))
  endif
endfunction

" Skrót wywołujący historię (np. Spacja + r lub \r)
nnoremap <Leader>r :call ShowOldfilesQF()<CR>

" Mapowanie Entera i dwukliku myszy w oknie Quickfix
autocmd FileType qf nnoremap <buffer> <silent> <CR> :call OpenQfFile()<CR>
autocmd FileType qf nnoremap <buffer> <silent> <2-LeftMouse> :call OpenQfFile()<CR>

map E ea
map <leader>g :Gvdiffsplit HEAD~1:%

"nnoremap tm :topleft term
nnoremap tm :rightbelow term

" ---------- SEARCH TODO ----------

command! Todo Ag --literal "TODO"
nnoremap <leader>t :Ag --literal "TODO"


" ---------- CURSORLINE ----------

map <leader>h :set cursorline <Bar> :highlight CursorLine guibg=lightblue ctermbg=lightgrey
map <leader>H :set nocursorline

" ============================================================
" NETRW
" ============================================================

map  <F2> :Explore.<CR>
"map  <F2> :Lexplore.<CR>
nmap <leader>q :1wincmd c<CR>
"map  <F2> :e.<CR>
map <leader>e :Ex<CR>
"map <leader>e :Explore.
"nmap q :1wincmd c
"map e :Ex

let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_use_errorwindow = 0

autocmd FileType netrw setl bufhidden=wipe

" ============================================================
" VIMTEX
" ============================================================
" DODANE 30.08.2026 (nie komitowane)
map  <F6> :wall<CR> <leader>ll <leader>lv

let g:tex_flavor = 'latex'

let g:vimtex_compiler_method = 'latexmk'

"let g:vimtex_view_method = 'zathura'

let g:vimtex_quickfix_mode = 0

"let g:vimtex_view_forward_search_on_start = 0
nmap <buffer> gd <plug>(vimtex-gd)

" ---------- SKRÓTY LATEX (Zamiennik dla LaTeX-Suite) ----------
" Funkcja przeskakująca do kolejnego <++>, usuwająca go i przechodząca w tryb Insert
function! TexJumpPlaceholder()
  if search('<++>', 'W')
    execute "normal! \"_d4l"
    startinsert
  endif
endfunction

" ---------- SKRÓTY LATEX ----------
autocmd BufRead,BufNewFile *.tex inoremap <buffer> "" ""<Left>
" Wstawianie []<++> z kursorem w środku nawiasu
autocmd BufRead,BufNewFile *.tex inoremap <buffer> [ []<++><Esc>F[a

" Skok pod Ctrl+j do najbliższego <++> i jego usunięcie
autocmd BufRead,BufNewFile *.tex inoremap <buffer> <C-j> <Esc>/<++><CR>"_c4l
"augroup TexIMAPs
"  autocmd!
"  autocmd FileType tex,plaintex inoremap <buffer> () (<++>)<++>
"  autocmd FileType tex,plaintex inoremap <buffer> [] [<++>]<++>
"  autocmd FileType tex,plaintex inoremap <buffer> {} {<++>}<++>
"  autocmd FileType tex,plaintex inoremap <buffer> "" "<++>"<++>
"  autocmd FileType tex,plaintex inoremap <buffer> HHH \href{<++>}{<++>}<++>
"  autocmd FileType tex,plaintex inoremap <buffer> hl \hl{<++>}<++>
"  autocmd FileType tex,plaintex inoremap <buffer> <> <<++>><++>
"
"  " Skok i usunięcie znacznika pod Ctrl + j
"  autocmd FileType tex,plaintex inoremap <buffer> <C-j> <Esc>:call TexJumpPlaceholder()<CR>
"augroup END

" ============================================================
" TAGBAR
" ============================================================

nmap <F4> :TagbarToggle<CR>    
nmap <F5> :TagbarTogglePause<CR>    
"nmap <leader>tb :TagbarToggle
"nmap <leader>tp :TagbarTogglePause

let g:tagbar_sort = 0

" ============================================================
" YOUCOMPLETEME
" ============================================================

let g:statusline_custom = 0

function! ToggleStatusLine()
if g:statusline_custom
set statusline=
let g:statusline_custom = 0
else
set statusline=%{execute('YcmShowDetailedDiagnostic')}
let g:statusline_custom = 1
endif
endfunction

" Map it to a key, for example, F7
" nnoremap <F7> :call ToggleStatusLine()

"nnoremap <leader>d :YcmCompleter GoTo<CR>
"nnoremap <leader>gh :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

"let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_show_detailed_diag_in_popup=1

"let g:ycm_complete_in_comments = 1
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_key_list_stop_completion = ['']

" ============================================================
" BUFFER EXPLORER
" ============================================================

nnoremap <silent> <F3> :BufExplorer<CR>
"nnoremap <leader>be :BufExplorer

" ============================================================
" BUFKILL
" ============================================================

map <C-c> :BD<cr>
"map <leader>bd :BD

" ============================================================
" FZF
" ============================================================

"nnoremap <leader>f :FZF ~
"nnoremap <leader>r :Rg

" ============================================================
" IMPROVEDFT
" ============================================================

"let g:ft_improved_nohighlight = 1
let g:ft_improved_consistent_comma = 1
let g:ft_improved_multichars = 1
"let g:ft_improved_ignorecase = 1

" ============================================================
" VIM-WORDMOTION
" ============================================================

let g:wordmotion_uppercase_spaces = ['_', '/', '.', ',', ';', '::', '>', '"', '[', ']', '(', ')', '{', '}']

" ============================================================
" WINTABS
" ============================================================

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



" Włączenie podstawowych opcji wcięć
set cindent
set cinoptions+=(s,m1

" Uniwersalna funkcja rozwijająca bloki dla {}, () oraz []
function! CleverCR()
  let l:before = col('.') > 1 ? getline('.')[col('.')-2] : ''
  let l:after  = getline('.')[col('.')-1]

  if l:before == '{' && l:after == '}'
    return "\<CR>\<Esc>O"
  elseif (l:before == '(' && l:after == ')') || (l:before == '[' && l:after == ']')
    return "\<CR>\<C-d>\<Esc>O"
  else
    return "\<CR>"
  endif
endfunction

" ---------- GLOBALNE AUTOMATYCZNE NAWIASY I CUDZYSŁOWY ----------
inoremap ( ()<++><Left><Left><Left><Left><Left>
inoremap { {}<++><Left><Left><Left><Left><Left>
inoremap [ []<++><Left><Left><Left><Left><Left>
inoremap < <><++><Left><Left><Left><Left><Left>
inoremap <char-34> ""<++><Left><Left><Left><Left><Left>

" Inteligentny Enter działający w każdym pliku
inoremap <expr> <CR> CleverCR()

" Skok do kolejnego znacznika <++> pod Ctrl + j w każdym pliku
""<++>inoremap <C-j> <Esc>/<++><CR>:noh<CR>"_c4l
 nnoremap <silent> <C-j> /<++><CR>:nohlsearch<CR>c4l
 inoremap <silent> <C-j> <C-o>/<++><CR><C-o>:nohlsearch<CR><C-o>"_d4l

" Szybkie środowiska LaTeXa (kompatybilne ze skokiem <C-j>)
autocmd FileType tex inoremap <buffer> EEQ \begin{equation}<CR><++><CR>\end{equation}<CR><++><Esc>2kO
autocmd FileType tex inoremap <buffer> EIT \begin{itemize}<CR>\item <++><CR>\end{itemize}<CR><++><Esc>2kf<i
autocmd FileType tex inoremap <buffer> EEN \begin{enumerate}<CR>\item <++><CR>\end{enumerate}<CR><++><Esc>2kf<i
autocmd FileType tex inoremap <buffer> EFI \begin{figure}[H]<CR>\centering<CR>\includegraphics[width=0.8\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><Esc>5kf{a

" ---------- DODATKOWE SKRÓTY LATEX (Zamienniki dla IMAP) ----------
autocmd FileType tex inoremap <buffer> hhh \hl{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> HHH \href{}{<++>}<++><Esc>2F{a
autocmd FileType tex inoremap <buffer> CCC \cite{}<++><Esc>F{a
""<++>autocmd FileType tex inoremap <buffer> VVV \verb<bar><++><bar><++><Esc>2F<bar>a
autocmd FileType tex inoremap <buffer> VVV \verb<bar><bar><++><Esc>2F<bar>a
autocmd FileType tex inoremap <buffer> ((( \left(\right)<++><Esc>F(a
autocmd FileType tex inoremap <buffer> BBB \mathbf{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> RRR \mathrm{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> TTT \todo[size=\small, color=!40]{<++>}<++><Esc>F=a
autocmd FileType tex inoremap <buffer> LLL \begin{lstlisting}[language=C++, label=lst:, caption=<++>]<CR><++><CR>\end{lstlisting}<++><Esc>2kf:a
autocmd FileType tex inoremap <buffer> $$ $$<++><Left><Left><Left><Left><Left>
" ---------- KONTROLKI STRUKTURY I SYMBOLE (LaTeX) ----------
autocmd FileType tex inoremap <buffer> SEC \section{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> SSS \subsection{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> SCH \chapter{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> `6 \partial{}<++><Esc>F{a
autocmd FileType tex inoremap <buffer> `/  \frac{}{<++>}<++><Esc>2F{a
