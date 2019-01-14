%option noyywrap
%{
    #include <iostream>
    #include <string>
    #include "y.tab.h"
    int yyparse();
    int nr_wiersza=1;
%}


int_    ^[0-9]+([ \t]+[0-9]+)+$
float   ^[0-9]+(([ \t]+[0-9]+)[.][0-9]+)+$
hex     ^[0-9]+([ \t]+[0-9A-Fa-f]+)+$
exp     ^[0-9]+([ \t]+[0-9]+[.][0-9]+[E][+-][0-9]+)+$
%%

{int_}  {std::cout<<nr_wiersza<<":"; nr_wiersza++;	yylval.vName = new std::string(yytext);	return INT;}

{float} {std::cout<<nr_wiersza<<":";nr_wiersza++;	yylval.vName = new std::string(yytext);	return FLOAT; }

{hex}   {std::cout<<nr_wiersza<<":";nr_wiersza++;	yylval.vName = new std::string(yytext);	return HEX;}
	
{exp}   {std::cout<<nr_wiersza<<":";nr_wiersza++;	yylval.vName = new std::string(yytext);	return EXP;}

[ \t\n] ;
.	{	return UNK;	}
%%
