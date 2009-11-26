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

module tcod.sys;

import tcod.base;
import tcod.image;

extern (C):

 uint TCOD_sys_elapsed_milli();
 float TCOD_sys_elapsed_seconds();
 void TCOD_sys_sleep_milli(uint val);
void TCOD_sys_save_screenshot(charptr filename);
 void TCOD_sys_force_fullscreen_resolution(int width, int height);
 void TCOD_sys_set_fps(int val);
 int TCOD_sys_get_fps();
 float TCOD_sys_get_last_frame_length();
 void TCOD_sys_get_current_resolution(int *w, int *h);
 void TCOD_sys_update_char(int asciiCode, int fontx, int fonty, TCOD_image_t img, int x, int y);
// filesystem stuff
bool TCOD_sys_create_directory(charptr path);
bool TCOD_sys_delete_file(charptr path);
bool TCOD_sys_delete_directory(charptr path);
// thread stuff
alias void* TCOD_thread_t;
alias void* TCOD_semaphore_t;
alias void* TCOD_mutex_t;
// threads
 TCOD_thread_t TCOD_thread_new(int (*func)(void *), void *data);
 void TCOD_thread_delete(TCOD_thread_t th);
 int TCOD_sys_get_num_cores();
// mutex
 TCOD_mutex_t TCOD_mutex_new();
 void TCOD_mutex_in(TCOD_mutex_t mut);
 void TCOD_mutex_out(TCOD_mutex_t mut);
 void TCOD_mutex_delete(TCOD_mutex_t mut);
// semaphore
 TCOD_semaphore_t TCOD_semaphore_new(int initVal);
 void TCOD_semaphore_lock(TCOD_semaphore_t sem);
 void TCOD_semaphore_unlock(TCOD_semaphore_t sem);
 void TCOD_semaphore_delete( TCOD_semaphore_t sem);
// SDL renderer callback
alias void (*SDL_renderer_t) (void *sdl_surface);
void TCOD_sys_register_SDL_renderer(SDL_renderer_t renderer);

