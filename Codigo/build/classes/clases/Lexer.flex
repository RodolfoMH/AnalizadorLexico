package clases;
import static clases.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
literal=(\"([^\"]*)\"|\'([^\']*)\')+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int |
public |
private |
protected |
class |
return |
bool |
double |
float |
long |
void |
short |
static |
try |
cath |
char |
if |
else |
for |
while {lexeme=yytext(); return Reservadas;}
"{" | "}" | "(" | ")" {lexeme=yytext(); return Delimitador;}
"<" | ">" | "==" | ">=" | "<=" | "!="  {lexeme=yytext(); return Comparador;}
"&&" | "||" | "!" | "true" | "false" {lexeme=yytext(); return Logico;}
{literal} {lexeme=yytext(); return Literal;}
"," {return Coma;}
";" {return PuntoyComa;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

