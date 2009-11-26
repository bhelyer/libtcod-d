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

module tcod.console;

version (D_Version2) {
    import std.bitmanip;
}
import tcod.base;
import tcod.color;

extern (C):

alias int TCOD_keycode_t;
enum : TCOD_keycode_t {
        TCODK_NONE,
        TCODK_ESCAPE,
        TCODK_BACKSPACE,
        TCODK_TAB,
        TCODK_ENTER,
        TCODK_SHIFT,
        TCODK_CONTROL,
        TCODK_ALT,
        TCODK_PAUSE,
        TCODK_CAPSLOCK,
        TCODK_PAGEUP,
        TCODK_PAGEDOWN,
        TCODK_END,
        TCODK_HOME,
        TCODK_UP,
        TCODK_LEFT,
        TCODK_RIGHT,
        TCODK_DOWN,
        TCODK_PRINTSCREEN,
        TCODK_INSERT,
        TCODK_DELETE,
        TCODK_LWIN,
        TCODK_RWIN,
        TCODK_APPS,
        TCODK_0,
        TCODK_1,
        TCODK_2,
        TCODK_3,
        TCODK_4,
        TCODK_5,
        TCODK_6,
        TCODK_7,
        TCODK_8,
        TCODK_9,
        TCODK_KP0,
        TCODK_KP1,
        TCODK_KP2,
        TCODK_KP3,
        TCODK_KP4,
        TCODK_KP5,
        TCODK_KP6,
        TCODK_KP7,
        TCODK_KP8,
        TCODK_KP9,
        TCODK_KPADD,
        TCODK_KPSUB,
        TCODK_KPDIV,
        TCODK_KPMUL,
        TCODK_KPDEC,
        TCODK_KPENTER,
        TCODK_F1,
        TCODK_F2,
        TCODK_F3,
        TCODK_F4,
        TCODK_F5,
        TCODK_F6,
        TCODK_F7,
        TCODK_F8,
        TCODK_F9,
        TCODK_F10,
        TCODK_F11,
        TCODK_F12,
        TCODK_NUMLOCK,
        TCODK_SCROLLLOCK,
        TCODK_SPACE,
        TCODK_CHAR
}

/* key data : special code or character */
struct TCOD_key_t {
        TCOD_keycode_t vk; /*  key code */
        char c; /* character if vk == TCODK_CHAR else 0 */

    version (D_Version2) {
        mixin(bitfields!(
                  bool, "pressed", 1,
                  bool, "lalt", 1, /* does this correspond to a key press or key release event? */
                  bool, "lctrl", 1,
                  bool, "ralt", 1,
                  bool, "rctrl", 1,
                  bool, "shift", 1,
                  uint, "padding", 2));
    } else {
        byte bitfield;
        bool pressed() { return cast(bool)(bitfield & 0x01); }
        bool lalt() { return cast(bool)(bitfield & 0x02); }
        bool lctrl() { return cast(bool)(bitfield & 0x04); }
        bool ralt() { return cast(bool)(bitfield & 0x08); }
        bool rctrl() { return cast(bool)(bitfield & 0x10); }
        bool shift() { return cast(bool)(bitfield & 0x20); }
    }
}

enum {
        // single walls
        TCOD_CHAR_HLINE=196,
        TCOD_CHAR_VLINE=179,
        TCOD_CHAR_NE=191,
        TCOD_CHAR_NW=218,
        TCOD_CHAR_SE=217,
        TCOD_CHAR_SW=192,
        TCOD_CHAR_TEEW=180,
        TCOD_CHAR_TEEE=195,
        TCOD_CHAR_TEEN=193,
        TCOD_CHAR_TEES=194,
        TCOD_CHAR_CROSS=197,
        // double walls
        TCOD_CHAR_DHLINE=205,
        TCOD_CHAR_DVLINE=186,
        TCOD_CHAR_DNE=187,
        TCOD_CHAR_DNW=201,
        TCOD_CHAR_DSE=188,
        TCOD_CHAR_DSW=200,
        TCOD_CHAR_DTEEW=185,
        TCOD_CHAR_DTEEE=204,
        TCOD_CHAR_DTEEN=202,
        TCOD_CHAR_DTEES=203,
        TCOD_CHAR_DCROSS=206,
        // blocks
        TCOD_CHAR_BLOCK1=176,
        TCOD_CHAR_BLOCK2=177,
        TCOD_CHAR_BLOCK3=178,
        // arrows
        TCOD_CHAR_ARROW_N=24,
        TCOD_CHAR_ARROW_S=25,
        TCOD_CHAR_ARROW_E=26,
        TCOD_CHAR_ARROW_W=27,
        // arrows without tail
        TCOD_CHAR_ARROW2_N=30,
        TCOD_CHAR_ARROW2_S=31,
        TCOD_CHAR_ARROW2_E=16,
        TCOD_CHAR_ARROW2_W=17,
        // double arrows
        TCOD_CHAR_DARROW_H=29,
        TCOD_CHAR_DARROW_V=18,
        // GUI stuff
        TCOD_CHAR_CHECKBOX_UNSET=224,
        TCOD_CHAR_CHECKBOX_SET=225,
        TCOD_CHAR_RADIO_UNSET=9,
        TCOD_CHAR_RADIO_SET=10,
        // sub-pixel resolution kit
        TCOD_CHAR_SUBP_NW=226,
        TCOD_CHAR_SUBP_NE=227,
        TCOD_CHAR_SUBP_N=228,
        TCOD_CHAR_SUBP_SE=229,
        TCOD_CHAR_SUBP_DIAG=230,
        TCOD_CHAR_SUBP_E=231,
        TCOD_CHAR_SUBP_SW=232,
};

alias int TCOD_colctrl_t;
enum : TCOD_colctrl_t {
        TCOD_COLCTRL_1 = 1,
        TCOD_COLCTRL_2,
        TCOD_COLCTRL_3,
        TCOD_COLCTRL_4,
        TCOD_COLCTRL_5,
        TCOD_COLCTRL_NUMBER=5,
        TCOD_COLCTRL_FORE_RGB,
        TCOD_COLCTRL_BACK_RGB,
        TCOD_COLCTRL_STOP
}

alias int TCOD_bkgnd_flag_t;
enum : TCOD_bkgnd_flag_t {
        TCOD_BKGND_NONE,
        TCOD_BKGND_SET,
        TCOD_BKGND_MULTIPLY,
        TCOD_BKGND_LIGHTEN,
        TCOD_BKGND_DARKEN,
        TCOD_BKGND_SCREEN,
        TCOD_BKGND_COLOR_DODGE,
        TCOD_BKGND_COLOR_BURN,
        TCOD_BKGND_ADD,
        TCOD_BKGND_ADDA,
        TCOD_BKGND_BURN,
        TCOD_BKGND_OVERLAY,
        TCOD_BKGND_ALPH
}

version (D_Version2) {
    mixin("
    pure TCOD_bkgnd_flag_t TCOD_BKGND_ALPHA(T)(T alpha)
    {
        return (TCOD_BKGND_ALPH | (cast(ubyte)(alpha * 255) << 8));
    }
    
    pure TCOD_bkgnd_flag_t TCOD_BKGND_ADDALPHA(T)(T alpha)
    {
        return (TCOD_BKGND_ADDA | (cast(ubyte)(alpha * 255) << 8));
    }
    ");
} else {
    TCOD_bkgnd_flag_t TCOD_BKGND_ALPHA(T)(T alpha)
    {
        return (TCOD_BKGND_ALPH | (cast(ubyte)(alpha * 255) << 8));
    }
    
    TCOD_bkgnd_flag_t TCOD_BKGND_ADDALPHA(T)(T alpha)
    {
        return (TCOD_BKGND_ADDA | (cast(ubyte)(alpha * 255) << 8));
    }
}

enum {
        TCOD_KEY_PRESSED=1,
        TCOD_KEY_RELEASED=2,
};

// custom font flags
enum {
        TCOD_FONT_LAYOUT_ASCII_INCOL=1,
        TCOD_FONT_LAYOUT_ASCII_INROW=2,
        TCOD_FONT_TYPE_GREYSCALE=4,
        TCOD_FONT_TYPE_GRAYSCALE=4,
        TCOD_FONT_LAYOUT_TCOD=8,
};

alias void* TCOD_console_t;

void TCOD_console_init_root(int w, int h,  charptr  title, bool fullscreen);
void TCOD_console_set_window_title( charptr title);
 void TCOD_console_set_fullscreen(bool fullscreen);
 bool TCOD_console_is_fullscreen();
 bool TCOD_console_is_window_closed();

void TCOD_console_set_custom_font( charptr fontFile, int flags,int nb_char_horiz, int nb_char_vertic);
 void TCOD_console_map_ascii_code_to_font(int asciiCode, int fontCharX, int fontCharY);
 void TCOD_console_map_ascii_codes_to_font(int asciiCode, int nbCodes, int fontCharX, int fontCharY);
void TCOD_console_map_string_to_font( charptr s, int fontCharX, int fontCharY);

 void TCOD_console_set_background_color(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_set_foreground_color(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_clear(TCOD_console_t con);
 void TCOD_console_set_back(TCOD_console_t con,int x, int y, TCOD_color_t col, TCOD_bkgnd_flag_t flag);
 void TCOD_console_set_fore(TCOD_console_t con,int x, int y, TCOD_color_t col);
 void TCOD_console_set_char(TCOD_console_t con,int x, int y, int c);
 void TCOD_console_put_char(TCOD_console_t con,int x, int y, int c, TCOD_bkgnd_flag_t flag);

void TCOD_console_print_left(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
void TCOD_console_print_right(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
void TCOD_console_print_center(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
 int TCOD_console_print_left_rect(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
 int TCOD_console_print_right_rect(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
 int TCOD_console_print_center_rect(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag,  charptr fmt, ...);
 int TCOD_console_height_left_rect(TCOD_console_t con,int x, int y, int w, int h,  charptr fmt, ...);
 int TCOD_console_height_right_rect(TCOD_console_t con,int x, int y, int w, int h,  charptr fmt, ...);
 int TCOD_console_height_center_rect(TCOD_console_t con,int x, int y, int w, int h,  charptr fmt, ...);

 void TCOD_console_rect(TCOD_console_t con,int x, int y, int w, int h, bool clear, TCOD_bkgnd_flag_t flag);
 void TCOD_console_hline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
 void TCOD_console_vline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
 void TCOD_console_print_frame(TCOD_console_t con,int x,int y,int w,int h, bool empty,  charptr fmt, ...);

 TCOD_color_t TCOD_console_get_background_color(TCOD_console_t con);
 TCOD_color_t TCOD_console_get_foreground_color(TCOD_console_t con);
 TCOD_color_t TCOD_console_get_back(TCOD_console_t con,int x, int y);
 TCOD_color_t TCOD_console_get_fore(TCOD_console_t con,int x, int y);
 int TCOD_console_get_char(TCOD_console_t con,int x, int y);

 void TCOD_console_set_fade(ubyte val, TCOD_color_t fade);
 ubyte TCOD_console_get_fade();
 TCOD_color_t TCOD_console_get_fading_color();

 void TCOD_console_flush();

 void TCOD_console_set_color_control(TCOD_colctrl_t con, TCOD_color_t fore, TCOD_color_t back);

 TCOD_key_t TCOD_console_check_for_keypress(int flags);
 TCOD_key_t TCOD_console_wait_for_keypress(bool flush);
 void TCOD_console_set_keyboard_repeat(int initial_delay, int interval);
 void TCOD_console_disable_keyboard_repeat();
 bool TCOD_console_is_key_pressed(TCOD_keycode_t key);

 TCOD_console_t TCOD_console_new(int w, int h);
 int TCOD_console_get_width(TCOD_console_t con);
 int TCOD_console_get_height(TCOD_console_t con);
 void TCOD_console_set_key_color(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_blit(TCOD_console_t src,int xSrc, int ySrc, int wSrc,
                        int hSrc, TCOD_console_t dst, int xDst, int yDst,
                        float foreground_alpha, float background_alpha);
 void TCOD_console_delete(TCOD_console_t console);


 void TCOD_console_credits();
 bool TCOD_console_credits_render(int x, int y, bool alpha);

