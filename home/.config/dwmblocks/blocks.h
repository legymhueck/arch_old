//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
/*Icon*/	/*Command*/	 	                    /*Update Interval*/       /*Update Signal*/
/*{" 🐧 ", "kernel",		    360,                      2},*/
/*{" 🔺 ", "upt",		        60,		            2},*/
/*{" 📦 "," pacupdate ",	360,	9},*/
/*{" 💻 "," memory ",	6,	1},*/
{""," memory ",	6,	1},
/*{" "," nettraf ",      5,	0},*/
{""," volume ",	2,	10},
/*{" 🔊 "," volume ",	2,	10},*/
{""," clock ",       5,      0},
/*{" 🕑 "," clock ",       5,      0},*/
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
