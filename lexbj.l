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

{int_}  {
std::cout<<nr_wiersza<<":"; nr_wiersza++;
std::string temp=std::string(yytext);std::string t2;
int i=0; while(temp[0]!=' '){t2.push_back(temp[0]);temp.erase(temp.begin());i++;}	
if(std::stoi(t2)!=nr_wiersza-1) return 0;
yylval.vName = new std::string(temp);	return INT;}

{float} {std::cout<<nr_wiersza<<":"; nr_wiersza++;
std::string temp=std::string(yytext);std::string t2;
int i=0; while(temp[0]!=' '){t2.push_back(temp[0]);temp.erase(temp.begin());i++;}	
if(std::stoi(t2)!=nr_wiersza-1) return 0;
yylval.vName = new std::string(temp);	return FLOAT; }

{hex}   {std::cout<<nr_wiersza<<":"; nr_wiersza++;
std::string temp=std::string(yytext);std::string t2;
int i=0; while(temp[0]!=' '){t2.push_back(temp[0]);temp.erase(temp.begin());i++;}	
if(std::stoi(t2)!=nr_wiersza-1) return 0;
yylval.vName = new std::string(temp);	return HEX;}
	
{exp}   {std::cout<<nr_wiersza<<":"; nr_wiersza++;
std::string temp=std::string(yytext);std::string t2;
int i=0; while(temp[0]!=' '){t2.push_back(temp[0]);temp.erase(temp.begin());i++;}	
if(std::stoi(t2)!=nr_wiersza-1) return 0;
yylval.vName = new std::string(temp);	return EXP;}

[ \t\n] ;
.	{	return UNK;	}
%%
