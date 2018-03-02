" File: vimrc
" Author: Xianglan Piao <xianglan0502@gmail.com>
" Date: 2014.07.31
" Last Modified Date: 2017.08.01
" Last Modified By: Xianglan Piao <xianglan0502@gmail.com>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'gmarik/vundle'

"" Auto pairs {},()
Plugin 'jiangmiao/auto-pairs'

"" Multiple Selection
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" Autoformat
Plugin 'chiel92/vim-autoformat'

"" indent line
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled=1
"" | ¦ ┆ ┊ │
let g:indentLine_char="│"
let g:indentLine_color_term=239

"" File explorer
Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0

"" Tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_left=1

"" Diff two directories
Plugin 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".svn,tags,*.pyc"

"" vim CSV transpose
Plugin 'salsifis/vim-transpose'

"" vim easy align
Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" Status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

"" Syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'beyondmarc/hlsl.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'pangloss/vim-javascript'
Plugin 'kbenzie/vim-spirv'

"" Add doxygen
Plugin 'vim-scripts/DoxygenToolkit.vim'

"" Autocomplete
" if $OSTYPE == "linux-gnu"
	" Plugin 'Valloric/YouCompleteMe'
" endif

"" Add Header
" Plugin 'alpertuna/vim-header'
" let g:header_field_author = 'Xianglan Piao'
" let g:header_field_author_email = 'xianglan0502@gmail.com'
" let g:header_field_timestamp_format = '%Y.%m.%d'

call vundle#end()	" required
filetype plugin indent on	" required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Filetype
	au!
	au BufRead,BufNewFile *{Makefile,makefile}*     			set filetype=make
	au BufRead,BufNewFile *.{ll,bc}                				set filetype=llvm
	au BufRead,BufNewFile *.td                      			set filetype=tablegen
	au BufRead,BufNewFile *.rst                     			set filetype=rest
	au BufRead,BufNewFile *.html                    			set filetype=html
	au BufRead,BufNewFile *.tex                     			set filetype=tex
	au BufRead,BufNewFile *.md                   				set filetype=markdown
	au BufRead,BufNewFile *.m                      				set filetype=matlab
	au BufRead,BufNewFile *.{gnuplot,gp}            			set filetype=gnuplot
	au BufRead,BufNewFile config               					set filetype=config
	au BufRead,BufNewFile *.cu                      			set filetype=cuda
	au BufRead,BufNewFile *.cl                      			set filetype=opencl
	au BufRead,BufNewFile *.{dat,data,csv}          			set filetype=csv
	au BufRead,BufNewFile *.gdb                     			set filetype=gdb
	au BufRead,BufNewFile *.{fx,vs,ps,hs,ds,cs}    				set filetype=hlsl
	au BufRead,BufNewFile *.{vert,tese,tesc,geom,frag,comp}    	set filetype=glsl
	" au BufRead,BufNewFile *.git/COMMIT_EDITMSG      			set fileencoding=utf-8
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fencs=utf-8,euc-kr
set fileencoding=utf-8

"" Space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set number
set visualbell
set cursorline

"" Searching
set hlsearch		" highlight matched
set incsearch		" incremental searching
set ignorecase		" searches are case insensitive
set smartcase

set mouse=a
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

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
" set paste

" set autoindent
" set smartindent

syntax on

" vulkan highlight
autocmd FileType cpp,c source ~/.vim/syntax/vulkan1.0.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=./tags;$HOME

if &diff
	set diffopt+=iwhite
endif

au BufRead *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\    exe "norm g'\"" |
			\ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
if $OSTYPE == "linux-gnu"
	colorscheme monokai-soda
	let g:airline_theme='sol'
else
	colorscheme molokai
	" let g:molokia_original=1
	let g:airline_theme='term'

	hi SpecialKey       ctermfg=239
	hi Statement        ctermfg=161                     cterm=bold
	hi StatusLine       ctermfg=233     ctermbg=251     cterm=none
	hi StatusLineNC     ctermfg=242     ctermbg=232
	hi Visual                           ctermbg=238
	" hi Normal           ctermfg=15      ctermbg=none
	hi Normal           ctermfg=15      ctermbg=232
	hi Comment          ctermfg=244
	hi CursorLine                       ctermbg=236     cterm=none
	" hi CursorLine                       ctermbg=238     cterm=none
	" hi CursorLineNr     ctermfg=208                     cterm=none
	hi CursorLineNr     ctermfg=208     ctermbg=232     cterm=none
	hi LineNr           ctermfg=250     ctermbg=232
	hi NonText          ctermfg=250     ctermbg=232
endif


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
	au FileType c,cpp,verilog,php,javascript,html,idl,opencl,cu,css,hlsl,glsl
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping and Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map     <F8>        :set spell!<CR>
" let mapleader="`"
noremap  <silent> <Tab><Tab>	<C-w><C-w>
noremap  <silent> <leader>t		:TagbarToggle<CR>
noremap  <silent> <leader>e		:NERDTreeToggle<CR>
noremap  <silent> <leader>\		:call CommentToggle()<CR>
noremap  <silent> <leader>c		:call CopyToggle()<CR>
noremap  <silent> <leader>/		:call BeautifulCommentToggle()<CR>

command! Trim       :%s/\s\+$//
command! Html       :call Html()
command! CSV        :call CSV()
command! Tab        :call Tab()


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
