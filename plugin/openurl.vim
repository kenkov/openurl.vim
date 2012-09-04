" copyright and license
" ==============================
"
" Copyright (c) 2010-2012 Noriyuki ABE
"
" Permission is hereby granted, free of charge, to any person obtaining a copy of
" this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation the rights to use,
" copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
" and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
" INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
" WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
" Summary
" =======
" This script enable you to open a url which is first one in the line in your
" default browser.
"
" Require
" =======
" You need a python interface.
"
" Usage
" =====
" If there is a line such that
"
" Sample line. http://aaa http://bbb
"
" You use ':OpenUrl' command in this line, 
" then you can open http://aaa in a default web browser.
"
" I set a command for OpenUrl function, such that
"
" command OpenUrl :call OpenUrl()
"
" You can change command name by changing above command name 'OpenUrl'.
"
" example)
" command AnotherOpenUrlName :call OpenUrl()
"

" define OpenUrl function
function! s:OpenUrl()
python << EOM
# coding:utf-8

import vim
import re
import webbrowser

re_obj = re.compile(r'(http|https)://[a-zA-Z0-9-./"#$%&\':?=_]+')
#re_obj = re.compile(r'(http|https|ftp|ftps)://[a-zA-Z0-9-./"#$%&\':?=_]+')
line = vim.current.line
match_obj = re_obj.search(line)

try:
    url = match_obj.group()
    webbrowser.open(url)
    print 'open URL : %s' % url
except:
    print 'fialed! : open URL'

EOM
endfunction

nnoremap <unique> <Plug>OpenUrl <SID>OpenUlr()
" set a command for OpenUrl function
command OpenUrl :call <SID>OpenUrl()
