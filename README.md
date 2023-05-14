# SQLParser
SQL PARSER USING BISON AND FLEX
<br>
bison -d parser.y <br>
flex lexer.l<br>
gcc parser.tab.c lex.yy.c<br>
./a.out<br>
then write any sql query to check if its valid and parsed by the compiler<br>
