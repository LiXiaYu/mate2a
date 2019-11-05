grammar mate;

/*
 * Parser Rules
 */
 
program
    : expression
	| expression expression
;

expression
    : Preprocess
;


/*
 * Lexer Rules
 */

Preprocess
	: '#' (~[\n\\]* '\\' '\r' '\n')* ~[\n\\]* '\n'
	| '#' ~[\n]* '\n'
;

WS : [ \t\r\n]+ -> skip ;