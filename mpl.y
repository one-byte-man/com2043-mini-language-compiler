%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror ();
int yylex();
%}

/* --- TOKENS --- */
%token TOKEN_GO TOKEN_STOP TOKEN_IF TOKEN_ELSE TOKEN_LOOP TOKEN_SHOW
%token TYPE_INTEGER TYPE_DECIMAL TYPE_CHARACTER
%token OR AND IS_EQUAL BIGGER SMALLER NOT_EQUAL
%token ASSIGN NOTATION PLUS MINES MULTIPLE DIVISION OPEN_BRACKET CLOSE_BRACKET OPEN_BLOCK CLOSE_BLOCK
%token VARIABLE_NAME INTEGER_NUM DECIMAL_NUM CHARACTER

%%
/* --- GRAMMAR --- */
program :
    TOKEN_GO statements TOKEN_STOP
    {printf("OK\n");} ;

statements: /* Empty */ | statements statement ;

statement:
      TYPE_INTEGER VARIABLE_NAME NOTATION
    | TYPE_DECIMAL VARIABLE_NAME NOTATION
    | TYPE_CHARACTER VARIABLE_NAME NOTATION
    | TYPE_INTEGER VARIABLE_NAME ASSIGN expression NOTATION
    | TYPE_DECIMAL VARIABLE_NAME ASSIGN expression NOTATION
    | TYPE_CHARACTER VARIABLE_NAME ASSIGN expression NOTATION
    | VARIABLE_NAME ASSIGN expression NOTATION
    | TOKEN_IF condition OPEN_BLOCK statements CLOSE_BLOCK
    | TOKEN_IF condition OPEN_BLOCK statements CLOSE_BLOCK TOKEN_ELSE OPEN_BLOCK statements CLOSE_BLOCK
    | TOKEN_LOOP condition OPEN_BLOCK statements CLOSE_BLOCK
    | TOKEN_SHOW OPEN_BRACKET condition CLOSE_BRACKET NOTATION
    | TOKEN_SHOW OPEN_BRACKET expression CLOSE_BRACKET NOTATION ;

condition:
      condition OR logic_term
    | logic_term ;

logic_term:
      logic_term AND comparison
    | comparison ;

comparison:
      expression IS_EQUAL expression
    | expression BIGGER expression
    | expression SMALLER expression
    | expression NOT_EQUAL expression
    | OPEN_BRACKET condition CLOSE_BRACKET ;

expression:
      expression PLUS term
    | expression MINES term
    | term ;

term:
      term MULTIPLE factor
    | term DIVISION factor
    | factor ;


factor:
      OPEN_BRACKET expression CLOSE_BRACKET
    | INTEGER_NUM
    | DECIMAL_NUM
    | CHARACTER
    | VARIABLE_NAME ;
%%

int main() {
    yyparse();
    return 0;
}

void yyerror() {
    printf("syntax error\n");
}