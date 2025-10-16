%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+        { yylval = atoi(yytext); return NUMBER; }
[+\\-*/]      { return yytext[0]; }
\n            { return EOL; }
[ \t]+        ;         /* skip spaces */
.             { /* ignore others */ }
%% 
