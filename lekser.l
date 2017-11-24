
/**************************************
  IMPORTANT!
  
  Make sure the folder you have unzipped the files has NO WHITE CHARs in path!

  Make sure your compiler knows where to find 
  flex and yacc applications!
  1. Right click on the name of your project in Solution Explorer.
  2. Click Properties.
  3. In Configuration Properties click VC++ Directories
  4. In right window edit Executable Directories -- add the path
     to folder /gnu/bin. 
  5. That's all folks!
 
*/


%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"
%}
 
%%
;                 return yytext[0];
.
%%
