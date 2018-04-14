%{

typedef struct
{
 int ival;
 char str[100];
}tstruct ;

#define YYSTYPE  tstruct

#include "sum.tab.h"

%}

DIGIT  [0-9]
DDIGIT [0-9]+

%%

{DIGIT}+  {
          yylval.ival = atoi(yytext);
          return NUMBER; }
{DDIGIT}+ {
	  yylval.ival = atoi(yytext);
          return NUMBER; 
	  }
[ \t]     /* ignore whitespace */


<<EOF>>   yyterminate();  /* signal end of dialogue */

\n       return yytext[0];
.        return yytext[0];

%%
