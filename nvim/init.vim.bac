set encoding=utf-8
set nocompatible
set notitle
set mouse=a
set shell=zsh

" ftplugin

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set clipboard=unnamedplus
set backspace=start,eol,indent
set expandtab



"if has('nvim_starting')
set runtimepath+=$HOME/.config/nvim/bundle/neobundle.vim/
"endif


call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/syntastic'

"NeoBundle 'Shougo/echodoc', '', 'default'

" call neobundle#config('echodoc', {
"      \ 'lazy' : 1,
"      \ 'autoload' : {
"      \ 'insert' : 1,
"      \ }})
"NeoBundle 'osyo-manga/vim-monster'
"NeoBundle 'kchmck/vim-coffee-script'
"NeoBundle 'fatih/vim-go'
"NeoBundle 'derekwyatt/vim-scala'
"NeoBundle 'vim-scripts/javacomplete'

NeoBundle 'Shougo/vimproc', {
     \ 'build' : {
     \     'mac' : 'make -f make_mac.mak',
     \     'unix' : 'make -f make_unix.mak',
     \    },
     \ }

" rubyにてendを自動挿入
NeoBundle 'tpope/vim-endwise'

"コメントon/offを手軽に実行(visualモード shiftで選択 -> ctrl+_を2回)
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'Shougo/deoplete.nvim'

call neobundle#end()

NeoBundleCheck



let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 2

let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'
let g:python_host_prog = expand('$HOME') . '/.pyenv/shims/python'


filetype plugin indent on


if expand("%:t") =~ ".*\.py"

  let g:jedi#completions_enabled = 1
  let g:jedi#auto_vim_configulation = 0
  "let g:jedi#smart_auto_mappings = 0
  let g:jedi#popup_on_dot = 1
  "let g:jedi#show_call_signatures = 0
  let g:syntastic_python_checkers = ['pyflakes']
  let g:jedi#force_py_version = 3

endif

set completeopt=menu

if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif

"let g:deoplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:deoplete#omni_patterns.python = '[^. *\t]\.\w*\|\h\w*::'
"let g:deoplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


autocmd FileType python setl omnifunc=jedi#completions
autocmd FileType python setl completeopt-=preview

autocmd Filetype coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab autoindent smartindent

"set cmdheight=2
"let g:echodoc_enable_at_startup = 1
"set pumheight=15


syntax enable
set background=dark
colorscheme PaperColor
set number

set nowritebackup
set nobackup
set noswapfile
