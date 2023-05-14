%{
#include "parser.tab.h"
%}

%option noyywrap

%%
[ \t\n]     { /* ignore whitespace */ }

"SELECT"  {return SELECT;}
"FROM"    {return FROM;}
"WHERE"   {return WHERE;}


"CREATE" {return CREATE;}
"ALTER" {return ALTER;}
"DROP" {return DROP;}
"DELETE" {return DELETE;}
"INSERT" {return INSERT;}
"UPDATE" {return UPDATE;}

"AVG"     {return AVG;}

"COUNT"   {return COUNT;}

"MAX"     {return MAX;}

"MIN"     {return MIN;}

"SUM"     {return SUM;}

"INTO" {return INTO;}
"SET" {return SET;}
"VALUES" {return VALUES;}

"*"       {return ASTERISK;}
">"       {return GT;}
"<"      {return LT;}
"="       {return EQ;}


[+-]?[0-9]+(\.[0-9]*)?  {return LITERAL;}
'[^']*'|\"[^"]*\"       {return LITERAL;}

"," {return COMMA;}
"(" {return LPAREN;}
")" {return RPAREN;}

[a-zA-Z]+[a-zA-Z0-9_]*  {return IDENTIFIER;}
";"      {return SEMICOLON; }
%%
