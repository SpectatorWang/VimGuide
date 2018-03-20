"{{ Windows ����
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

"{{ �������(��װvundle��bundle/vundleĿ¼)
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
" Plugin 'morhetz/gruvbox' " ��ɫ����
call vundle#end()            " required
filetype plugin indent on    " required
"}}

let g:mapleader = ","
set noundofile
set nobackup " ��������ʱ�ļ�
set nowritebackup
set noswapfile
set noswf
set tabstop=4
set softtabstop=4 " �༭ģʽ�˸�����˳���4
set shiftwidth=4 " ��������Ϊ4
set expandtab " �ÿո�����(noexpandtab��Ϊtab����)
set nu " ��ʾ�к�
set autoindent " �����Զ�����
set cindent	" ���c�����Զ�����
set cursorline " ������ǰ��
set encoding=utf-8 " ���ñ���
set fileformat=unix
set fileencodings=utf-8,chinese,latin-1
language messages zh_CN.utf-8 " ���consle�������
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936 " �����ļ����������ͼ�֧�ָ�ʽ
set langmenu=zh_CN.utf-8 " ָ���˵�����
filetype plugin indent on
syntax on
set cot=menu " ����ScratchԤ��(ȥ��preview)

" Windows ʹ�� C-Y undo
unmap <C-Y>
" ʹ�� C-Tab �л� tab
noremap <C-Tab> gt
" ʹ������ tab ��ʽ������ gui
set guioptions-=e
set nolist
" ���������л� Buffer
set hidden

" ճ����Դ����Ϊ 0 �żĴ�����ֻ�и��Ƶ����� y, x)
" x ���е����ݷ��õ� 0 �żĴ��������Թ� p ʹ��
" noremap x "0x
" noremap p "0p
" noremap xx "0dd
" noremap xw "0dw

noremap <M-n> :cn<CR>
noremap <M-p> :cp<CR>

" �������뷨�л���ƴ�����뷨ģʽҲ�ܽ������ģʽ�� GUI ģʽ�¿���
set noimcmdline
set iminsert=2
set imsearch=2

" ���б���5��
set scrolloff=5

" Netrw ����
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
" ʹ�� git ��ɸѡ
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = 'dir %s* /-n /b /s /a-d'  " Windows
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-from=.ctrlpignored']
"}}
"
"
"{{ Plugin 'morhetz/gruvbox'
colorscheme desert " ������ɫ����
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

" �˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���ز˵����͹���������F2��ʾ
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
