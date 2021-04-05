set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add your plugins to this place 在这里添加你的插件
" 显示括号颜色
"Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdtree'
Plugin 'whatyouhide/vim-gotham'
Plugin 'VundleVim/YouCompleteMe'
"markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


"leetcode
Plugin 'ianding1/leetcode.vim'
" 在这行前添加你的插件
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" 以下是常用命令
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" 在该行后添加自己的配置信息
set nu
set hlsearch

colorscheme peachpuff
set guifont=Courier\ New:h10  " 字体 && 字号
set expandtab                " 设置tab键换空格
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
set showmatch               " 显示括号配对情况
"set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
"set cursorline              " 突出显示当前行
hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
set hidden                   " 允许在有未保存的修改时切换缓冲区


filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set writebackup              " 设置无备份文件
set nobackup
set autochdir                " 设定文件浏览器目录为当前目录
set nowrap                  " 设置不自动换行
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠

set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2


" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
" 解决consle输出乱码

au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

"目录树
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"配色
"colorscheme gotham256

"解决No .ycm_extra_conf.py问题
let g:ycm_global_ycm_extra_conf='/home/mygit/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"设置leetcode
let  g:leetcode_browser='firefox'
let  g:leetcode_china = 1
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>


"配置python
func SetTitle()
call setline(1, "\#!/usr/bin/python")
call setline(2, "\# -*- coding=utf8 -*-")
call setline(3, "\"\"\"")
call setline(4, "\# @Author : wangjun")
call setline(5, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
call setline(6, "\# @Description : ")
call setline(7, "\"\"\"")
normal G
normal o
normal o
normal i
endfunc
autocmd bufnewfile *.py call SetTitle()


"配置
func SetCpp()
call setline(1, "/**")
call setline(2, "\# @Author : wangjun")
call setline(3, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
call setline(4, "\# @Description : ")
call setline(5, "**/")
call setline(6, " ")
call setline(7, "#include <iostream>")
call setline(8, "using namespace std;")
call setline(9, "")
call setline(10, "int main(){")
call setline(11, "     ")
call setline(12, "    return 0;")
call setline(13, "}")
normal 11G
normal 4l
normal i 
endfunc
autocmd bufnewfile *.cpp call SetCpp()
