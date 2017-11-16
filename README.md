*NOTE*: This repository is unmaintained. You should use [jaydg's fork](https://github.com/jaydg/libtcod-d) instead!

---

----------------------------------------
           libtcod-d 1.5.0-1
----------------------------------------

libtcod-d is a set of bindings for using the excellent 
libtcod ( http://doryen.eptalys.net/libtcod/ ) in the D programming language.

The DLL (libtcod.so on Linux, libtcod.dll on Windows) is dynamically loaded
on start up, not linked at compile time. Note that this means that on Linux
you must link with libdl by adding -ldl to your linking command to ensure
that your program runs.

It searches for libtcod_debug.so, and if it can't find that, then libtcod.so
on the current path (or dlls if on Windows). The current release build of
libtcod.so 1.5.0 is lacking the TCOD_text functions, and will fail on
attempting to load those functions. If you need to use a release build before
libtcod.so is fixed, remove the asserts for the libtcod_text functions.

The DMD 1 and 2 are supported, using Phobos. This means Tango/LDC is as of
yet unsupported. I am working on it, however!
GDC is not supported, and won't work due to the age of the FE.

ATTENTION: There is a bug that occurs when using D2 versions on some
systems that means any attempt to use the library will result in a
segfaulting executable. I'm looking into it.
---
One and a half years later, I've picked this up again after simendsjo
fixed some errors when compiling with the latest DMD. The samples_d is 
still segfaulting. And it only gets that far with libtcod_debug.so, as
the libtcod_text_* functions are only present there.
Furthermore, 1.5.1 has been in limbo for a long time. I am continuing to
work on this when I can, but there are a lot of issues to work through.
-Bernard 29/1/12.
---

To try the sample, run make -f makefile-d-sample on Linux, or run 
build_sample.bat on Windows.

The bindings are a strict port of the C API, so refer to libtcod 
documentation for more details. If I can get motivated, an object
wrapper that would be similar to the C++ API may be forthcoming, so watch
this space.

For comments and complaints, use the issue system on GitHub.
or email me at b (dot) helyer (at) gmail (dot) com.

=========================
Developing with libtcod-d
=========================

The libtcod-d code is maintained in a Git repository at github.org.
If you are also using Git for your own project, you should consider
using "git submodule" to add the libtcod-d repository as submodule
under your project. If you have experience with svn externals, git 
submodules are a similar feature.
 
Git submodules allow your repository to point at a single, static point
in a separate repository as a child element. This avoids having to 
copy the code into your repo, etc.

Git submodules use a frozen point - not "HEAD" or any of the branch 
heads - so that you can develop against a stable background. If you
want to update the submodule to a later version of its own code, you 
have to do that explicitly. This keeps your environment stable until
you ask for it to change.

Of course, the best reason for using submodules is that you can clone
the libtcod-d repository on github (or somewhere else), point your 
submodule at your clone, and make updates to the libtcod-d sources
within the submodule directory. Then you can contribute to libtcod-d
by pushing your changes back upstream. :)
