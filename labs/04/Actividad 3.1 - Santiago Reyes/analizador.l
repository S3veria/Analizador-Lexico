%%
[\/\/].*                { printf("Comment "); }
f                       { printf("floatdcl "); }
i                       { printf("intdcl "); }
p                       { printf("print "); }
=                       { printf("assign "); }
\+                      { printf("plus "); }
-                       { printf("minus "); }
[0-9]+\.[0-9]+          { printf("float "); }
[0-9]+                  { printf("int "); }
[a-zA-Z]+[a-zA-Z0-9]*   { printf("id:%s ", yytext); }
\n                      { printf("\n"); } // Print newline only when encountering a line break
.
%%
/*** Code Section prints the number of
capital letter present in the given input***/
int yywrap(){}
int main(){
yylex();
 
return 0;
}