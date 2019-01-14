%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	void yyerror(char*);
	
	char *string;//shift reduce conflict
	int yylex();
	int liczbaZmiennych = 0;
	char **zmienne;
	int *wartosci;
	int indeksZmiennej(char *nazwa);
	int wynik_if=1;
	void whi(char*,char*);
%}

%union {
    int iValue;
    char *vName;
};

%start S
%token <iValue> LICZBA 
%type <iValue> Expr
%type <iValue> Term

%type <vName> ZMIENNA
%token UNK PRINT ZMIENNA IF WHILE



%%
S : ZADANIE ';' S
  | /*nic*/
  ;

ZADANIE : PRINT Expr {if (wynik_if==1) printf("%d",$2);}
		| IF Expr ZADANIE
		{	//printf("\njestem\n");
			if(wynik_if==0){printf("warunek nie spelniony\n");}
			else if(wynik_if==1)printf("warunek spelniony\n");
			else printf("error\n");
			wynik_if=1;
		}
		| WHILE ZMIENNA Expr ZADANIE
		{	printf("jestem %s\n",$2);
			if($2==0){wynik_if=1;}
			if (wynik_if==0){printf("nie spelniony\n");}
			else if(wynik_if==1)printf("ok\n");
			else printf("error\n");
			wynik_if=1;
		}/*a=5;b=0;WHILE a a=a-1 b=b+1;*/
		| ZMIENNA '=' Expr 
		{if(wynik_if==1)
			if(indeksZmiennej($1)>=0)
			{
				printf("zmienna %s istnieje, przypisano do niej wartosc %d\n",$1,$3);
				wartosci[indeksZmiennej($1)] = $3;
			}
			else
			{
				printf("zmienna %s nie istnieje, utworzono ja i przypisano do niej wartosc %d\n",$1,$3);
				zmienne = realloc(zmienne, sizeof(char*)* (liczbaZmiennych+1));
				wartosci = realloc(wartosci, sizeof(int) * (liczbaZmiennych + 1));
				zmienne[liczbaZmiennych] = $1;
				wartosci[liczbaZmiennych] = $3;
				liczbaZmiennych += 1;
			}
		}
		;

Expr : Term	{$$ = $1;}
  | ZMIENNA {$$ = wartosci[indeksZmiennej($1)]; printf("indeks pobieranej zmiennej to %d\n",indeksZmiennej($1));}
  | Expr '+' Term {$$ = $1 + $3;}
  | Expr '-' Term {$$ = $1 - $3;}

  | Expr '>' Term 
  {
	if($1>$3) wynik_if=1;
  	else wynik_if=0;
	printf("wynik to %i \n",wynik_if);
	$$ = wynik_if;
  }	/*IF 3>4 a=5;*/
  | Expr '<' Term 
  {
	if($1<$3) wynik_if=1;
  	else wynik_if=0;
	printf("wynik to %i \n",wynik_if);
	$$ = wynik_if;
  }	
  | Expr '=' Term 
  {
	if($1==$3) wynik_if=1;
  	else wynik_if=0;
	printf("wynik to %i \n",wynik_if);
	$$ = wynik_if;
  }	
  ;


Term : LICZBA {$$ = $1;}
  |ZMIENNA {$$ = wartosci[indeksZmiennej($1)]; printf("indeks pobieranej zmiennej to %d\n",indeksZmiennej($1));}
  |Term '*' LICZBA {$$ = $1*$3;}
  |Term '/' LICZBA {$$ = $1/$3;}
  ;
%%

void whi(char* war,char* inst){}
int main()
{
	yyparse();
}
void yyerror(char* str)
{
	printf("%s",str);
}
int yywrap()
{
	return 0;
}
int indeksZmiennej(char *nazwa)
{
	for(int i = 0; i<liczbaZmiennych; i++)
	{
		if(strcmp(nazwa,zmienne[i]) == 0)
			return i;
	}
	return -1;
}
