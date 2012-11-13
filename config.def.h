/* See LICENSE file for copyright and license details. */

/* appearance */
static char font[] = "Liberation Mono:pixelsize=12:antialias=false:autohint=false";
static int borderpx = 2;
static char shell[] = "/bin/sh";

/* double-click timeout (in milliseconds) between clicks for selection */
static unsigned int doubleclicktimeout = 300;
static unsigned int tripleclicktimeout = 600;

/* TERM value */
static char termname[] = "st-256color";

static unsigned int tabspaces = 8;


/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	/* 8 normal colors */
	"black",
	"red3",
	"green3",
	"yellow3",
	"blue2",
	"magenta3",
	"cyan3",
	"gray90",

	/* 8 bright colors */
	"gray50",
	"red",
	"green",
	"yellow",
	"#5c5cff",
	"magenta",
	"cyan",
	"white",

	[255] = 0,

	/* more colors can be added after 255 to use with DefaultXX */
	"#cccccc",
	"#333333",
};


/*
 * Default colors (colorname index)
 * foreground, background, cursor, unfocused cursor
 */
static unsigned int defaultfg = 7;
static unsigned int defaultbg = 0;
static unsigned int defaultcs = 256;
static unsigned int defaultucs = 257;

/*
 * Special keys (change & recompile st.info accordingly)
 *
 * Mask value:
 * * Use XK_ANY_MOD to match the key no matter modifiers state
 * * Use XK_NO_MOD to match the key alone (no modifiers)
 * keypad value:
 * * 0: no value
 * * > 0: keypad application mode enabled
 * * < 0: keypad application mode disabled
 * cursor value:
 * * 0: no value
 * * > 0: cursor application mode enabled
 * * < 0: cursor application mode disabled
 * crlf value
 * * 0: no value
 * * > 0: crlf mode is enabled
 * * < 0: crlf mode is disabled
 */

/* key, mask, output, keypad, cursor, crlf */
static Key key[] = {
	/* keysym             mask         string         keypad cursor crlf */
	{ XK_KP_Home,       XK_NO_MOD,      "\033[H",        0,    0,    0},
	{ XK_KP_Home,       ShiftMask,      "\033[1;2H",     0,    0,    0},
	{ XK_KP_Up,         XK_NO_MOD,      "\033Ox",       +1,    0,    0},
	{ XK_KP_Up,         XK_NO_MOD,      "\033[A",        0,   -1,    0},
	{ XK_KP_Up,         XK_NO_MOD,      "\033OA",        0,   +1,    0},
	{ XK_KP_Down,       XK_NO_MOD,      "\033Or",       +1,    0,    0},
	{ XK_KP_Down,       XK_NO_MOD,      "\033[B",        0,   -1,    0},
	{ XK_KP_Down,       XK_NO_MOD,      "\033OB",        0,   +1,    0},
	{ XK_KP_Left,       XK_NO_MOD,      "\033Ot",       +1,    0,    0},
	{ XK_KP_Left,       XK_NO_MOD,      "\033[D",        0,   -1,    0},
	{ XK_KP_Left,       XK_NO_MOD,      "\033OD",        0,   +1,    0},
	{ XK_KP_Right,      XK_NO_MOD,      "\033Ov",       +1,    0,    0},
	{ XK_KP_Right,      XK_NO_MOD,      "\033[C",        0,   -1,    0},
	{ XK_KP_Right,      XK_NO_MOD,      "\033OC",        0,   +1,    0},
	{ XK_KP_Prior,      XK_NO_MOD,      "\033[5~",	     0,    0,    0},
	{ XK_KP_Prior,      ShiftMask,      "\033[5;2~",     0,    0,    0},
	{ XK_KP_Begin,      XK_NO_MOD,      "\033[E",        0,    0,    0},
	{ XK_KP_End,        XK_NO_MOD,      "\033[4~",       0,    0,    0},
	{ XK_KP_End,        ShiftMask,      "\033[1;2F",     0,    0,    0},
	{ XK_KP_Next,       XK_NO_MOD,      "\033[6~",       0,    0,    0},
	{ XK_KP_Next,       ShiftMask,      "\033[6;2~",     0,    0,    0},
	{ XK_KP_Insert,     XK_NO_MOD,      "\033[2~",       0,    0,    0},
	{ XK_KP_Insert,     ShiftMask,      "\033[2;2~",     0,    0,    0},
	{ XK_KP_Delete,     XK_NO_MOD,      "\033[3~",       0,    0,    0},
	{ XK_KP_Delete,     ShiftMask,      "\033[3;2~",     0,    0,    0},
	{ XK_KP_Multiply,   XK_NO_MOD,      "\033Oj",       +1,    0,    0},
	{ XK_KP_Add,        XK_NO_MOD,      "\033Ok",       +1,    0,    0},
	{ XK_KP_Enter,      XK_NO_MOD,      "\033OM",       +1,    0,    0},
	{ XK_KP_Enter,      XK_NO_MOD,      "\n",           -1,    0,   -1},
	{ XK_KP_Enter,      XK_NO_MOD,      "\r\n",         -1,    0,    0},
	{ XK_KP_Subtract,   XK_NO_MOD,      "\033Om",       +1,    0,    0},
	{ XK_KP_Decimal,    XK_NO_MOD,      "\033On",       +1,    0,    0},
	{ XK_KP_Divide,     XK_NO_MOD,      "\033Oo",       +1,    0,    0},
	{ XK_KP_0,          XK_NO_MOD,      "\033Op",       +1,    0,    0},
	{ XK_KP_1,          XK_NO_MOD,      "\033Oq",       +1,    0,    0},
	{ XK_KP_2,          XK_NO_MOD,      "\033Or",       +1,    0,    0},
	{ XK_KP_3,          XK_NO_MOD,      "\033Os",       +1,    0,    0},
	{ XK_KP_4,          XK_NO_MOD,      "\033Ot",       +1,    0,    0},
	{ XK_KP_5,          XK_NO_MOD,      "\033Ou",       +1,    0,    0},
	{ XK_KP_6,          XK_NO_MOD,      "\033Ov",       +1,    0,    0},
	{ XK_KP_7,          XK_NO_MOD,      "\033Ow",       +1,    0,    0},
	{ XK_KP_8,          XK_NO_MOD,      "\033Ox",       +1,    0,    0},
	{ XK_KP_9,          XK_NO_MOD,      "\033Oy",       +1,    0,    0},
	{ XK_BackSpace,     XK_NO_MOD,      "\177",          0,    0,    0},
	{ XK_Up,            XK_NO_MOD,      "\033[A",        0,   -1,    0},
	{ XK_Up,            XK_NO_MOD,      "\033OA",        0,   +1,    0},
	{ XK_Up,            ShiftMask,      "\033[1;2A",     0,    0,    0},
	{ XK_Up,            ControlMask,    "\033[1;5A",     0,    0,    0},
	{ XK_Up,            Mod1Mask,       "\033[1;3A",     0,    0,    0},
	{ XK_Down,          XK_NO_MOD,      "\033[B",        0,   -1,    0},
	{ XK_Down,          XK_NO_MOD,      "\033OB",        0,   +1,    0},
	{ XK_Down,          ShiftMask,      "\033[1;2B",     0,    0,    0},
	{ XK_Down,          ControlMask,    "\033[1;5B",     0,    0,    0},
	{ XK_Down,          Mod1Mask,       "\033[1;3B",     0,    0,    0},
	{ XK_Left,     	    XK_NO_MOD,      "\033[D",        0,   -1,    0},
	{ XK_Left,          XK_NO_MOD,      "\033OD",        0,   +1,    0},
	{ XK_Left,          ShiftMask,      "\033[1;2D",     0,    0,    0},
	{ XK_Left,          ControlMask,    "\033[1;5D",     0,    0,    0},
	{ XK_Left,          Mod1Mask,       "\033[1;3D",     0,    0,    0},
	{ XK_Right,         XK_NO_MOD,      "\033[C",        0,   -1,    0},
	{ XK_Right,         XK_NO_MOD,      "\033OC",        0,   +1,    0},
	{ XK_Right,         ShiftMask,      "\033[1;2C",     0,    0,    0},
	{ XK_Right,         ControlMask,    "\033[1;5C",     0,    0,    0},
	{ XK_Right,         Mod1Mask,       "\033[1;3C",     0,    0,    0},
	{ XK_Tab,           ShiftMask,      "\033[Z",        0,    0,    0},
	{ XK_Return,        XK_NO_MOD,      "\n",            0,    0,   -1},
	{ XK_Return,        XK_NO_MOD,      "\r\n",          0,    0,   +1},
	{ XK_Return,        Mod1Mask,       "\033\n",        0,    0,   -1},
	{ XK_Return,        Mod1Mask,       "\033\r\n",      0,    0,   +1},
	{ XK_Insert,        XK_NO_MOD,      "\033[2~",       0,    0,    0},
	{ XK_Insert,        ShiftMask,      "\033[2;2~",     0,    0,    0},
	{ XK_Delete,        XK_NO_MOD,      "\033[3~",       0,    0,    0},
	{ XK_Delete,        ShiftMask,      "\033[3;2~",     0,    0,    0},
	{ XK_Home,          XK_NO_MOD,      "\033[H",        0,    0,    0},
	{ XK_Home,          ShiftMask,      "\033[1;2H",     0,    0,    0},
	{ XK_End,           XK_NO_MOD,      "\033[4~",       0,    0,    0},
	{ XK_End,           ShiftMask,      "\033[1;2F",     0,    0,    0},
	{ XK_Prior,         XK_NO_MOD,      "\033[5~",       0,    0,    0},
	{ XK_Next,          XK_NO_MOD,      "\033[6~",       0,    0,    0},
	{ XK_Next,          ShiftMask,      "\033[6;2~",     0,    0,    0},
	{ XK_F1,            XK_NO_MOD,      "\033OP" ,       0,    0,    0},
	{ XK_F1, /* F13 */  ShiftMask,      "\033[1;2P",     0,    0,    0},
	{ XK_F1, /* F25 */  ControlMask,    "\033[1;5P",     0,    0,    0},
	{ XK_F1, /* F37 */  Mod2Mask,       "\033[1;6P",     0,    0,    0},
	{ XK_F1, /* F49 */  Mod1Mask,       "\033[1;3P",     0,    0,    0},
	{ XK_F1, /* F61 */  Mod3Mask,       "\033[1;4P",     0,    0,    0},
	{ XK_F2,            XK_NO_MOD,      "\033OQ" ,       0,    0,    0},
	{ XK_F2, /* F14 */  ShiftMask,      "\033[1;2Q",     0,    0,    0},
	{ XK_F2, /* F26 */  ControlMask,    "\033[1;5Q",     0,    0,    0},
	{ XK_F2, /* F38 */  Mod2Mask,       "\033[1;6Q",     0,    0,    0},
	{ XK_F2, /* F50 */  Mod1Mask,       "\033[1;3Q",     0,    0,    0},
	{ XK_F2, /* F62 */  Mod3Mask,       "\033[1;4Q",     0,    0,    0},
	{ XK_F3,            XK_NO_MOD,      "\033OR" ,       0,    0,    0},
	{ XK_F3, /* F15 */  ShiftMask,      "\033[1;2R",     0,    0,    0},
	{ XK_F3, /* F27 */  ControlMask,    "\033[1;5R",     0,    0,    0},
	{ XK_F3, /* F39 */  Mod2Mask,       "\033[1;6R",     0,    0,    0},
	{ XK_F3, /* F51 */  Mod1Mask,       "\033[1;3R",     0,    0,    0},
	{ XK_F3, /* F63 */  Mod3Mask,       "\033[1;4R",     0,    0,    0},
	{ XK_F4,            XK_NO_MOD,      "\033OS" ,       0,    0,    0},
	{ XK_F4, /* F16 */  ShiftMask,      "\033[1;2S",     0,    0,    0},
	{ XK_F4, /* F28 */  ShiftMask,      "\033[1;5S",     0,    0,    0},
	{ XK_F4, /* F40 */  Mod2Mask,       "\033[1;6S",     0,    0,    0},
	{ XK_F4, /* F52 */  Mod1Mask,       "\033[1;3S",     0,    0,    0},
	{ XK_F5,            XK_NO_MOD,      "\033[15~",      0,    0,    0},
	{ XK_F5, /* F17 */  ShiftMask,      "\033[15;2~",    0,    0,    0},
	{ XK_F5, /* F29 */  ControlMask,    "\033[15;5~",    0,    0,    0},
	{ XK_F5, /* F41 */  Mod2Mask,       "\033[15;6~",    0,    0,    0},
	{ XK_F5, /* F53 */  Mod1Mask,       "\033[15;3~",    0,    0,    0},
	{ XK_F6,            XK_NO_MOD,      "\033[17~",      0,    0,    0},
	{ XK_F6, /* F18 */  ShiftMask,      "\033[17;2~",    0,    0,    0},
	{ XK_F6, /* F30 */  ControlMask,    "\033[17;5~",    0,    0,    0},
	{ XK_F6, /* F42 */  Mod2Mask,       "\033[17;6~",    0,    0,    0},
	{ XK_F6, /* F54 */  Mod1Mask,       "\033[17;3~",    0,    0,    0},
	{ XK_F7,            XK_NO_MOD,      "\033[18~",      0,    0,    0},
	{ XK_F7, /* F19 */  ShiftMask,      "\033[18;2~",    0,    0,    0},
	{ XK_F7, /* F31 */  ControlMask,    "\033[18;5~",    0,    0,    0},
	{ XK_F7, /* F43 */  Mod2Mask,       "\033[18;6~",    0,    0,    0},
	{ XK_F7, /* F55 */  Mod1Mask,       "\033[18;3~",    0,    0,    0},
	{ XK_F8,            XK_NO_MOD,      "\033[19~",      0,    0,    0},
	{ XK_F8, /* F20 */  ShiftMask,      "\033[19;2~",    0,    0,    0},
	{ XK_F8, /* F32 */  ControlMask,    "\033[19;5~",    0,    0,    0},
	{ XK_F8, /* F44 */  Mod2Mask,       "\033[19;6~",    0,    0,    0},
	{ XK_F8, /* F56 */  Mod1Mask,       "\033[19;3~",    0,    0,    0},
	{ XK_F9,            XK_NO_MOD,      "\033[20~",      0,    0,    0},
	{ XK_F9, /* F21 */  ShiftMask,      "\033[20;2~",    0,    0,    0},
	{ XK_F9, /* F33 */  ControlMask,    "\033[20;5~",    0,    0,    0},
	{ XK_F9, /* F45 */  Mod2Mask,       "\033[20;6~",    0,    0,    0},
	{ XK_F9, /* F57 */  Mod1Mask,       "\033[20;3~",    0,    0,    0},
	{ XK_F10,           XK_NO_MOD,      "\033[21~",      0,    0,    0},
	{ XK_F10, /* F22 */ ShiftMask,      "\033[21;2~",    0,    0,    0},
	{ XK_F10, /* F34 */ ControlMask,    "\033[21;5~",    0,    0,    0},
	{ XK_F10, /* F46 */ Mod2Mask,       "\033[21;6~",    0,    0,    0},
	{ XK_F10, /* F58 */ Mod1Mask,       "\033[21;3~",    0,    0,    0},
	{ XK_F11,           XK_NO_MOD,      "\033[23~",      0,    0,    0},
	{ XK_F11, /* F23 */ ShiftMask,      "\033[23;2~",    0,    0,    0},
	{ XK_F11, /* F35 */ ControlMask,    "\033[23;5~",    0,    0,    0},
	{ XK_F11, /* F47 */ Mod2Mask,       "\033[23;6~",    0,    0,    0},
	{ XK_F11, /* F59 */ Mod1Mask,       "\033[23;3~",    0,    0,    0},
	{ XK_F12,           XK_NO_MOD,      "\033[24~",      0,    0,    0},
	{ XK_F12, /* F24 */ ShiftMask,      "\033[24;2~",    0,    0,    0},
	{ XK_F12, /* F36 */ ControlMask,    "\033[24;5~",    0,    0,    0},
	{ XK_F12, /* F48 */ Mod2Mask,       "\033[24;6~",    0,    0,    0},
	{ XK_F12, /* F60 */ Mod1Mask,       "\033[24;3~",    0,    0,    0},
};

/* Internal shortcuts. */
#define MODKEY Mod1Mask

static Shortcut shortcuts[] = {
	/* modifier		key		function	argument */
	{ MODKEY|ShiftMask,	XK_Prior,	xzoom,		{.i = +1} },
	{ MODKEY|ShiftMask,	XK_Next,	xzoom,		{.i = -1} },
	{ ShiftMask,		XK_Insert,	selpaste,	{.i =  0} },
};

