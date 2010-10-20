module simple;

import tcod.c.all;


void main()
{
    TCOD_console_init_root(80, 50, "Hello, world.", false);
    
    while(!TCOD_console_is_window_closed()) {
        TCOD_console_print_left(null, 0, 0, TCOD_BKGND_NONE, "Hello, world.");
        TCOD_console_flush();
        auto k = TCOD_console_check_for_keypress(TCOD_KEY_PRESSED);
    }
}

