set nocompatible              " be iMproved, required
filetype off                  " required

" install Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'tpope/vim-abolish'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-ctrlspace/vim-ctrlspace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"语法高亮
syntax on
"显示行号
set number
"设置忽略大小写
set ic
"设置高亮搜索
set hlsearch
"在搜索时，输入的词句的逐字符高亮
set incsearch
"显示状态栏
set laststatus=2
"命令行补全
set wildmode=full
set wildmenu

"按C语言格式缩进
set cindent
"设置Tab长度为4格
set tabstop=4
"设置自动缩进长度为4格
set shiftwidth=4
"继承前一行的缩进方式，特别适用于多行注释
set autoindent
"用space替代tab的输入
set expandtab
"设置退格模式
set backspace=2

"显示括号匹配
set showmatch
"括号匹配显示时间为1(单位是十分之一秒)
set matchtime=1

"显示行尾空格
set list
set listchars=tab:>-,trail:-

"显示90列参考线
set colorcolumn=90
hi ColorColumn ctermbg=darkgrey

" 状态栏
set statusline=
set statusline+=%<%f                                "File+path
set statusline+=%m%r%h                              "Modified? Readonly? Help?
set statusline+=[%{&ff}]                            "FileFormat (dos/unix..)
set statusline+=[%{''.(&fenc!=''?&fenc:&enc).''}]   "Encoding
set statusline+=%{FugitiveStatusline()}             "Git branch
set statusline+=%=%l/%L,%c%V                        "Row,Column
set laststatus=2

"DoxygenToolkit.vim插件参数
let g:DoxygenToolkit_authorName="Li Yunchong"

"HeaderGuard插件参数
function! g:HeaderguardName()
    return "AMI_" . toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g')) . "_"
endfunction

"NERDTree配置
let NERDTreeShowHidden=0
let NERDTreeAutoCenter=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeChDirMode=2

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_autoclose=0

let g:NERDTreeGitStatusShowIgnored=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "±",
    \ "Staged"    : "⌂",
    \ "Untracked" : "◊",
    \ "Renamed"   : "»",
    \ "Unmerged"  : "⸗",
    \ "Deleted"   : "×",
    \ "Dirty"     : "≠",
    \ "Clean"     : "√",
    \ "Ignored"   : "┄",
    \ "Unknown"   : "‽"
    \ }

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
