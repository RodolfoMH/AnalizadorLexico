package clases;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
literal=(\"([^\"]*)\"|\'([^\']*)\')+
caracter=('([^\'])\')+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
return {return new Symbol(sym.Return, yychar, yyline, yytext());}
public {return new Symbol(sym.Public, yychar, yyline, yytext());}
private {return new Symbol(sym.Private, yychar, yyline, yytext());}
class {return new Symbol(sym.Class, yychar, yyline, yytext());}
string {return new Symbol(sym.String, yychar, yyline, yytext());}
int {return new Symbol(sym.Int, yychar, yyline, yytext());}
bool {return new Symbol(sym.Bool, yychar, yyline, yytext()); }
double {return new Symbol(sym.Double, yychar, yyline, yytext()); }
float {return new Symbol(sym.Float, yychar, yyline, yytext()); }
long {return new Symbol(sym.Long, yychar, yyline, yytext()); }
short {return new Symbol(sym.Short, yychar, yyline, yytext()); }
char {return new Symbol(sym.Char, yychar, yyline, yytext()); }
if {return new Symbol(sym.If, yychar, yyline, yytext()); }
else {return new Symbol(sym.Else, yychar, yyline, yytext()); }
while {return new Symbol(sym.While, yychar, yyline, yytext()); }
do {return new Symbol(sym.Do, yychar, yyline, yytext()); }
"main" {return new Symbol(sym.Main, yychar, yyline, yytext()); }
"{" {return new Symbol(sym.Llave_a, yychar, yyline, yytext());} 
"}" {return new Symbol(sym.Llave_c, yychar, yyline, yytext()); } 
"(" {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext()); } 
")" {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext()); }
{literal} {return new Symbol(sym.Literal, yychar, yyline, yytext());}
{caracter} {return new Symbol(sym.Caracter, yychar, yyline, yytext());}
"," {return new Symbol(sym.Coma, yychar, yyline, yytext()); }
";" {return new Symbol(sym.PuntoyComa, yychar, yyline, yytext()); }
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext()); }
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext()); }
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext()); }
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext()); }
"/" {return new Symbol(sym.Division, yychar, yyline, yytext()); }
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext()); }
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext()); }
(true | false)      {return new Symbol(sym.Op_booleano, yychar, yyline, yytext()); }
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext()); }


