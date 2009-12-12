module tcod.types;

version (D_Version2) {
    import std.bitmanip;
}

import tcod.base;

extern (C):

// --- List ---
alias void* TCOD_list_t;


// --- Colour ---
struct TCOD_color_t {
	ubyte r,g,b;
} 

const int TCOD_COLOR_NB = 12;
const int TCOD_COLOR_LEVELS = 6;

// color names
enum {
	TCOD_COLOR_RED,
	TCOD_COLOR_ORANGE,
	TCOD_COLOR_YELLOW,
	TCOD_COLOR_CHARTREUSE,
	TCOD_COLOR_GREEN,
	TCOD_COLOR_SEA,
	TCOD_COLOR_CYAN,
	TCOD_COLOR_SKY,
	TCOD_COLOR_BLUE,
	TCOD_COLOR_VIOLET,
	TCOD_COLOR_MAGENTA,
	TCOD_COLOR_PINK,
};

// color levels
enum {
	TCOD_COLOR_DESATURATED,
	TCOD_COLOR_LIGHT,
	TCOD_COLOR_NORMAL,
	TCOD_COLOR_DARK,
	TCOD_COLOR_DARKER,
};

// color array
  const TCOD_color_t  TCOD_colors[TCOD_COLOR_NB][TCOD_COLOR_LEVELS];

// grey levels
  const TCOD_color_t TCOD_black = TCOD_color_t(0, 0, 0);
  const TCOD_color_t TCOD_darker_grey = TCOD_color_t(31, 31, 31);
  const TCOD_color_t TCOD_dark_grey = TCOD_color_t(63, 63, 63);
  const TCOD_color_t TCOD_grey = TCOD_color_t(128, 128, 128);
  const TCOD_color_t TCOD_light_grey = TCOD_color_t(191, 191, 191);
  const TCOD_color_t TCOD_white = TCOD_color_t(255, 255, 255);

// standard colors
  const TCOD_color_t TCOD_red = TCOD_color_t(255, 0, 0);
  const TCOD_color_t TCOD_orange = TCOD_color_t(255, 127, 0);
  const TCOD_color_t TCOD_yellow = TCOD_color_t(255, 255, 0);
  const TCOD_color_t TCOD_chartreuse = TCOD_color_t(127, 255, 0);
  const TCOD_color_t TCOD_green = TCOD_color_t(0, 255, 0);
  const TCOD_color_t TCOD_sea = TCOD_color_t(0, 255, 127);
  const TCOD_color_t TCOD_cyan = TCOD_color_t(0, 255, 255);
  const TCOD_color_t TCOD_sky = TCOD_color_t(0, 127, 255);
  const TCOD_color_t TCOD_blue = TCOD_color_t(0, 0, 255);
  const TCOD_color_t TCOD_violet = TCOD_color_t(127, 0, 255);
  const TCOD_color_t TCOD_magenta = TCOD_color_t(255, 0, 255);
  const TCOD_color_t TCOD_pink = TCOD_color_t(255, 0, 127);

// dark colors
  const TCOD_color_t TCOD_dark_red = TCOD_color_t(127, 0, 0);
  const TCOD_color_t TCOD_dark_orange = TCOD_color_t(127, 63, 0);
  const TCOD_color_t TCOD_dark_yellow = TCOD_color_t(127, 127, 0);
  const TCOD_color_t TCOD_dark_chartreuse = TCOD_color_t(63, 127, 0);
  const TCOD_color_t TCOD_dark_green = TCOD_color_t(0, 127, 0);
  const TCOD_color_t TCOD_dark_sea = TCOD_color_t(0, 127, 63);
  const TCOD_color_t TCOD_dark_cyan = TCOD_color_t(0, 127, 127);
  const TCOD_color_t TCOD_dark_sky = TCOD_color_t(0, 63, 127);
  const TCOD_color_t TCOD_dark_blue = TCOD_color_t(0, 0, 127);
  const TCOD_color_t TCOD_dark_violet = TCOD_color_t(63, 0, 127);
  const TCOD_color_t TCOD_dark_magenta = TCOD_color_t(127, 0, 127);
  const TCOD_color_t TCOD_dark_pink = TCOD_color_t(127, 0, 63);

// darker colors
  const TCOD_color_t TCOD_darker_red = TCOD_color_t(63, 0, 0);
  const TCOD_color_t TCOD_darker_orange = TCOD_color_t(63, 31, 0);
  const TCOD_color_t TCOD_darker_yellow = TCOD_color_t(63, 63, 0);
  const TCOD_color_t TCOD_darker_chartreuse = TCOD_color_t(31, 63, 0);
  const TCOD_color_t TCOD_darker_green = TCOD_color_t(0, 63, 0);
  const TCOD_color_t TCOD_darker_sea = TCOD_color_t(0, 63, 31);
  const TCOD_color_t TCOD_darker_cyan = TCOD_color_t(0, 63, 63);
  const TCOD_color_t TCOD_darker_sky = TCOD_color_t(0, 31, 63);
  const TCOD_color_t TCOD_darker_blue = TCOD_color_t(0, 0, 63);
  const TCOD_color_t TCOD_darker_violet = TCOD_color_t(31, 0, 63);
  const TCOD_color_t TCOD_darker_magenta = TCOD_color_t(63, 0, 63);
  const TCOD_color_t TCOD_darker_pink = TCOD_color_t(63, 0, 31);

// light colors
  const TCOD_color_t TCOD_light_red = TCOD_color_t(255, 127, 127);
  const TCOD_color_t TCOD_light_orange = TCOD_color_t(255, 191, 127);
  const TCOD_color_t TCOD_light_yellow = TCOD_color_t(255, 255, 127);
  const TCOD_color_t TCOD_light_chartreuse = TCOD_color_t(191, 255, 127);
  const TCOD_color_t TCOD_light_green = TCOD_color_t(127, 255, 127);
  const TCOD_color_t TCOD_light_sea = TCOD_color_t(127, 255, 191);
  const TCOD_color_t TCOD_light_cyan = TCOD_color_t(127, 255, 255);
  const TCOD_color_t TCOD_light_sky = TCOD_color_t(127, 191, 255);
  const TCOD_color_t TCOD_light_blue = TCOD_color_t(127, 127, 255);
  const TCOD_color_t TCOD_light_violet = TCOD_color_t(191, 127, 255);
  const TCOD_color_t TCOD_light_magenta = TCOD_color_t(255, 127, 255);
  const TCOD_color_t TCOD_light_pink = TCOD_color_t(255, 127, 191);

// desaturated
  const TCOD_color_t TCOD_desaturated_red = TCOD_color_t(127, 63, 63);
  const TCOD_color_t TCOD_desaturated_orange = TCOD_color_t(127, 95, 63);
  const TCOD_color_t TCOD_desaturated_yellow = TCOD_color_t(127, 127, 63);
  const TCOD_color_t TCOD_desaturated_chartreuse = TCOD_color_t(95, 127, 63);
  const TCOD_color_t TCOD_desaturated_green = TCOD_color_t(63, 127, 63);
  const TCOD_color_t TCOD_desaturated_sea = TCOD_color_t(63, 127, 95);
  const TCOD_color_t TCOD_desaturated_cyan = TCOD_color_t(63, 127, 127);
  const TCOD_color_t TCOD_desaturated_sky = TCOD_color_t(63, 95, 127);
  const TCOD_color_t TCOD_desaturated_blue = TCOD_color_t(63, 63, 127);
  const TCOD_color_t TCOD_desaturated_violet = TCOD_color_t(95, 63, 127);
  const TCOD_color_t TCOD_desaturated_magenta = TCOD_color_t(127, 63, 127);
  const TCOD_color_t TCOD_desaturated_pink = TCOD_color_t(127, 63, 95);

// special
  const TCOD_color_t TCOD_silver = TCOD_color_t(203, 203, 203);
  const TCOD_color_t TCOD_gold = TCOD_color_t(255, 255, 102);


// --- Console ---

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
	version (Windows) int unused;
    } else {
        byte bitfield;
        bool pressed() { return cast(bool)(bitfield & 0x01); }
        bool lalt() { return cast(bool)(bitfield & 0x02); }
        bool lctrl() { return cast(bool)(bitfield & 0x04); }
        bool ralt() { return cast(bool)(bitfield & 0x08); }
        bool rctrl() { return cast(bool)(bitfield & 0x10); }
        bool shift() { return cast(bool)(bitfield & 0x20); }
	version (Windows) int unused;
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

// --- Image. ---
alias void* TCOD_image_t;

// --- Sys. ---
alias void* TCOD_thread_t;
alias void* TCOD_semaphore_t;
alias void* TCOD_mutex_t;
alias void (*SDL_renderer_t) (void* sdl_surface);

// --- Mersenne. ---
alias void* TCOD_random_t;

// --- Mouse. ---
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
	version (Windows) int unused; 
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
	version (Windows) int unused;
    }
} 

// --- Bresenham. ---
alias bool (*TCOD_line_listener_t) (int x, int y);

struct TCOD_bresenham_data_t {
	int stepx;
	int stepy;
	int e;
	int deltax;
	int deltay;
	int origx; 
	int origy; 
	int destx; 
	int desty; 
}

// --- BSP. ---
struct TCOD_bsp_t {
	TCOD_tree_t tree; /* pseudo oop : bsp inherit tree */
	int x,y,w,h; /* node position & size */
	int position; /* position of splitting */
	ubyte level; /* level in the tree */
	bool horizontal; /* horizontal splitting ? */
} 

alias bool (*TCOD_bsp_callback_t)(TCOD_bsp_t *node, void *userData);

// --- Noise. ---
alias void* TCOD_noise_t;

const int TCOD_NOISE_MAX_OCTAVES = 128;
const int TCOD_NOISE_MAX_DIMENSIONS = 4;
const float TCOD_NOISE_DEFAULT_HURST = 0.5f;
const float TCOD_NOISE_DEFAULT_LACUNARITY = 2.0f;

// --- FOV. ---
alias void* TCOD_map_t;

// FOV_BASIC : http://roguebasin.roguelikedevelopment.org/index.php?title=Ray_casting
// FOV_DIAMOND : http://www.geocities.com/temerra/los_rays.html
// FOV_SHADOW : http://roguebasin.roguelikedevelopment.org/index.php?title=FOV_using_recursive_shadowcasting
// FOV_PERMISSIVE : http://roguebasin.roguelikedevelopment.org/index.php?title=Precise_Permissive_Field_of_View
// FOV_RESTRICTIVE : Mingos' Restrictive Precise Angle Shadowcasting (contribution by Mingos)

alias int TCOD_fov_algorithm_t;
enum : TCOD_fov_algorithm_t {
        FOV_BASIC,
        FOV_DIAMOND,
        FOV_SHADOW,
        FOV_PERMISSIVE_0,
        FOV_PERMISSIVE_1,
        FOV_PERMISSIVE_2,
        FOV_PERMISSIVE_3,
        FOV_PERMISSIVE_4,
        FOV_PERMISSIVE_5,
        FOV_PERMISSIVE_6,
        FOV_PERMISSIVE_7,
        FOV_PERMISSIVE_8,
        FOV_RESTRICTIVE,
        NB_FOV_ALGORITHMS
}

TCOD_fov_algorithm_t FOV_PERMISSIVE(int x) { return FOV_PERMISSIVE_0 + x; }

// --- Path. ---
alias float (*TCOD_path_func_t)( int xFrom, int yFrom, int xTo, int yTo, void *user_data );
alias void *TCOD_path_t;

// --- Lex. ---
const int TCOD_LEX_FLAG_NOCASE = 1;
const int TCOD_LEX_FLAG_NESTING_COMMENT = 2;

const int TCOD_LEX_ERROR = -1;
const int TCOD_LEX_UNKNOWN = 0;
const int TCOD_LEX_SYMBOL = 1;
const int TCOD_LEX_KEYWORD = 2;
const int TCOD_LEX_IDEN = 3;
const int TCOD_LEX_STRING = 4;
const int TCOD_LEX_INTEGER = 5;
const int TCOD_LEX_FLOAT = 6;
const int TCOD_LEX_CHAR = 7;
const int TCOD_LEX_EOF = 8;

const int TCOD_LEX_MAX_SYMBOLS = 50;
const int TCOD_LEX_SYMBOL_SIZE = 5;
const int TCOD_LEX_MAX_KEYWORDS = 50;
const int TCOD_LEX_KEYWORD_SIZE = 20;

struct TCOD_lex_t {
	int file_line, token_type, token_int_val, token_idx;
	float token_float_val;
	char tok[512];
	char lastStringDelim;
	char *pos;
	char *buf;
	char *filename;
	char *last_javadoc_comment;
	// private stuff
	int nb_symbols, nb_keywords, flags;
        char symbols[ TCOD_LEX_MAX_SYMBOLS][ TCOD_LEX_SYMBOL_SIZE ];
	char keywords[ TCOD_LEX_MAX_KEYWORDS ][ TCOD_LEX_KEYWORD_SIZE ];
	const char *simpleCmt;
	const char* cmtStart, cmtStop, javadocCmtStart;
	const char *stringDelim;
	bool javadoc_read;
	bool allocBuf;
	bool savept; // is this object a savepoint (no free in destructor)	
} 


// --- Parser. ---
/* generic type */
alias int TCOD_value_type_t;
enum : TCOD_value_type_t { 
	TCOD_TYPE_NONE,
	TCOD_TYPE_BOOL,
	TCOD_TYPE_CHAR,
	TCOD_TYPE_INT,
	TCOD_TYPE_FLOAT,
	TCOD_TYPE_STRING,
	TCOD_TYPE_COLOR,
	TCOD_TYPE_DICE,
	TCOD_TYPE_VALUELIST00,
	TCOD_TYPE_VALUELIST01,
	TCOD_TYPE_VALUELIST02,
	TCOD_TYPE_VALUELIST03,
	TCOD_TYPE_VALUELIST04,
	TCOD_TYPE_VALUELIST05,
	TCOD_TYPE_VALUELIST06,
	TCOD_TYPE_VALUELIST07,
	TCOD_TYPE_VALUELIST08,
	TCOD_TYPE_VALUELIST09,
	TCOD_TYPE_VALUELIST10,
	TCOD_TYPE_VALUELIST11,
	TCOD_TYPE_VALUELIST12,
	TCOD_TYPE_VALUELIST13,
	TCOD_TYPE_VALUELIST14,
	TCOD_TYPE_VALUELIST15,
	TCOD_TYPE_CUSTOM00,
	TCOD_TYPE_CUSTOM01,
	TCOD_TYPE_CUSTOM02,
	TCOD_TYPE_CUSTOM03,
	TCOD_TYPE_CUSTOM04,
	TCOD_TYPE_CUSTOM05,
	TCOD_TYPE_CUSTOM06,
	TCOD_TYPE_CUSTOM07,
	TCOD_TYPE_CUSTOM08,
	TCOD_TYPE_CUSTOM09,
	TCOD_TYPE_CUSTOM10,
	TCOD_TYPE_CUSTOM11,
	TCOD_TYPE_CUSTOM12,
	TCOD_TYPE_CUSTOM13,
	TCOD_TYPE_CUSTOM14,
	TCOD_TYPE_CUSTOM15,
	TCOD_TYPE_LIST=1024
} 

/* dice roll */
struct TCOD_dice_t {
	int nb_dices;
	int nb_faces;
	float multiplier;
	float addsub;
} 

/* generic value */
union TCOD_value_t {
	bool b;
	char c;
	int i;
	float f;
	char *s;
	TCOD_color_t col;
	TCOD_dice_t dice;
	TCOD_list_t list;
	void *custom;
} 

/* parser structures */
alias void *TCOD_parser_struct_t;

/* parser listener */
struct TCOD_parser_listener_t {
	bool (*new_struct)(TCOD_parser_struct_t str, charptr name);
	bool (*new_flag)( charptr name);
	bool (*new_property)( charptr propname, TCOD_value_type_t type, TCOD_value_t value);
	bool (*end_struct)(TCOD_parser_struct_t str,  charptr name);
	void (*error)( charptr msg);
} 

/* a custom type parser */
alias TCOD_value_t (*TCOD_parser_custom_t)(TCOD_lex_t *lex, TCOD_parser_listener_t *listener, TCOD_parser_struct_t str, charptr propname);

/* the parser */
alias void *TCOD_parser_t;

/* parser internals (may be used by custom type parsers) */
/* parser structures */
struct TCOD_struct_int_t {
	charptr name; /* entity type name */
	/* list of flags */
	TCOD_list_t flags;
	/* list of properties (name, type, mandatory) */
	TCOD_list_t props;
	/* list of value lists */
	TCOD_list_t lists;
	/* list of sub-structures */
	TCOD_list_t structs;
} 

/* the parser */
struct TCOD_parser_int_t {
	/* list of structures */
	TCOD_list_t structs;
	/* list of custom type parsers */
	TCOD_parser_custom_t customs[16];
	/* fatal error occured */
	bool fatal;
	// list of properties if default listener is used
	TCOD_list_t props;
} 


// --- Tree. ---
struct TCOD_tree_t {
	TCOD_tree_t *next;
	TCOD_tree_t *father;
	TCOD_tree_t *sons;
}


// --- Heightmap. ---
struct TCOD_heightmap_t {
	int w,h;
	float *values;
} 


// --- Zip. ---
alias void* TCOD_zip_t;

