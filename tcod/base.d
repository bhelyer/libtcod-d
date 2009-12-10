/*
* libtcod 1.4.2
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

module tcod.base;

extern (C):

// base types
alias ubyte uint8;
alias byte int8;
alias ushort uint16;
alias short int16;
alias uint uint32;
alias int int32;
// int with the same size as a pointer (32 or 64 depending on OS)
//typedef long intptr;
//typedef unsigned long uintptr;

const int TCOD_HEXVERSION = 0x010402;
const string TCOD_STRVERSION = "1.4.2";
const int TCOD_TECHVERSION = 0x01040202;

/******************************************
 utility macros
 ******************************************/
version (D_Version2) {
    mixin("
    pure T MAX(T)(T a, T b) { return (a < b) ? b : a; }
    pure T MIN(T)(T a, T b) { return (a > b) ? b : a; }
    pure T ABS(T)(T a) { return (a < 0) ? -a : a; }
    pure T CLAMP(T)(T a, T b, T x) { return (x < a) ? a : ((x > b) ? b : x); }
    pure T LERP(T)(T a, T b, T x) { return (a + x * (b - a)); }
    ");
} else {
    T MAX(T)(T a, T b) { return (a < b) ? b : a; }
    T MIN(T)(T a, T b) { return (a > b) ? b : a; }
    T ABS(T)(T a) { return (a < 0) ? -a : a; }
    T CLAMP(T)(T a, T b, T x) { return (x < a) ? a : ((x > b) ? b : x); }
    T LERP(T)(T a, T b, T x) { return (a + x * (b - a)); }
}

version (D_Version2) {
    /*
     * All code must be valid for any compiler even if it
     * it won't be getting included. This isn't valid for
     * DMD 1, hence the mixin.
     */
    mixin("alias const(char)* charptr;");
} else {
    alias char* charptr;
}

public import tcod.types;
public import tcod.functions;

