/**
 * Just enough SDL to use in the samples.
 * Probably shouldn't be used in any serious fashion.
 */
module SDL.c.video;

alias ubyte Uint8;

struct SDL_Rect
{
    short x, y;
    ushort w, h;
}

struct SDL_Color
{
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte unused;
}

struct SDL_Palette
{
    int ncolors;
    SDL_Color* colors;
}

struct SDL_PixelFormat
{
    SDL_Palette* palette;
    ubyte BitsPerPixel;
    ubyte BytesPerPixel;
    ubyte Rloss;
    ubyte Gloss;
    ubyte Bloss;
    ubyte Aloss;
    ubyte Rshift;
    ubyte Gshift;
    ubyte Bshift;
    ubyte Ashift;
    uint Rmask;
    uint Gmask;
    uint Bmask;
    uint Amask;

    uint colorkey;
    ubyte alpha;
}


struct private_hwdata;
struct SDL_BlitMap;

struct SDL_Surface
{
    uint flags;
    SDL_PixelFormat* format;
    int w, h;
    ushort pitch;
    void* pixels;
    int offset;
    private_hwdata* hwdata;
    SDL_Rect clip_rect;
    uint unused;
    uint locked;
    SDL_BlitMap* map; // !!!
    uint format_version;
    int refcount;
}

