
set nocompatible              " be iMproved, required
filetype off                  " required
" 设置空格键为先导键
let mapleader="\<space>"
"=======================================================================
" 使用vim-plug管理插件
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-plug'
" " 为YouCompleteMe增加vim-plug的超时时间
" let g:plug_timeout=300
" Plug 'Valloric/YouCompleteMe',{'do':'./install.py'}
" Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
" Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'Chiel92/vim-autoformat'
" nnoremap <F6> :Autoformat<CR> " 自动地一键格式化代码
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" " Plug 'sillybun/autoformatpythonstatement' "python自动格式化代码功能，每次输入完一条语句，上一条语句就会自动的调用autopep8进行格式化
" autocmd FileType python let g:autoformatpython_enabled = 1
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'
"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_setColors = 0
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdcommenter'
"一键注释
map <F4> <leader>ci<CR> "不用使用:
Plug 'majutsushi/tagbar'
map <F3> :TagbarToggle<CR>
Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
"let g:repl_width = None                           "窗口宽度
"let g:repl_height = None                          "窗口高度
let g:sendtorepl_invoke_key = "<leader>e"          "传送代码快捷键，默认为<leader>w
let g:repl_position = 0                             "0表示出现在下方，1表示出现在上方，2在左边，3在右边
let g:repl_stayatrepl_when_open = 0         "打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
Plug 'tpope/vim-surround'
" 一开始默认不启用
" if !has('gui_running')
"     Plug 'brglng/vim-im-select'
" endif
" Plug 'neoclide/coc.nvim'
"---------------------------vim-dict------------------------------------
Plug 'skywind3000/vim-dict'
" Add additional dict folders
let g:vim_dict_dict = [
    \ '~/.vim/dict',
    \ '~/.config/nvim/dict',
    \ ]

" File type override
" let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text'}
" 让text词典在python里面显示
let g:vim_dict_config = {'html':'html,javascript,css', 'markdown':'text','python':'python,text'}

" Disable certain types
" let g:vim_dict_config = {'text': ''}

""---------------------------vim-auto-popmenu----------------------------
Plug 'skywind3000/vim-auto-popmenu'

" " enable this plugin for filetypes, '*' for all files.
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1,'python':1}

" enable this plugin for these files
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1,'c':1,'css':1,'python':1}
let g:apc_enable_ft = {'*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c
" disable certain filetypes in YouCompleteMe
let g:ycm_filetype_blacklist = {'text':1, 'markdown':1, 'php':1}
""-------------------------End of vim-auto-popmenu-----------------------

Plug 'vim-voom/VOoM'
" let g:voom_python_versions = [3]
if has('python3')
    silent! python3 1
    let g:voom_python_versions = [3,2]
endif
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'christoomey/vim-tmux-navigator'
" -----------------------------------------------------------------------
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
"-----------------------------------------------------------------------
Plug 'dracula/vim'
" if (has("termguicolors"))
"  set termguicolors
" endif
" syntax enable
" colorscheme dracula
"=======================================================================
Plug 'ryanoasis/vim-devicons'
" Add nord theme
" Plug 'arcticicestudio/nord-vim'
" let g:nord_bold = 0
" suda is a plugin to read or write files with sudo command.  This plugin was built while :w !sudo tee % > /dev/null trick does not work on neovim
Plug 'lambdalisue/suda.vim'
" A Vim / Neovim plugin to copy text to the system clipboard from anywhere using the ANSI OSC52 sequence.
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
vnoremap <leader>c :OSCYank<CR>
nmap <leader>o <Plug>OSCYank
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
" let g:oscyank_term = 'tmux'
Plug 'github/copilot.vim'
"----------------------------------------------------------------------
" Plug 'junegunn/goyo.vim',{'for':'markdown' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
let g:limelight_default_coefficient = 0.5 " 设置隐藏区域的黑暗度, 值越大越暗
let g:limelight_paragraph_span = 2 " 设置暗光的跨度, 暗光所能照亮的范围
let g:limelight_priority = -1 " 暗光优先级, 防止搜索的高亮效果被覆盖
"进入goyo模式后自动触发limelight,退出后则关闭
autocmd! User GoyoEnter Limelight " 进入 Goyo 专注插件时, 同时开启暗光效果
autocmd! User GoyoLeave Limelight! " 离开 Goyo 专注插件时, 同时退出暗光效果
nmap <Leader>l :Goyo<CR>
"----------------------------------------------------------------------
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly'  }
" This plugin provides a start screen for Vim and Neovim.
Plug 'mhinz/vim-startify'
" 添加vim输入法
Plug 'ZSaberLv0/ZFVimIM'
Plug 'ZSaberLv0/ZFVimJob' " 可选, 用于提升词库加载性能"
Plug 'ZSaberLv0/ZFVimIM_openapi'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit'  }
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-d': 'vsplit',
  \ 'ctrl-v': 'vsplit' }
" PLUGIN: FZF
" https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko#syntax
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-projectionist'
call plug#end()
"=======================================================================
" 原来的插件配置
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jiangmiao/auto-pairs'
"" Plugin 'neoclide/coc.nvim'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
"
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
"" Plugin 'https://github.com/Valloric/YouCompleteMe'
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
"

" 原来的配置
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

set tabstop=4
"Tab 键的宽度

set number
"显示行号




" 自动缩进
set cindent
set nocompatible
set bs=2
set smartindent
set ruler

if has('gui_running')
  set background=dark
  colorscheme solarized
else
"  colorscheme Zenburn
endif

" call togglebg#map("<F5>")


set clipboard=unnamed,unnamedplus


" " set directory=$HOME."/.config/nvim/swap//"
" set directory=$HOME."/.config/nvim/swap//"

" set undofile
" if !isdirectory($HOME."/.config/nvim/undodir")
" 		call mkdir($HOME."/.config/nvim/undodir","p")
" endif
" set undodir=$HOME."/.config/nvim/undodir"


"VIM 8 书本推荐配置
syntax on
" 支持语法高亮
filetype plugin indent on
" 启用根据文件类型自动缩进
set autoindent
" 开始新行时处理缩进
set expandtab
" 将制表符Tab展开为空格，这对于Python尤其有用
set tabstop=4
" 要计算的空格数
set shiftwidth=4
" 用于自动锁进的空格数
set backspace=2
" 在多数终端上修正退格键Backspace的行为
colorscheme murphy
" 修改配色theme


packloadall
"加载所有插件
silent! helptags ALL
" 为所有插件加载帮助文档


" 替代 esc
inoremap jj <Esc>`^



noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" 退出终端的插入模式
tnoremap jj <c-\><c-n>
" 折叠代码
set foldmethod=indent
"打开新文件时候不折叠
autocmd BufRead * normal zR

" Vim 启动时候打开NERDTree
" autocmd VimEnter * NERDTree 

" 启动NERDTree时显示书签
let NERDTreeShowBookmarks=1


" 避免NERDTree取代Netrw
let NERDTreeHijackNetrw=0

"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

"窗口大小"
let NERDTreeWinSize=25

" 高亮搜索结果
set hlsearch

" 动态显示搜索结果
set incsearch


"=======================================================================
" 设置先导键打开NERDTRee
noremap <leader>n :NERDTreeToggle<cr>

" 设置leader-w保存文件
noremap <leader>w :w<cr>

" 设置函数定义跳转
noremap <leader>] :YcmCompleter GoTo<cr>

" 在父目录中递归查找tags文件
" set tags=tags;

" 保存Python文件时重新生成标签文件
" autocmd BufWritePost *.py silent! !ctags -R &

" Use :UndotreeToggle to toggle the undo-tree panel.
nnoremap <F7> :UndotreeToggle<CR>

" 总是显示状态栏
set laststatus=2

"set rtp+=/Users/lecsven/opt/anaconda3/lib/python3.8/site-packages/powerline/bindings/vim
" 加载Powerline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" Redo with U instead of Ctrl+R
noremap U <C-R>

" 配置F8键运行IDE
map <F8> :call CompileRunGcc0()<CR>
 func! CompileRunGcc0()
         exec "w"
         if &filetype == 'c'
                 exec "!g++ % -o %<"
                 exec "!time ./%<"
         elseif &filetype == 'cpp'
                 exec "!g++ % -o %<"
                 exec "!time ./%<"
         elseif &filetype == 'java'
                 exec "!javac %"
                 exec "!time java %<"
         elseif &filetype == 'sh'
                 :!time bash %
         elseif &filetype == 'python'
                 exec "!clear"
                 exec "!time python3 %"
         elseif &filetype == 'html'
                 exec "!firefox % &"
         elseif &filetype == 'go'
                 " exec "!go build %<"
                 exec "!time go run %"
         elseif &filetype == 'mkd'
                 exec "!~/.vim/markdown.pl % > %.html &"
                 exec "!firefox %.html &"
         endif
 endfunc

" 用F5运行Python 
nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -raw python3 %"
                          exec "copen"
                          exec "wincmd p"
                  endif
          endif

endfunc

" Quickly edit/reload this configuration file
" nnoremap gev :e $MYVIMRC<CR>
nnoremap gev :tabe $MYVIMRC<CR>
nnoremap geev :tabe $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

if has("macunix")
    " echo "Mac OS"
    "let $Dropbox = "hello"
    let $Dropbox = "/Users/lecsven/Dropbox"
    "echo $Dropbox
    nnoremap gev :e $Dropbox/__useful_configs/Vim_configs/mac_current_vimrc.vim<CR>
endif

"设置鼠标滚动
set mouse=a


"关闭Vim的BELL声音
set noeb
set vb t_vb =

"把所有数字当作十进制
set nrformats=


"类似 zsh 提供的自动补全菜单
set wildmenu
set wildmode=full


nnoremap <leader>h :noh<return>

"设置命令行历史条数
set history=200

"show command status
set showcmd

" 自动展开为活动缓冲区所在目录的路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

"设置智能大小写敏感
set ignorecase
set smartcase

"Set Visual Star Search
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

"设置&替换:&&,保留搜索标志位，重复上次搜索
nnoremap & :&&<CR>
xnoremap & :&&<CR>

if executable('clipboard-provider')
  let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'clipboard-provider paste',
          \     },
          \ }
endif
" Press F12 to switch to GB18030 encoding
nnoremap <F4> :e ++enc=gb18030<CR>
" 添加Python路径
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.8'

hi MatchParen ctermbg=Red guibg=lightblue
" colorscheme dracula
augroup nord-overrides
  autocmd!
  " autocmd ColorScheme nord highlight Comment ctermfg=#576279 guifg=#576279
  " autocmd ColorScheme nord highlight Comment ctermfg=#576279 guifg=#576279
augroup END
" colorscheme nord
" colorscheme nightfly
" 高亮光标所在行
" set cursorline

filetype plugin on
" autocmd FileType ini setlocal commentstring=#\ %s
autocmd FileType ini set commentstring=#@@\ %s
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'ini': { 'left': '#'} }
" open file in right split
set splitright

nnoremap <leader>qa :qa<CR>
nnoremap <leader>qq :q<CR>
" Bring search results to midscreen
nnoremap n nzz
nnoremap N Nzz

"from  https://gist.github.com/ReggiePuksta/7d679276ec8420012368
" Color settings {{{

set t_Co=256
set background=light
set background=dark
let g:solarized_termcolors=256
" colorscheme solarized
highlight SignColumn ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight GitGutterAdd guibg=NONE
highlight GitGutterChange guibg=NONE
highlight GitGutterDelete guibg=NONE
highlight GitGutterChangeDelete guibg=NONE
" change scheme to better match solarized scheme
nnoremap <leader># :source $MYVIMRC<CR>:AirlineTheme lucius<cr>
let g:airline_theme='tomorrow'

" colorscheme tomorrow-night

" Higlighting
"*****************************************
set hlsearch            "'highlight search (very useful!)
set incsearch           " search incremently (search while typing)
set ignorecase          " Ignore case searching
set showcmd             " show command in bottom bar
set cursorline          " highlight current line"
" Change cursor line number color
" hi CursorLineNr   term=bold ctermfg=grey gui=bold guifg=Yellow
" hi CursorLine   ctermbg=254 gui=bold guifg=Yellow

" Make vertical split thinner
hi vertsplit ctermfg=109 ctermbg=NONE
" Resize vim automatically when terminal is resized
au VimResized * exe "normal! \<c-w>="

" }}}
"from  https://gist.github.com/ReggiePuksta/7d679276ec8420012368

" " If you have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" function! s:myLocalDb()
"     let db = ZFVimIM_dbInit({
"                 \   'name' : 'YourDb',
"                 \ })
"     call ZFVimIM_cloudRegister({
"                 \   'mode' : 'local',
"                 \   'dbId' : db['dbId'],
"                 \   'repoPath' : '/path/to/repo', " 词库路径
"                 \   'dbFile' : '/YourDbFile', " 词库文件, 相对 repoPath 的路径
"                 \   'dbCountFile' : '/YourDbCountFile', " 非必须, 词频文件, 相对 repoPath 的路径
"                 \ })
" endfunction
" autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()

" 显示文件中的Tab字符
set list listchars=tab:>-,trail:-
" set nolist

" set noexpandtab
" set softtabstop=4
" set remap for copilot 
" to set ctrl + t to accept the suggestion
imap <silent><script><expr> <C-t> copilot#Accept("<Nop>")
let g:copilot_no_tab_map = v:true



