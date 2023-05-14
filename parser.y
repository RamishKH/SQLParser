%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char* msg);
int yylex(void);
extern FILE* yyin;
%}

%start query

%token SELECT FROM WHERE
%token CREATE ALTER DROP
%token AVG COUNT MAX MIN SUM
%token SET INTO VALUES
%token DELETE INSERT UPDATE
%token EQ GT LT
%token IDENTIFIER LITERAL ASTERISK SEMICOLON
%token COMMA LPAREN RPAREN
%%


query: select_query|alter_query
 | create_query
 | drop_query
 | delete_query
 | insert_query
 | update_query
 ;


select_query: SELECT select_list FROM IDENTIFIER where_clause SEMICOLON {printf("select statement parsed\n");};
alter_query: ALTER IDENTIFIER SEMICOLON {printf("alter statement parsed\n");};

create_query: CREATE IDENTIFIER LPAREN column_def_list RPAREN SEMICOLON {printf("create statement parsed\n");};

column_def_list: IDENTIFIER | IDENTIFIER COMMA column_def_list;


drop_query: DROP IDENTIFIER SEMICOLON {printf("drop statement parsed\n");};

delete_query: DELETE FROM IDENTIFIER where_clause SEMICOLON {printf("delete statement parsed\n");};

insert_query: INSERT INTO IDENTIFIER LPAREN column_def_list RPAREN VALUES LPAREN literal_list RPAREN SEMICOLON {printf("insert statement parsed\n");};

literal_list: LITERAL | LITERAL COMMA literal_list;

update_query: UPDATE IDENTIFIER SET set_clause where_clause SEMICOLON {printf("update statement parsed\n");};

set_clause: IDENTIFIER EQ LITERAL  | IDENTIFIER EQ LITERAL COMMA set_clause;


select_list: ASTERISK 
           | column_list
           |function_list
           ;
           
function_list: function_call
              | function_call COMMA function_list

              ;



function_call: AVG LPAREN IDENTIFIER RPAREN

             | COUNT LPAREN IDENTIFIER RPAREN

             | MAX LPAREN IDENTIFIER RPAREN

             | MIN LPAREN IDENTIFIER RPAREN

             | SUM LPAREN IDENTIFIER RPAREN

             ;

column_list: IDENTIFIER
           | IDENTIFIER COMMA column_list
           ;

where_clause: WHERE condition 
            | /* empty */
            ;

condition: IDENTIFIER operator LITERAL
         ;


operator: EQ | GT | LT
        ;


%%

int main(int argc, char *argv[]) {
  if (argc ==2)
  {
    yyin = fopen(argv [1], "r");
  }
  yyparse();
  return 0;
}

void yyerror(const char* msg) {
  fprintf(stderr, "Parser error: %s\n", msg);
  exit(1);
}
