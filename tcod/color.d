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

module tcod.color;

extern (C):

struct TCOD_color_t {
	ubyte r,g,b;
} 

bool TCOD_color_equals (TCOD_color_t c1, TCOD_color_t c2);
TCOD_color_t TCOD_color_add (TCOD_color_t c1, TCOD_color_t c2);
TCOD_color_t TCOD_color_subtract (TCOD_color_t c1, TCOD_color_t c2);
TCOD_color_t TCOD_color_multiply (TCOD_color_t c1, TCOD_color_t c2);
TCOD_color_t TCOD_color_multiply_scalar (TCOD_color_t c1, float value);
TCOD_color_t TCOD_color_lerp(TCOD_color_t c1, TCOD_color_t c2, float coef);
void TCOD_color_set_HSV(TCOD_color_t *c,float h, float s, float v);
void TCOD_color_get_HSV(TCOD_color_t c,float * h, float * s, float * v);
void TCOD_color_gen_map(TCOD_color_t *map, int nb_key, TCOD_color_t *key_color, int *key_index);

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
extern  const TCOD_color_t  TCOD_colors[TCOD_COLOR_NB][TCOD_COLOR_LEVELS];

// grey levels
extern  const TCOD_color_t TCOD_black;
extern  const TCOD_color_t TCOD_darker_grey;
extern  const TCOD_color_t TCOD_dark_grey;
extern  const TCOD_color_t TCOD_grey;
extern  const TCOD_color_t TCOD_light_grey;
extern  const TCOD_color_t TCOD_darker_gray;
extern  const TCOD_color_t TCOD_dark_gray;
extern  const TCOD_color_t TCOD_gray;
extern  const TCOD_color_t TCOD_light_gray;
extern  const TCOD_color_t TCOD_white;

// standard colors
extern  const TCOD_color_t TCOD_red;
extern  const TCOD_color_t TCOD_orange;
extern  const TCOD_color_t TCOD_yellow;
extern  const TCOD_color_t TCOD_chartreuse;
extern  const TCOD_color_t TCOD_green;
extern  const TCOD_color_t TCOD_sea;
extern  const TCOD_color_t TCOD_cyan;
extern  const TCOD_color_t TCOD_sky;
extern  const TCOD_color_t TCOD_blue;
extern  const TCOD_color_t TCOD_violet;
extern  const TCOD_color_t TCOD_magenta;
extern  const TCOD_color_t TCOD_pink;

// dark colors
extern  const TCOD_color_t TCOD_dark_red;
extern  const TCOD_color_t TCOD_dark_orange;
extern  const TCOD_color_t TCOD_dark_yellow;
extern  const TCOD_color_t TCOD_dark_chartreuse;
extern  const TCOD_color_t TCOD_dark_green;
extern  const TCOD_color_t TCOD_dark_sea;
extern  const TCOD_color_t TCOD_dark_cyan;
extern  const TCOD_color_t TCOD_dark_sky;
extern  const TCOD_color_t TCOD_dark_blue;
extern  const TCOD_color_t TCOD_dark_violet;
extern  const TCOD_color_t TCOD_dark_magenta;
extern  const TCOD_color_t TCOD_dark_pink;

// darker colors
extern  const TCOD_color_t TCOD_darker_red;
extern  const TCOD_color_t TCOD_darker_orange;
extern  const TCOD_color_t TCOD_darker_yellow;
extern  const TCOD_color_t TCOD_darker_chartreuse;
extern  const TCOD_color_t TCOD_darker_green;
extern  const TCOD_color_t TCOD_darker_sea;
extern  const TCOD_color_t TCOD_darker_cyan;
extern  const TCOD_color_t TCOD_darker_sky;
extern  const TCOD_color_t TCOD_darker_blue;
extern  const TCOD_color_t TCOD_darker_violet;
extern  const TCOD_color_t TCOD_darker_magenta;
extern  const TCOD_color_t TCOD_darker_pink;

// light colors
extern  const TCOD_color_t TCOD_light_red;
extern  const TCOD_color_t TCOD_light_orange;
extern  const TCOD_color_t TCOD_light_yellow;
extern  const TCOD_color_t TCOD_light_chartreuse;
extern  const TCOD_color_t TCOD_light_green;
extern  const TCOD_color_t TCOD_light_sea;
extern  const TCOD_color_t TCOD_light_cyan;
extern  const TCOD_color_t TCOD_light_sky;
extern  const TCOD_color_t TCOD_light_blue;
extern  const TCOD_color_t TCOD_light_violet;
extern  const TCOD_color_t TCOD_light_magenta;
extern  const TCOD_color_t TCOD_light_pink;

// desaturated
extern  const TCOD_color_t TCOD_desaturated_red;
extern  const TCOD_color_t TCOD_desaturated_orange;
extern  const TCOD_color_t TCOD_desaturated_yellow;
extern  const TCOD_color_t TCOD_desaturated_chartreuse;
extern  const TCOD_color_t TCOD_desaturated_green;
extern  const TCOD_color_t TCOD_desaturated_sea;
extern  const TCOD_color_t TCOD_desaturated_cyan;
extern  const TCOD_color_t TCOD_desaturated_sky;
extern  const TCOD_color_t TCOD_desaturated_blue;
extern  const TCOD_color_t TCOD_desaturated_violet;
extern  const TCOD_color_t TCOD_desaturated_magenta;
extern  const TCOD_color_t TCOD_desaturated_pink;

// special
extern  const TCOD_color_t TCOD_silver;
extern  const TCOD_color_t TCOD_gold;

