%{
#include "string.h"
#include "y.tab.h"
int yyparse();
int yywrap();
%}
liczby [0-9]+
dzialanie [[+]|[\]|[-]|([*])|=|;|>|<|(==)]
wyraz [a-z]+

%%
"PRINT" return PRINT;
"IF" return IF;
"WHILE" return WHILE;

{wyraz} {
	int l= strlen(yytext);
	yylval.vName= malloc(l*sizeof(char));
	strcpy(yylval.vName,yytext);
	return ZMIENNA;
}
{liczby} {
	yylval.iValue = atoi(yytext);
	return LICZBA;
	}
{dzialanie} {
	return yytext[0];
	}
	
[ \t\n] ;
.	{
	return UNK;
	}
%%