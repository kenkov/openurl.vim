==============================
README
==============================

Summary
=======
This script enable you to open a url which is first one in the line in your
default browser.

Require
=======
You need a python interface.

Usage
=====
If there is a line such that

::

    http://aaa http://bbb

You use ':OpenUrl' command in this line, then you can open http://aaa in a default web browser.

I set a command for OpenUrl function, such that

::

    command OpenUrl :call OpenUrl()

You can change command name by changing above command name 'OpenUrl'.

::

    command AnotherOpenUrlName :call OpenUrl()
