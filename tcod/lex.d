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

module tcod.lex;

import tcod.base;

extern (C):
/*
 * This is a libtcod internal module.
 * Use at your own risks...
 */

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

 TCOD_lex_t *TCOD_lex_new_intern();
 TCOD_lex_t *TCOD_lex_new(charptr* symbols, charptr* keywords, charptr simpleComment, 
		charptr commentStart, charptr commentStop, charptr javadocCommentStart, charptr stringDelim, int flags);
 void TCOD_lex_delete(TCOD_lex_t *lex);

 void TCOD_lex_set_data_buffer(TCOD_lex_t *lex,char *dat);
 bool TCOD_lex_set_data_file(TCOD_lex_t *lex,charptr filename);

 int TCOD_lex_parse(TCOD_lex_t *lex);
 int TCOD_lex_parse_until_token_type(TCOD_lex_t *lex,int token_type);
 int TCOD_lex_parse_until_token_value(TCOD_lex_t *lex,charptr token_value);

 bool TCOD_lex_expect_token_type(TCOD_lex_t *lex,int token_type);
 bool TCOD_lex_expect_token_value(TCOD_lex_t *lex,int token_type,charptr token_value);

 void TCOD_lex_savepoint(TCOD_lex_t *lex,TCOD_lex_t *savept);
 void TCOD_lex_restore(TCOD_lex_t *lex,TCOD_lex_t *savept);
 char *TCOD_lex_get_last_javadoc(TCOD_lex_t *lex);
 char *TCOD_lex_get_token_name(int token_type);
 char *TCOD_lex_get_last_error();

 int TCOD_lex_hextoint(char c);

