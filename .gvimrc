set mouse=a
set hidden
"set textwidth=80
set autoread

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 let g:ycm_confirm_extra_conf = 0 

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'mileszs/ack.vim'
 Plugin 'The-NERD-tree'
 Plugin 'nerdtree-ack'
 Plugin 'tpope/vim-fugitive'
 Plugin 'vim-scripts/a.vim'
 Plugin 'qpkorr/vim-bufkill'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'kien/ctrlp.vim'
 Plugin 'micha/vim-colors-solarized'
 Plugin 'jlanzarotta/bufexplorer'
 "Plugin 'majutsushi/tagbar'
 Plugin 'gerw/vim-latex-suite'
 Plugin 'gerw/vim-tex-syntax'
 Plugin 'octol/vim-cpp-enhanced-highlight'
 Plugin 'ap/vim-css-color'
 Plugin 'Valloric/YouCompleteMe'
 "Plugin 'rdnetto/YCM-Generator'
 Plugin 'tpope/vim-commentary'
 "Plugin 'Townk/vim-autoclose' " it turns out latex-suite
 Plugin 'chrisbra/improvedft'
" Plugin 'dahu/vim-fanfingtastic'
"
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
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

let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

   
   syntax on
   filetype plugin indent on


""set tags+=/opt/openfoam230/tags
""set tags+=/home/przemek/OpenFOAM/przemek-2.3.0/tags

set autoindent
set backspace=2 " make backspace work like most other apps
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set hlsearch
set path+=.
"set path+=/home/przemek/OpenFOAM/OpenFOAM-v1612+/src/**100
"set path+=/opt/openfoam230/src/**


" "highlights column to see how many space left
"set colorcolumn=110
"highlight ColorColumn ctermbg=darkgray
"

" " path option to contain a comma-separated list of directories to look for
" " the file
"let &path.="src/include,/usr/include,"

set nocp
set number
set gfn=Ubuntu\ Mono\ 13
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew .<CR> 
map  <F2> :NERDTreeToggle<CR>
map  <F6> :w<CR> <leader>ll <leader>ls
    
    set timeoutlen=450 " Time to wait after ESC (default causes an annoying delay)
"   set ts=2
"   set sw=2
"   set expandtab
"     
"     " Don't use Ex mode, use Q for formatting
"     map Q gq
"     let maplocalleader = ","

"  " Settings for Latex-suite
" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:Tex_GotoError=0
let g:Tex_UseCiteCompletionVer2=0


" " Settings for CtrlP
let g:ctrlp_working_path_mode = 'rw'
"let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=1000
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'
"let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_by_filename = 0
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
 nnoremap <silent> <F3> :BufExplorer<CR>
 nnoremap <silent> <F12> :bn<CR>
 nnoremap <silent> <S-F12> :bp<CR>


"      
"      """"" Settings for NERDTree
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
"let g:NERDTreeChDirMode       = 2
nmap <LocalLeader>nn :NERDTreeToggle<cr>

if &diff
	syntax off
endif
 
" ---------------------------------------------------------------------------
""  """"" Settings for taglist.vim
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=0
"let Tlist_Enable_Fold_Column=0
"let Tlist_Compact_Format=0
"let Tlist_WinWidth=28
"let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close = 1
"nmap <LocalLeader>tt :Tlist<cr> 

