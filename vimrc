" File              : vimrc
" Author            : Xianglan Piao <xianglan0502@gmail.com>
" Date              : 2012.08.26
" Last Modified Date: 2018.08.26
" Last Modified By  : Xianglan Piao <xianglan0502@gmail.com>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Plugin Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"" Nerdtree File Explorer
Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0

"" Tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_left=1

"" Google Coding Style
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

"" Auto Pairs {},()
Plugin 'jiangmiao/auto-pairs'

"" Multiple Selection
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" Indent Line
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled=1
"" |¦┆┊
let g:indentLine_char="|"
let g:indentLine_color_term=239

"" Diff Two Directories
Plugin 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".svn,tags,*.pyc"

"" Vim CSV Transpose
Plugin 'salsifis/vim-transpose'

"" Status Line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

"" Add doxygen
Plugin 'vim-scripts/DoxygenToolkit.vim'

"" Add Header
Plugin 'alpertuna/vim-header'
let g:header_auto_add_header = 0
let g:header_field_author = 'Xianglan Piao'
let g:header_field_author_email = 'xianglan0502@gmail.com'
let g:header_field_timestamp_format = '%Y.%m.%d'

"" Syntax Highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'beyondmarc/hlsl.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'kbenzie/vim-spirv'
Plugin 'brgmnn/vim-opencl'
" autocmd FileType cpp,c source ~/.vim/syntax/vulkan1.0.vim

call vundle#end()
filetype plugin indent on
"" Vim Plugin End


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" other syntax, check /usr/share/vim/
augroup Filetype
  au!
  au BufRead,BufNewFile *.{ll,bc}                         set filetype=llvm
  au BufRead,BufNewFile *.cl                              set filetype=opencl
  au BufRead,BufNewFile *.{dat,data,csv}                  set filetype=csv
  au BufRead,BufNewFile *.{fx,vs,ps,hs,ds,cs}             set filetype=hlsl
  au BufRead,BufNewFile *.{vert,tese,tesc,geom,frag,comp} set filetype=glsl
  " au BufRead,BufNewFile *.git/COMMIT_EDITMSG              set fileencoding=utf-8
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Comment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let t:Comment="#"
let t:Uncomment="#"
let t:CommentEnd=''
let t:UncommentEnd=''
let t:textw=80
let t:Space=" "

augroup AutoComment
  au!
  au FileType c,cc,cpp,verilog,php,javascript,html,idl,opencl,cuda,css,hlsl,glsl
        \ let t:Comment='//'    |
        \ let t:Uncomment='\/\/'
  au FileType asm,sh,python,bash,ruby,perl
        \ let t:Comment='#'     |
        \ let t:Uncomment='#'
  au FileType tex,matlab
        \ let t:Comment='%'     |
        \ let t:Uncomment='%'
  au FileType bib
        \ let t:Comment='%'     |
        \ let t:Uncomment='%'   |
        \ let t:Space=""
  au FileType vim
        \ let t:Comment='"'     |
        \ let t:Uncomment='"'
  au FileType ini,llvm
        \ let t:Comment=';'     |
        \ let t:Uncomment=';'
augroup END


"" Google Coding Style Plugin Setup
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cuda,opencl,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END


"" Remove all trailing whitespace automatically
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
colorscheme molokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fencs=utf-8,euc-kr
set fileencoding=utf-8
"" Space
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set number
set visualbell
set cursorline
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
" set laststatus=2
" set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set title
set showcmd
set autoread
set wildmenu
set wildmode=longest:full,full
set nobomb
set nobackup
set noswapfile
set clipboard=unnamed,unnamedplus
set sol
set formatoptions-=cro


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tags
set tags+=./tags;$HOME

"" vimdiff
if &diff
  set diffopt-=internal
  set diffopt+=iwhite
endif

"" last edit location
au BufRead *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \    exe "norm g'\"" |
    \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping and Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent>    <Tab><Tab>  <C-w><C-w>
noremap <silent>    <leader>t :TagbarToggle<CR>
noremap <silent>    <leader>e :NERDTreeToggle<CR>
noremap <silent>    <leader>\ :call CommentToggle()<CR>
noremap <silent>    <leader>c :call CopyToggle()<CR>
noremap <silent>    <leader>/ :call BeautifulCommentToggle()<CR>

command! Trim   :%s/\s\+$//
command! Html   :call Html()
command! CSV    :call CSV()
command! Tab    :call Tab()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Tab()
    exe ':set expandtab'
    exe ':retab'
endfunction

function! Html()
    exe ':colorscheme molokai'
    " exe ':colorscheme github'
    exe ':runtime! /syntax/2html.vim'
endfunction

function! CSV()
    exe ':silent %!column -t'
endfunction

function! CommentToggle()
    if getline(".") =~ '^\s*'.t:Uncomment.t:Space
        exe ":norm ^".strlen(t:Comment.t:Space)."x"
    elseif getline(".") =~ '^\s*'.t:Uncomment.t:Uncomment
        " nothing
    elseif (strlen(getline(".")) > 0)
        exe ":norm^i".t:Comment.t:Space
    endif
endfunction

function! Syntax()
    exe ':syntax sync fromstart'
endfunction

function! CopyToggle()
    echo &mouse
    if &mouse == 'a'
        exe ':IndentLinesDisable'
        exe ':set nonu'
        exe ':set mouse='
    else
        exe ':IndentLinesEnable'
        exe ':set nu'
        exe ':set mouse=a'
    endif
endfunction

function! BeautifulCommentToggle()
    if getline(".") =~ '^\s*/\* .* \*/'
        exe ":norm ^xxx$xxx"
    elseif (strlen(getline(".")) > 0)
        exe ":norm^i/* "
        exe ":norm$a */"
    endif
endfunction
