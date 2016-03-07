set encoding=utf-8
set notitle
set mouse=a
set shell=zsh
set ambiwidth=double
" ftplugin

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set clipboard=unnamed,autoselect
set backspace=start,eol,indent
set expandtab

" dir where plugins are installed
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"if &runtimepath !~# '/dein.vim'
"  if !isdirectory(s:dein_repo_dir)
"    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"  endif
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim


"endif

"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"set runtimepath+=$GOROOT/misc/vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
  \ 'build' : {
  \   'mac' : 'make -f make_mac.mak',
  \   'unix': 'gmake',
  \   },
  \ })


" plugin list (toml)
let s:toml      = '~/.vim/rc/dein.toml'
let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'

if dein#load_cache([expand('<sfile>'), s:toml, s:lazy_toml])
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#save_cache()
endif

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

let g:neocomplete#enable_smart_case = 1

if expand("%:t") =~ ",*\.rb"
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
endif

if expand("%:t") =~ ".*\.go"
  let g:neocomplete#enable_at_startup = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  set completeopt=menu
  au BufRead,BufNewFile,BufReadPre *.go  set filetype=go

endif

if expand("%:t") =~ ".*\.py"
	let g:neocomplete#enable_at_startup = 1
	"let g:jedi#popup_select_first = 0
	let g:jedi#completions_enabled = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#popup_on_dot = 1
	"autocmd FileType python let b:did_ftplugin = 1
endif

if expand("%:t") =~ ",*\.java"
  let g:neocomplete#enable_at_startup = 1
  "let g:neocomplete#enable_smart_case = 1
  let g:java_highlight_all = 1
  "let g:java_space_errors = 1
  let g:java_highlight_functions = 1
  setlocal omnifunc=javacomplete#Complete
endif

set completeopt=menu


if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

" 正直 '.' だけで良い
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.python = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.go = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplete#force_omni_input_patterns.java = '[^. *\t]\.\w*\|\h\w*::'


au BufRead,BufNewFile,BufReadPre *.coffee  set filetype=coffee
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!

" jedi.vim
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
"autocmd FileType python setl autoindent smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4


autocmd FileType java setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


autocmd Filetype coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab autoindent smartindent

"autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

"filetype plugin indent on

"colorscheme flattened_light
syntax enable
set background=dark
colorscheme PaperColor
set number

set nowritebackup
set nobackup
set noswapfile
