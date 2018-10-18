set nocompatible              " be iMproved, required
filetype off                  " required

" ********** VUNDLE BEGIN **********
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'mileszs/ack.vim'
 Plugin 'The-NERD-tree'
 Plugin 'nerdtree-ack'
 Plugin 'tpope/vim-fugitive'
 Plugin 'vim-scripts/a.vim'
 Plugin 'qpkorr/vim-bufkill'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 "Plugin 'easymotion/vim-easymotion'
 Plugin 'kien/ctrlp.vim'
 Plugin 'micha/vim-colors-solarized'
 Plugin 'jlanzarotta/bufexplorer'
 Plugin 'majutsushi/tagbar'
 Plugin 'gerw/vim-latex-suite'
 Plugin 'gerw/vim-tex-syntax'
 Plugin 'octol/vim-cpp-enhanced-highlight'
 Plugin 'ap/vim-css-color'
 Plugin 'Valloric/YouCompleteMe'
 "Plugin 'rdnetto/YCM-Generator'
 "Plugin 'tpope/vim-commentary'
 "Plugin 'Townk/vim-autoclose' " it turns out latex-suite
 Plugin 'chrisbra/improvedft'
" Plugin 'dahu/vim-fanfingtastic'
 "Plugin 'craigemery/vim-autotag'

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
set tags=./tags,tags,/home/przemek/OpenFOAM/przemek-v1612+/tags

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
set gfn=Ubuntu\ Mono\ 13
set timeoutlen=450 " Time to wait after ESC (default causes an annoying delay)
set showmatch
"set nowrap
set smartindent

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


" ********** MAPPINGS **********
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew .<CR> 
map  <F2> :NERDTreeToggle<CR>
map  <F6> :w<CR> <leader>ll <leader>ls
nmap ,t :!(cd %:p:h;ctags *.[ch])&
nmap <F8> :TagbarToggle<CR>    
map <leader>s :source ~/.gvimrc<CR>

" ********** SETTINGS FOR LATEX-SUITE **********
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


" ********** SETTINGS FOR CtrlP **********
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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" ********** SETTINGS FOR BUFFERS EXPLORER **********
 nnoremap <silent> <F3> :BufExplorer<CR>
 nnoremap <silent> <F12> :bn<CR>
 nnoremap <silent> <S-F12> :bp<CR>


" ********** SETTINGS FOR NERDTree **********
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
"let g:NERDTreeChDirMode       = 2
nmap <LocalLeader>nn :NERDTreeToggle<cr>


" ********** SETTINGS FOR VIM-AIRLINE **********
"let g:airline#extensions#tabline#formatter = 'unique-tail_improved'


" ********** SETTINGS FOR YouCompleteMeE **********
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_key_list_stop_completion = ['<Esc>'] " <Esc> is used the Delete
"button does not work


" ********** SETTINGS FOR IMPROVEDFT **********
"let g:ft_improved_nohighlight = 1
let g:ft_improved_consistent_comma = 1
let g:ft_improved_multichars = 1
"let g:ft_improved_ignorecase = 1


" ********** SETTINGS FOR AUTOTAG **********
"let g:autotagTagsFile="tags"

if &diff
	syntax off
endif
 

