Goals and aim
-------------
AdaWM aims to be a well thought out and simple tiling window manager for Linux.
It owes a large part of it's design to the magnificent window manager i3.

Planned features
----------------
* Scriptability using Python
* Good handling of multi monitor set-ups using RandR or Xinerama
* Containers implemented as a tree data structure
* Easily readable and well thought out code

Requirements
------------
To compile AdaWM you need

* An Ada compiler
* The GNATCOLL toolkit (Used for scripting and commandline parsing)
* The X Ada binding, xab

Architecture
------------
* AdaWM aims to be simple, with well thought out data structures, simple flow
  of operation and readable code
* Scriptability is provided by the proven GNATCOLL library

Roadmap
-------
* Further finishing and polishing the code
* Scripting
* Produce secondary tools to have an IPC client, bar etc.

Todo/Bugs
---------
* Most of the basic window manager code still needs work, as of now it doesn't
  actually manage any windows
* The scripting needs to be worked out
* RandR is currently bypassed and faked by using a screen as large as the
  outputs combined, it should be properly implemented
* Xinerama is not implemented at all, but this is low priority
