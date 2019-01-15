# jfikzad
## Wstęp
Powyższe pliki działają używając lex i bisona.
bisonbj.y i lexbj.l są zadaniami od pani Beaty Jankowskiej, a bisonjd.y i lexdj.l są od pana J. Dudtkiewicza. 

## Zadania JD
możliwe komendy w programie:
- Nadanie zmiennej wartosci - variable_name = Expr ;
- Wypisanie działania lub zmiennej - PRINT Expr, PRINT Zmienna ;
- Instrukcja warunkowa - IF Expr Expr ;
- Pętla while - WHILE Zmienna Expr Expr ;

### 1 Nazwy zmiennych
Początkowy program uznawał za nazwy zmiennych tylko pojedyńcze znaki. W tym zadaniu rozwiązałem ten problem za pomocą użycia tablicy char.

### 2 Interpreter
Początkowy program nie uwzględiał kolejności działań. Rozwiązałem ten problem defiiując

### 3 Dodatkowe instrukcje
***komenka if dziala, ale pętla while nie***
definiuję dodatkowe tokeny if i while


## Zadania BJ
### zadA
wyrażenie regularne definiujące opisany zbiór danych:
^(
([ \t]+[0-9]+)+
|(([ \t]+[0-9]+)([.][0-9]+)?)+
|([ \t]+[0-9]+[.][0-9]+[E][+-][0-9]+)+
|([ \t]+[0-9A-F]+)+
)$
Int float exp hex

### zadB
G = <V, T, P, S >, gdzie
V – zbiór symboli nieterminalnych, 
T – zbiór symboli terminalnych, 
P – lista produkcji,
S – symbol początkowy
V = {CYFRA, CHAR, INT, HEX, FLOAT, EXP, S}
T = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F, +, ., ε }
P ={
S->INT S|FLOAT S|HEX S|EXP S| ɛ,
EXP->FLOAT E + INT,
HEX->INT HEX| CHAR HEX| INT| CHAR,
FLOAT->INT . INT,
INT->CYFRA|CYFRA INT,
CYFRA->[0|1|2|3|4|5|6|7|8|9|ɛ],
CHAR->[A|B|C|D|E|F| ε]
}

### zadC
w plikach
w lex program za pomocą wyrażeń regularnych rospoznaje linie danego tyou. w bijcjonie wywoluje funkcje rozdzielające wyrażenia i sumujące je. następnie, suma jest przetwarzana na odpowiedni język
### zadD
w plikach
modyfikacja pliku .l, by przyjmował na początku numery wierszy w odpowiedniej kolejnosci. W przypadku błedu, program kończy pracę.
