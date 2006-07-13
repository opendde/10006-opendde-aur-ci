/*
 * (C)opyright MMVI Anselm R. Garbe <garbeam at gmail dot com>
 * See LICENSE file for license details.
 */

#include <X11/Xlib.h>

/********** CUSTOMIZE **********/

#define FONT		"-*-terminus-medium-*-*-*-13-*-*-*-*-*-iso10646-*"
#define BGCOLOR		"DarkSlateGrey"
#define FGCOLOR		"LightSteelBlue"
#define BORDERCOLOR	"SlateGray"
#define WM_PROTOCOL_DELWIN 1

/* tags */
enum { Tscratch, Tdev, Tirc, Twww, Twork, TLast };

/********** CUSTOMIZE **********/

typedef struct DC DC;
typedef struct Client Client;
typedef struct Fnt Fnt;
typedef struct Key Key;

/* atoms */
enum { WMProtocols, WMDelete, WMLast };
enum { NetSupported, NetWMName, NetLast };

/* cursor */
enum { CurNormal, CurResize, CurMove, CurInput, CurLast };

struct Fnt {
	XFontStruct *xfont;
	XFontSet set;
	int ascent;
	int descent;
	int height;
};

struct DC { /* draw context */
	GC gc;
	Drawable drawable;
	int x, y, w, h;
	Fnt font;
	unsigned long bg;
	unsigned long fg;
	unsigned long border;
};

struct Client {
	char name[256];
	char *tags[TLast];
	int proto;
	int x, y, w, h;
	int tx, ty, tw, th;
	int basew, baseh, incw, inch, maxw, maxh, minw, minh;
	int grav;
	unsigned int border;
	long flags; 
	Window win;
	Window trans;
	Window title;
	Client *next;
	Client *snext;
};

struct Key {
	unsigned long mod;
	KeySym keysym;
	void (*func)(void *aux);
	void *aux;
};

extern Display *dpy;
extern Window root;
extern Atom wm_atom[WMLast], net_atom[NetLast];
extern Cursor cursor[CurLast];
extern Bool running, issel;
extern void (*handler[LASTEvent]) (XEvent *);

extern int tsel, screen, sx, sy, sw, sh, th;
extern char stext[1024], *tags[TLast];

extern DC dc;
extern Client *clients, *stack;

/* client.c */
extern void manage(Window w, XWindowAttributes *wa);
extern void unmanage(Client *c);
extern Client *getclient(Window w);
extern void focus(Client *c);
extern void update_name(Client *c);
extern void draw_client(Client *c);
extern void resize(Client *c);
extern void update_size(Client *c);
extern Client *gettitle(Window w);
extern void craise(Client *c);
extern void lower(Client *c);
extern void ckill(void *aux);
extern void sel(void *aux);
extern void max(void *aux);
extern void floating(void *aux);
extern void tiling(void *aux);
extern void gravitate(Client *c, Bool invert);

/* draw.c */
extern void draw(Bool border, const char *text);
extern unsigned long initcolor(const char *colstr);
extern void initfont(const char *fontstr);
extern unsigned int textnw(char *text, unsigned int len);
extern unsigned int textw(char *text);
extern unsigned int texth(void);

/* event.c */
extern void discard_events(long even_mask);

/* dev.c */
extern void update_keys(void);
extern void keypress(XEvent *e);
extern void mresize(Client *c);
extern void mmove(Client *c);

/* main.c */
extern int error_handler(Display *dsply, XErrorEvent *e);
extern void send_message(Window w, Atom a, long value);
extern int win_proto(Window w);
extern void quit(void *aux);

/* util.c */
extern void error(const char *errstr, ...);
extern void *emallocz(unsigned int size);
extern void *emalloc(unsigned int size);
extern void *erealloc(void *ptr, unsigned int size);
extern char *estrdup(const char *str);
extern void spawn(char *argv[]);
extern void swap(void **p1, void **p2);
