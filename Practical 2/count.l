%{
 #include<stdio.h>
 int lc = 0 , tc = 0 , ch = 0 , wc = 0 , sc = 0;
 %}
 %%
\n                { lc++; ch ++; }
\t    	         { tc++; ch ++; }
“  “               { sc++; ch ++; }
[^\t\n ]+     { wc++; ch += yyleng; }
 %%
 int yywrap() { return 1; }
 int main() {
printf("Enter a sentence : ");
yylex();
printf("Number of lines : %d\n" , lc);
printf("Number of spaces : %d\n" , sc);
printf("Number of tabs , words , charcter : %d , %d , %d\n" , tc , wc , ch);
return 0;
 }
