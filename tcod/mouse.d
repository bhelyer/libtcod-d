/*
* libtcod 1.4.1
* Copyright (c) 2008,2009 J.C.Wilk
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * The name of J.C.Wilk may not be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY J.C.WILK ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL J.C.WILK BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

module tcod.mouse;

version (D_Version2) {
    import std.bitmanip;
}

extern (C):

/* mouse data */
struct TCOD_mouse_t {
  int x,y; /* absolute position */
  int dx,dy; /* movement since last update in pixels */
  int cx,cy; /* cell coordinates in the root console */
  int dcx,dcy; /* movement since last update in console cells */
    version (D_Version2) {
        mixin(bitfields!(
                  bool, "lbutton", 1,
                  bool, "rbutton", 1,
                  bool, "mbutton", 1,
                  bool, "lbutton_pressed", 1,
                  bool, "rbutton_pressed", 1,
                  bool, "mbutton_pressed", 1,
                  bool, "wheel_up", 1,
                  bool, "wheel_down", 1));
    } else {
        byte bitfield;
        bool lbutton() { return cast(bool)(bitfield & 0x01); }
        bool rbutton() { return cast(bool)(bitfield & 0x02); }
        bool mbutton() { return cast(bool)(bitfield & 0x04); }
        bool lbutton_pressed() { return cast(bool)(bitfield & 0x08); }
        bool rbutton_pressed() { return cast(bool)(bitfield & 0x10); }
        bool mbutton_pressed() { return cast(bool)(bitfield & 0x20); }
        bool wheel_up() { return cast(bool)(bitfield & 0x40); }
        bool wheel_down() { return cast(bool)(bitfield & 0x80); }
    }
} 

/* mouse support */
 TCOD_mouse_t TCOD_mouse_get_status();
 void TCOD_mouse_show_cursor(bool visible);
 bool TCOD_mouse_is_cursor_visible();
 void TCOD_mouse_move(int x, int y);

