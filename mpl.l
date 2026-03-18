%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
    /* --- KEYWORDS --- */
"GO"        { return TOKEN_GO; }
"STOP"      { return TOKEN_STOP; }
"IF"        { return TOKEN_IF; }
"ELSE"      { return TOKEN_ELSE; }
"LOOP"      { return TOKEN_LOOP; }
"SHOW"      { return TOKEN_SHOW; }

    /* --- VARIABLE TYPES --- */
"NUM"       { return TYPE_INTEGER; }
"DECIMAL"   { return TYPE_DECIMAL; }
"CHAR"      { return TYPE_CHARACTER; }

    /* --- LOGICAL OPERATORS --- */
"#"         { return OR; }
"$"         { return AND; }

    /* --- TRANSECTIONS OPERATORS --- */
"="         { return ASSIGN; }
";"         { return NOTATION; }
"+"         { return PLUS; }
"-"         { return MINES; }
"*"         { return MULTIPLE; }
"/"         { return DIVISION; }
"("         { return OPEN_BRACKET; }
")"         { return CLOSE_BRACKET; }
">>"        { return OPEN_BLOCK; }
"<<"        { return CLOSE_BLOCK; }

    /* --- comparison operators --- */
"=="        { return IS_EQUAL; }
">"         { return BIGGER; }
"<"         { return SMALLER; }
"!="        { return NOT_EQUAL; }

    /* --- VARUABLES AND NUMBERS GRAMERS --- */
[a-zA-Z][a-zA-Z0-9]*    { return VARIABLE_NAME; }
[0-9]+\.[0-9]+          { return DECIMAL_NUM; }
[0-9]+                  { return INTEGER_NUM; }
\'.\'                   { return CHARACTER; }

    /* --- NO NEED GAPS --- */
[ \t\n]     ;   /* DO NOT WRITE GAPS */
.           { printf("syntax error"); }
%%

int yywrap() { return 1; }