"{{ Windows 配置
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set guifont=Consolas:h11
if has('win32') || has('win64') 
  if (v:version == 704 && has("patch393")) || v:version > 704 
    set renderoptions=type:directx
    " ,level:0.50,\gamma:1.0,contrast:0.0,geom:1,renmode:5,taamode:1 
  end 
end 
"}}

"{{ 插件管理(安装vundle至bundle/vundle目录)
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-lua-ftplugin'
Plugin 'zeis/vim-kolor'
Plugin 'jremmen/vim-ripgrep'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'

" Plugin 'tpope/vim-fugitive'
" Plugin 'morhetz/gruvbox' " 配色方案
call vundle#end()            " required
filetype plugin indent on    " required
"}}

let g:mapleader = ","
set noundofile
set nobackup " 不产生临时文件
set nowritebackup
set noswapfile
set noswf
set tabstop=4
set softtabstop=4 " 编辑模式退格键回退长度4
set shiftwidth=4 " 缩进长度为4
set expandtab " 用空格缩进(noexpandtab则为tab缩进)
set nu " 显示行号
set autoindent " 开启自动缩进
set cindent	" 针对c语言自动缩进
set cursorline " 高亮当前行
set encoding=utf-8 " 设置编码
set fileformat=unix
set fileencodings=utf-8,chinese,latin-1
language messages zh_CN.utf-8 " 解决consle输出乱码
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936 " 设置文件编码检测类型及支持格式
set langmenu=zh_CN.utf-8 " 指定菜单语言
filetype plugin indent on
syntax on
set cot=menu " 隐藏Scratch预览(去处preview)

" Windows 使用 C-Y undo
unmap <C-Y>
" 使用 C-Tab 切换 tab
noremap <C-Tab> gt
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
" 允许不保存切换 Buffer
set hidden

" 粘贴来源设置为 0 号寄存器（只有复制的内容 y, x)
" x 剪切的内容放置到 0 号寄存器，可以供 p 使用
" noremap x "0x
" noremap p "0p
" noremap xx "0dd
" noremap xw "0dw

noremap <M-n> :cn<CR>
noremap <M-p> :cp<CR>

" 设置输入法切换，拼音输入法模式也能进入插入模式了 GUI 模式下可用
set noimcmdline
set iminsert=2
set imsearch=2

" 底行保留5行
set scrolloff=5

" Netrw 设置
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr> 

"{ Plugin 'scrooloose/nerdtree'
" NERDTree
" autocmd vimenter * NERDTree
map <silent> <leader>fe :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"}

"{{ C-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'max:10,results:55'
" 使用 git 的筛选
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = 'dir %s* /-n /b /s /a-d'  " Windows
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-from=.ctrlpignored']
"}}
"
"
"{{ Plugin 'morhetz/gruvbox'
colorscheme desert " 设置配色方案
"}}

"{{ Plugin 'Valloric/YouCompleteMe'
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_key_invoke_completion = '<c-k>'
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
"}}

" set path=.,/E:/work/wh_qmyl
" set includeexpr=substitute(v:fname,'\\.','/','g')
" set suffixesadd=.lua

" 菜单配置
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"隐藏菜单栏和工具栏，按F2显示
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <Bar>
            \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \endif<CR>

" :nnoremap <F5> :!ctags -R<CR>
set tags=./tags;,tags;
