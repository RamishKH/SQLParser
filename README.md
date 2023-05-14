# SQLParser
SQL PARSER USING BISON AND FLEX

bison -d parser.y
flex lexer.l
gcc parser.tab.c lex.yy.c
./a.out
then write any sql query to check if its valid and parsed by the compiler
