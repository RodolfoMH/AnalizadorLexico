package clases;
import static clases.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
literal=(\"([^\"]*)\"|\'([^\']*)\')+
caracter=('([^\'])\')+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
public {lexeme=yytext(); return Public;}
private {lexeme=yytext(); return Private;}
class {lexeme=yytext(); return Class;}
string {lexeme=yytext(); return String;}
int {lexeme=yytext(); return Int;}
bool {lexeme=yytext(); return Bool;}
double {lexeme=yytext(); return Double;}
float {lexeme=yytext(); return Float;}
long {lexeme=yytext(); return Long;}
short {lexeme=yytext(); return Short;}
char {lexeme=yytext(); return Char;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
do {lexeme=yytext(); return Do;}
"main" {lexeme=yytext(); return Main;}
"{" {lexeme=yytext(); return Llave_a;} 
"}" {lexeme=yytext(); return Llave_c;} 
"(" {lexeme=yytext(); return Parentesis_a;} 
")" {lexeme=yytext(); return Parentesis_c;}
{literal} {lexeme=yytext(); return Literal;}
{caracter} {lexeme=yytext(); return Caracter;}
"," {lexeme=yytext(); return Coma;}
";" {lexeme=yytext(); return PuntoyComa;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}
(true | false)      {lexeme = yytext(); return Op_booleano;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

