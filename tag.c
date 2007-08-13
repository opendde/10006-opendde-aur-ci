/* See LICENSE file for copyright and license details. */
#include "dwm.h"
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xatom.h>
#include <X11/Xutil.h>

/* static */

typedef struct {
	const char *prop;
	const char *tags;
	Bool isfloating;
} Rule;

typedef struct {
	regex_t *propregex;
	regex_t *tagregex;
} Regs;

TAGS
RULES

static Regs *regs = NULL;
static unsigned int nrules = 0;
static char prop[512];

/* extern */

void
compileregs(void) {
	unsigned int i;
	regex_t *reg;

	if(regs)
		return;
	nrules = sizeof rule / sizeof rule[0];
	regs = emallocz(nrules * sizeof(Regs));
	for(i = 0; i < nrules; i++) {
		if(rule[i].prop) {
			reg = emallocz(sizeof(regex_t));
			if(regcomp(reg, rule[i].prop, REG_EXTENDED))
				free(reg);
			else
				regs[i].propregex = reg;
		}
		if(rule[i].tags) {
			reg = emallocz(sizeof(regex_t));
			if(regcomp(reg, rule[i].tags, REG_EXTENDED))
				free(reg);
			else
				regs[i].tagregex = reg;
		}
	}
}

Bool
isvisible(Client *c) {
	unsigned int i;

	for(i = 0; i < ntags; i++)
		if(c->tags[i] && seltag[i])
			return True;
	return False;
}

void
settags(Client *c, Client *trans) {
	unsigned int i, j;
	regmatch_t tmp;
	Bool matched = trans != NULL;
	XClassHint ch = { 0 };
	XTextProperty name;

	if(matched) {
		for(i = 0; i < ntags; i++)
			c->tags[i] = trans->tags[i];
		return;
	}
	else {
		/* check if window has set a property */
		name.nitems = 0;
		XGetTextProperty(dpy, c->win, &name, dwmtags);
		if(name.nitems && name.encoding == XA_STRING) {
			strncpy(prop, (char *)name.value, sizeof prop - 1);
			prop[sizeof prop - 1] = '\0';
			XFree(name.value);
			for(i = 0; i < ntags && i < sizeof prop - 1 && prop[i] != '\0'; i++)
				if((c->tags[i] = prop[i] == '+'))
					matched = True;
		}
		if(matched)
			return;
		/* rule matching */
		XGetClassHint(dpy, c->win, &ch);
		snprintf(prop, sizeof prop, "%s:%s:%s",
				ch.res_class ? ch.res_class : "",
				ch.res_name ? ch.res_name : "", c->name);
		for(i = 0; i < nrules; i++)
			if(regs[i].propregex && !regexec(regs[i].propregex, prop, 1, &tmp, 0)) {
				c->isfloating = rule[i].isfloating;
				for(j = 0; regs[i].tagregex && j < ntags; j++) {
					if(!regexec(regs[i].tagregex, tags[j], 1, &tmp, 0)) {
						matched = True;
						c->tags[j] = True;
					}
				}
			}
		if(ch.res_class)
			XFree(ch.res_class);
		if(ch.res_name)
			XFree(ch.res_name);
	}
	if(!matched)
		for(i = 0; i < ntags; i++)
			c->tags[i] = seltag[i];
}

void
tag(const char *arg) {
	int i;

	if(!sel)
		return;
	for(i = 0; i < ntags; i++)
		sel->tags[i] = arg == NULL;
	i = arg ? atoi(arg) : 0;
	if(i >= 0 && i < ntags)
		sel->tags[i] = True;
	if(sel) {
		for(i = 0; i < ntags && i < sizeof prop - 1; i++)
			prop[i] = sel->tags[i] ? '+' : '-';
		prop[i] = '\0';
		XChangeProperty(dpy, sel->win, dwmtags, XA_STRING, 8, PropModeReplace, (unsigned char *)prop, i);
	}
	arrange();
}

void
toggletag(const char *arg) {
	int i, j;

	if(!sel)
		return;
	i = arg ? atoi(arg) : 0;
	sel->tags[i] = !sel->tags[i];
	for(j = 0; j < ntags && !sel->tags[j]; j++);
	if(j == ntags)
		sel->tags[i] = True;
	arrange();
}

void
toggleview(const char *arg) {
	int i, j;

	i = arg ? atoi(arg) : 0;
	seltag[i] = !seltag[i];
	for(j = 0; j < ntags && !seltag[j]; j++);
	if(j == ntags)
		seltag[i] = True; /* cannot toggle last view */
	arrange();
}

void
view(const char *arg) {
	int i;

	for(i = 0; i < ntags; i++)
		seltag[i] = arg == NULL;
	i = arg ? atoi(arg) : 0;
	if(i >= 0 && i < ntags)
		seltag[i] = True;
	arrange();
}
