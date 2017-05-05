""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置语法高亮及色彩方案
set nu!
colorscheme torte 
syntax enable 
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用ctags函数跳转插件
" 使用方法：
" 0.将ec57w32下ctags.exe拷贝到安装路径xxx\Vim\vim80下；
" 1.安装路径xxx\Vim\vim80配置到path环境变量；
" 2.在需要打开的源代码目录下执行命令ctags -R；
" 3.打开源代码，ctr+点击或者是ctr+]跳转，ctr+t返回；
set tags=tags; 
set autochdir
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置字体及大小
set guifont=Consolas:h12
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用winmanager文件夹浏览器插件
" 使用方法：
" 0.将其中内容分别复制到安装路径xxx\Vim\vimfiles下的doc及plugin中
" 1.在vim normal模式下输入wm即可(如果有窗口弹出关闭即可)
let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置编码方式
:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,cp936
:set fileencoding=gb2312
:set termencoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 去掉工具栏菜单栏此类显示，如果需要显示，只需要将-改为+即可 
set guioptions-=T               " windows下隐藏工具栏 
set guioptions-=r               " 把gui右边的滑动条去掉 
set guioptions-=L               " 把gui左边的滑动条去掉 
set guioptions-=m               " 把gui的菜单栏去掉 
set shortmess=atI               " 启动的时候不显示援助索马里儿童的提示(是I而不是L) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动vim最大化 
autocmd GUIEnter * simalt ~x 
set gcr=a:block-blinkon0        " 去掉光标闪动 
set nobackup                    " 关闭自动备份功能,backup自动备份 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

