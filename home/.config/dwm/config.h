/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */

static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_perlrosa[]        = "#b24c43";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_perlrosa,  col_perlrosa  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class                instance    title       tags mask     isfloating   monitor */
    { "Gimp",               NULL,       NULL,       0,            0,           -1 },
    { "Firefox",            NULL,       NULL,       1 << 8,       0,           -1 },
    { "Code",               NULL,       NULL,       1 << 3,       0,           -1 },
    { "libreoffice-writer", NULL,       NULL,       1 << 4,       0,           -1 },
/*    { "Brave-browser",      NULL,       NULL,       1 << 2,       0,           -1 },*/
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[M]",      monocle },
    { "[T]",      tile },    /* first entry is default */
    { "[F]",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define CMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
//#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *roficmd[] = { "rofi", "-modi", "drun", "-show", "drun", "-line-padding", "4", "-columns", "2", "-padding", "50", "-hide-scrollbar", "-show-icons", "-drun-icon-theme", "Arc-X-D", "-font", "Droid Sans Regular 10", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *betterlockcmd[]  = { "betterlockscreen", "--lock", NULL };
static const char *poweroffcmd[] = { "systemctl", "poweroff", NULL };
static const char *suspendcmd[] = { "systemctl", "suspend", NULL };
static const char *wallpapercmd[] = { "/home/michael/.config/scripts/wallpaper.sh", NULL };
static const char *mailcmd[]         = { "dwm_mail",               NULL };

/* brightness and volume*/
static const char *upKeyBright[]   = { "brightnessctl", "--device=smc::kbd_backlight", "set", "+20", NULL };
static const char *downKeyBright[] = { "brightnessctl", "--device=smc::kbd_backlight", "set", "20-", NULL };
static const char *upbright[] = { "xbacklight", "-inc",   "10", NULL };
static const char *downbright[] = { "xbacklight", "-dec",   "10", NULL };
static const char *upvol[]   = { "/usr/bin/amixer", "-q", "sset", "Master", "5%+",     NULL };
static const char *downvol[] = { "/usr/bin/amixer", "-q", "sset", "Master", "5%-",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL };

static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };

/*
static const char *sakuracmd[]  = { "sakura", NULL };
static const char *bravecmd[]  = { "brave", NULL };
static const char *doublecmd[]  = { "doublecmd", NULL };
*/
/*static const char *rofiwindowscmd[] = {"rofi", "-show", "window", "-line-padding", "4", "-lines", "6", "-padding", "50", "-hide-scrollbar", "-show-icons", "-drun-icon-theme", "Arc-X-D", "-font", "Droid Sans Regular 10"};*/


/*
static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "0", "+5%",     NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "-5%",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL };
*/

#include <X11/XF86keysym.h>
#include "shiftview.c"

static Key keys[] = {
    /* modifier                     key                         function        argument */

    /* Applications */
    /*{ MODKEY,                       XK_F1,                      spawn,          {.v = bravecmd } },*/
    /*{ MODKEY,                       XK_w,                       spawn,          {.v = rofiwindowscmd } },*/
    { MODKEY,                       XK_m,                       spawn,          {.v = mailcmd } },
    { MODKEY,                       XK_d,                       spawn,          {.v = roficmd } },
    { MODKEY|ShiftMask,             XK_l,                       spawn,          {.v = betterlockcmd } },
    { MODKEY,                       XK_Return,                  spawn,          {.v = termcmd } },
    { MODKEY|ShiftMask,             XK_w,                       spawn,          {.v = wallpapercmd } },

    /* launch programs with Super + ALT */
    { MODKEY|ControlMask,              XK_b,                    spawn,          CMD("brave") },
    { MODKEY|ControlMask,              XK_l,                    spawn,          CMD("l3afpad") },
	{ MODKEY|ControlMask,              XK_m,                    spawn,          CMD("mailspring") },
	{ MODKEY|ControlMask,              XK_f,                    spawn,          CMD("pcmanfm") },
    { MODKEY|ShiftMask,                XK_Return,               spawn,          CMD("doublecmd") },
    /*
    { MODKEY,                       XK_w,                       spawn,          {.v = bravecmd } },
    { MODKEY,                       XK_t,                       spawn,          {.v = sakuracmd } },
    { MODKEY|ShiftMask,             XK_Return,                  spawn,          {.v = doublecmd } },
    */

    /* Volume and Brightness - monitor and keyboard*/
    { 0,                            XF86XK_AudioLowerVolume,    spawn,          {.v = downvol } },
    { 0,                            XF86XK_AudioMute,           spawn,          {.v = mutevol } },
    { 0,                            XF86XK_AudioRaiseVolume,    spawn,          {.v = upvol   } },
    { 0,                            XF86XK_MonBrightnessUp,     spawn,          {.v = upbright } },
    { 0,                            XF86XK_MonBrightnessDown,   spawn,          {.v = downbright } },
    { 0,                            XF86XK_KbdBrightnessUp,     spawn,          {.v = upKeyBright } },
    { 0,                            XF86XK_KbdBrightnessDown,   spawn,          {.v = downKeyBright } },

    /* Layouts*/
    { MODKEY|ShiftMask,             XK_m,                       setlayout,      {.v = &layouts[0]} },
    { MODKEY|ShiftMask,             XK_t,                       setlayout,      {.v = &layouts[1]} },
    { MODKEY|ShiftMask,             XK_f,                       setlayout,      {.v = &layouts[2]} },
    
    
    /* Window movement */
    { MODKEY,                       XK_comma,                   shiftview,      { .i = -1 } },
    { MODKEY,                       XK_period,                  shiftview,      { .i = 1 } },
    { MODKEY,                       XK_b,                       togglebar,      {0} }, /* bar on / off */
    { MODKEY|ShiftMask,             XK_Right,                   focusstack,     {.i = +1 } },
    { MODKEY|ShiftMask,             XK_Left,                    focusstack,     {.i = -1 } },
    { MODKEY,                       XK_h,                       setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,                       setmfact,       {.f = +0.05} },
    { MODKEY|ShiftMask,             XK_Return,                  zoom,           {0} }, /* focus master window */
    { MODKEY,                       XK_Tab,                     view,           {0} },
    { MODKEY,                       XK_q,                       killclient,     {0} }, /* kill a window */
    { MODKEY,                       XK_space,                   togglefloating, {0} },
    { MODKEY,                       XK_0,                       view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,                       tag,            {.ui = ~0 } },
    { MODKEY,                       XK_Left,                    focusmon,       {.i = -1 } },
    { MODKEY,                       XK_Right,                   focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,                   tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period,                  tagmon,         {.i = +1 } },


    { MODKEY|ControlMask|ShiftMask, XK_q,                       quit,           {0} },
    { MODKEY|ControlMask|ShiftMask, XK_x,                       spawn,          {.v = poweroffcmd } },
    { MODKEY|ControlMask|ShiftMask, XK_s,                       spawn,          {.v = suspendcmd } },

    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)


    /* not used */
    /* { MODKEY,                       XK_space,                   setlayout,      {0} }, */ /* changed with ShiftMask */
    { MODKEY,                       XK_i,                       incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_p,                       incnmaster,     {.i = -1 } },
    
    
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

