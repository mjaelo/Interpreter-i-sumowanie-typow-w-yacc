# JFiK lab 6          Marcin Jasiński          Informatyka WE        sem3
## Wstęp
Powyższe pliki działają używając lex i bisona.
bisonbj.y i lexbj.l są zadaniami od pani Beaty Jankowskiej, a bisonjd.y i lexjd.l są od pana J. Dudkiewicza. 

## Zadania JD
### o programie
#### możliwe komendy w programie:
- Nadanie zmiennej wartosci - Zmienna = Expr ;
- Wypisanie działania lub zmiennej - PRINT Expr, PRINT Zmienna ;
- Instrukcja warunkowa - IF Expr Expr ;
- Pętla while - WHILE Zmienna Expr Expr ;
#### przykładowy program
- a=9;
- b=3;
- c=5;
- a=a+c; /*WHILE c c=c-1 a=a+1;*/
- IF b>a wieksze=b;
- IF b<a wieksze=a;
- PRINT wieksze;


### 1 Nazwy zmiennych
Początkowy program uznawał za nazwy zmiennych tylko pojedyńcze znaki. W tym zadaniu rozwiązałem ten problem za pomocą użycia tablicy char. Starczyło zmienić wyrażenie regularne w skanrze, aby uwzlględniał wyrany zamiast pojedynczych liter.

### 2 Interpreter
Początkowy program nie uwzględiał kolejności działań. Rozwiązałem ten problem defiiując %type <iValue> Expr i %type <iValue> Term, gdzie Expr realizuje dodawania i odejmowanie, a Term określa mnożenie i dzielenie

### 3 Dodatkowe instrukcje
definiuję dodatkowe tokeny if i while
#### IF Expr Expr;
np. IF a<3 PRINT a;9
jeżeli jest spełniony warunek a<3, wykonywana jest instrukcja. W preciwnym wypadku nic się nie dzieje. (oprócz wyświetlenia komunikatu o niespełnieniu warunku.)
#### WHILE Zmienna Expr Expr;
***instrukcja warunkowa if dziala, ale pętla while nie, więc jest tylko omówione ogólne działanie***
np. WHILE b b=b-1; a=a+1;
dopuki zmienna b jest rózna od 0, zmienna ta jest dekrementowana (wykonywana jest pierwsze Expr) i własciwa instrukcja opisana w Expr. Pętla ta jest dopiero przerywana, gdy b jest równe 0. Do tego czasu program wraca do wykonanych już instrukcji.

### podziękowania
Chciałbym podziękować rodzinie za wsparcie, Tomaszowi Kiliańczykowi za pomoc w zrozumieniu bisona i Jakubowi Dudkiewiczowi za wzbudzenie we mnie zainteresowania językami formalnymi i kompilatorami

## Zadania BJ
### zadA
wyrażenie regularne definiujące opisany zbiór danych:
- ^(
- ([ \t]+[0-9]+)+
- |(([ \t]+[0-9]+)([.][0-9]+)?)+
- |([ \t]+[0-9]+[.][0-9]+[E][+-][0-9]+)+
- |([ \t]+[0-9A-F]+)+
- )$
linijki po kolei przyjmują liinijki wyrażeń typu: Int float exp hex.

### zadB
- G = <V, T, P, S >, gdzie
- V – zbiór symboli nieterminalnych, 
- T – zbiór symboli terminalnych, 
- P – lista produkcji,
- S – symbol początkowy
- V = {CYFRA, CHAR, INT, HEX, FLOAT, EXP, S}
- T = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F, +, ., ε }
- P ={
S->INT S|FLOAT S|HEX S|EXP S| ɛ,
EXP->FLOAT E + INT,
HEX->INT HEX| CHAR HEX| INT| CHAR,
FLOAT->INT . INT,
INT->CYFRA|CYFRA INT,
CYFRA->[0|1|2|3|4|5|6|7|8|9|ɛ],
CHAR->[A|B|C|D|E|F|ε]
}

### zadC
program w plikach
w lex program za pomocą wyrażeń regularnych rospoznaje linie danego tyou. w bijcjonie wywoluje funkcje rozdzielające wyrażenia i sumujące je. następnie, suma jest przetwarzana na odpowiedni typ.
- np. 2.1 3.1      5.9
- float: 11.1
### zadD
program w plikach
modyfikacja wyrażen regularnych z pliku .l, by przyjmował na początku numery wierszy w odpowiedniej kolejnosci. W przypadku błedu, program kończy pracę.
