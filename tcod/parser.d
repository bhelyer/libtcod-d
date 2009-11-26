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

module tcod.parser;

import tcod.base;
import tcod.color;
import tcod.list;
import tcod.lex;

extern (C):

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

  char *TCOD_struct_get_name(TCOD_parser_struct_t def);
void TCOD_struct_add_property(TCOD_parser_struct_t def,  charptr name,TCOD_value_type_t type, bool mandatory);
void TCOD_struct_add_list_property(TCOD_parser_struct_t def,  charptr name,TCOD_value_type_t type, bool mandatory);
void TCOD_struct_add_value_list(TCOD_parser_struct_t def, charptr name,  charptr *value_list, bool mandatory);
void TCOD_struct_add_value_list_sized(TCOD_parser_struct_t def, charptr name,  charptr *value_list, int size, bool mandatory);
void TCOD_struct_add_flag(TCOD_parser_struct_t def, charptr propname);
 void TCOD_struct_add_structure(TCOD_parser_struct_t def,TCOD_parser_struct_t sub_structure);
bool TCOD_struct_is_mandatory(TCOD_parser_struct_t def, charptr propname);
TCOD_value_type_t TCOD_struct_get_type(TCOD_parser_struct_t def,  charptr propname);


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

 TCOD_parser_t TCOD_parser_new();
 TCOD_parser_struct_t TCOD_parser_new_struct(TCOD_parser_t parser, charptr name);
 TCOD_value_type_t TCOD_parser_new_custom_type(TCOD_parser_t parser,TCOD_parser_custom_t custom_type_parser);
 void TCOD_parser_run(TCOD_parser_t parser,  charptr filename, TCOD_parser_listener_t *listener);
 void TCOD_parser_delete(TCOD_parser_t parser);
/* error during parsing. can be called by the parser listener */
 void TCOD_parser_error( charptr msg, ...);
/* default parser listener */
 bool TCOD_parser_get_bool_property(TCOD_parser_t parser,  charptr name);
 int TCOD_parser_get_char_property(TCOD_parser_t parser,  charptr name);
 int TCOD_parser_get_int_property(TCOD_parser_t parser,  charptr name);
 float TCOD_parser_get_float_property(TCOD_parser_t parser,  charptr name);
  charptr  TCOD_parser_get_string_property(TCOD_parser_t parser,  charptr name);
 TCOD_color_t TCOD_parser_get_color_property(TCOD_parser_t parser,  charptr name);
 TCOD_dice_t TCOD_parser_get_dice_property(TCOD_parser_t parser,  charptr name);
 void TCOD_parser_get_dice_property_py(TCOD_parser_t parser,  charptr name, TCOD_dice_t *dice);
 void * TCOD_parser_get_custom_property(TCOD_parser_t parser,  charptr name);
 TCOD_list_t TCOD_parser_get_list_property(TCOD_parser_t parser,  charptr name, TCOD_value_type_t type);

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

 TCOD_value_t TCOD_parse_bool_value();
 TCOD_value_t TCOD_parse_char_value();
 TCOD_value_t TCOD_parse_integer_value();
 TCOD_value_t TCOD_parse_float_value();
 TCOD_value_t TCOD_parse_string_value();
 TCOD_value_t TCOD_parse_color_value();
 TCOD_value_t TCOD_parse_dice_value();
 TCOD_value_t TCOD_parse_value_list_value(TCOD_struct_int_t *def,int listnum);
 TCOD_value_t TCOD_parse_property_value(TCOD_parser_int_t *parser, TCOD_parser_struct_t def, charptr propname, bool list);

