%{
	#include <string>
	#include <iostream>
	#include <cmath>
	#include <sstream>

	void yyerror(const char*);
	void sumuj_int(std::string&);
	void sumuj_float(std::string&);
	void sumuj_hex(std::string&);
	void sumuj_exp(std::string&);
	int yylex();
%}

%union {    int iValue;    std::string* vName; };
%start S
%token <vName> INT
%token <vName> FLOAT
%token <vName> EXP
%token <vName> HEX
%token UNK 

%%
S : ZADANIE ';' S 
  | /*nic*/
  ;

ZADANIE : ZADANIE INT	{ sumuj_int(*$2);	}
		| ZADANIE FLOAT	{ sumuj_float(*$2);	}
		| ZADANIE HEX	{ sumuj_hex(*$2);	}
		| ZADANIE EXP	{ sumuj_exp(*$2);	}
		| /*nic*/
		;
 
  

%%
void sumuj_int(std::string& linia)
{	
	
	unsigned int suma = 0;
	std::string temp;
	for( unsigned int i = 2; i <= linia.length(); i++)
	{	if( linia[i] != ' ' && linia[i] != '\0') { temp += linia[i]; }
		else if(!temp.empty())
			{	suma += std::stoi(temp); 
				temp.clear();	
			}
	}
	std::cout<<"int: "<<suma<<'\n';
	linia.clear();
}

void sumuj_float(std::string& linia)
{	
float suma = 0;
	std::string temp;
	for( unsigned int i = 2; i <= linia.length(); i++)
	{	if( linia[i] != ' ' && linia[i] != '\0')  { temp += linia[i]; }
		else if(!temp.empty())
		{	suma += std::stof( temp );
			temp.clear();
		}
	}
	std::cout<<"float: "<<suma<<'\n';
	linia.clear();
}

void sumuj_hex(std::string& linia)
{	
unsigned int suma = 0;
	std::string temp;
	for( unsigned int i = 2; i <= linia.length(); i++)
	{	if( linia[i] != ' ' && linia[i] != '\0') { temp += linia[i]; }
		else if(!temp.empty())
			{	unsigned int x = 0;   
				std::stringstream ss;
				ss << std::hex << temp;
				ss >> x;
				suma += x;
				temp.clear();	
			}
	}
	std::cout<<"hex: " << std::hex<< suma <<'\n';
	linia.clear();
}

void sumuj_exp(std::string& linia)
{	
	float suma = 0; int zn=0; int znak=0;float temsu=0;
	std::string temp1,temp2,temp;
	for( unsigned int i = 2; i <= linia.length(); i++)
	{	if(zn==0&& linia[i] != ' ' && linia[i] != '\0')
		{ 	temp1 += linia[i];if(linia[i+1]=='E')
			{if(linia[i+2]=='-')znak=1;else znak=0;  i+=2;zn++;} 
		}
		else if(zn==1&& linia[i] != ' ' && linia[i] != '\0'){ temp2+=linia[i]; }
		else if(!temp1.empty()&&!temp2.empty())
		{	temsu += std::stof( temp1 );
			if(znak==0) temsu *= pow(10,std::stoi(temp2));
			else temsu *= pow(10,-std::stoi(temp2));
			suma+=temsu; temsu=0;zn=0;
			temp1.clear();temp2.clear();
		}
	}

	std::ostringstream ss;ss << suma;	temp=std::string(ss.str());
	zn=1;int s=0;
	for(int i=0;i<temp.size();i++)
	{
		if(temp[i]=='.'){zn=0;}
		else if(zn==1)temp1+=temp[i];
		else temp2+= temp[i];
	}s=0;
	while(suma>9 ||suma<0.9 )
	{// 3.1E+1 2.1E-1
	//std::cout<<"1: "<<temp1<<" 2:"<<temp2<<"\n";
	//std::cout<<"exp: "<<suma<<"E+"<<s<<"\n";
		s++;temp1=temp2="";zn=1;
		std::ostringstream ss;ss << suma;	temp=std::string(ss.str());
		for(int i=0;i<temp.size();i++)
		{
			if(temp[i]=='.'){zn=0;}
			else if(zn==1)temp1+=temp[i];
			else temp2+= temp[i];
		}

		if(suma>9)
		{suma/=10;znak=0;}
		else if( suma<0.9)
		{suma*=10;znak=1;}
	}

	std::cout<<"exp: "<<suma;if(znak==0)std::cout<<"E+"<<s<<"\n";else if(znak==1)std::cout<<"E-"<<s<<"\n";
		linia.clear();
}


int main() {	yyparse();}
void yyerror(const char* str) {	std::cout << std::string(str) << '\n';}
int yywrap(){	return 0;}

