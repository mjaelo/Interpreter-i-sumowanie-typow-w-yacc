# jfikzad
## Wstęp
Powyższe pliki
bisonbj.y i lexbj.l są zadaniami od pani Beaty Jankowskiej, a bisonjd.y i lexdj.l są od pana J. Dudtkiewicza. 
## Zadania JD
- Przypisanie wartości do zmiennej - variable_name = EQUATION ;
- Wypisanie działania lub zmiennej
- PRINT EQUATION ;
- PRINT VARIABLE ;
- Instrukcja warunkowa - IF CONDITION INSTRUCTION ;
- Pętla while - WHIE VARIABLE ASSIGNMENT INSTRUCTION ;

### 1 Nazwy zmiennych

### 2 Interpreter

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
### zadC
w plikach
### zadD
w plikach

P ={
S->INT S|FLOAT S|HEX S|EXP S| ɛ,
EXP->FLOAT E + INT,
HEX->INT HEX| CHAR HEX| INT| CHAR,
FLOAT->INT . INT,
INT->CYFRA|CYFRA INT,
CYFRA->[0|1|2|3|4|5|6|7|8|9|ɛ],
CHAR->[A|B|C|D|E|F| ε]
}

