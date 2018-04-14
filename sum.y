%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
 int ival;
 char str[100];
}tstruct ;

#define YYSTYPE  tstruct

int i = 0;
int yylex();
void yyerror( char *s);



%}


%token    NUMBER

%%

input
    :  /* empty */
    |  input line
    ;

line
    : '\n'
    |  expression '\n'            {  
				     printf(" Sum of %d numbers: %d\n", i,$1.ival );
                                     printf("----------------------\n");
				     i = 0;
                                     }
    ;

expression
	: NUMBER	{ $$.ival = $1.ival; i++;}
	| expression  expression  {$$.ival = $1.ival + $2.ival; }

%%


int main ()
{
  yyparse ();
  return 0;
}

void yyerror (char *s)  /* Called by yyparse on error */
{
  printf ("\terror: %s\n", s);
}


