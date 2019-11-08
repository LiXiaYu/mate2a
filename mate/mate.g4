grammar mate;

/*
 * Parser Rules
 */
 
program
    : codeblock+
;

codeblock
    : Preprocess #CodeblockPreprocess
    | Comment #CodeblockComment
    | Strings #CodeblockStrings
    | MateKeyWord #CodeblockMateKeyWord
    //| nopattern #CodeblockNoPattern
;

//nopattern
//    : AnyWord
//;

/*
 * Lexer Rules
 */

Preprocess
	: '#' (~[\n\\]* '\\' '\r' '\n')* ~[\n\\]* '\n'
	| '#' ~[\n]* '\n'
;

Strings
    : '"' ('""'|~'"')* '"'
;

MateKeyWord
    : 'mate'
;

//AnyWord
//    : [ \t\r\n]+ .*? [ \t\r\n]+
//;

WS
    : [ \t\r\n]+ ->skip
;

Comment
    : '//' .*? '\n' 
    | '/*' .*? '*/'
;