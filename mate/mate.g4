grammar mate;

/*
 * Parser Rules
 */
 
program
    : codeblock+
;

codeblock
    : Preprocess #CodeblockPreprocess
    | Strings #CodeblockStrings
    | MateKeyWord #CodeblockMateKeyWord
    | nopattern #CodeblockNoPattern
;

nopattern
    : AnyWord
;

/*
 * Lexer Rules
 */

Preprocess
	: '#' (~[\n\\]* '\\' '\r' '\n')* ~[\n\\]* '\n'
	| '#' ~[\n]* '\n'
;

Strings
    : Encodingprefix? '"' Schar* '"'
    | Encodingprefix? 'R' Rawstring
;

fragment Encodingprefix
    : 'u8'
    | 'u'
    | 'U'
    | 'L'
;

fragment Schar
    : ~ ["\\\r\n]
    | Escapesequence
    | Universalcharactername
;
fragment Rawstring
    : '"' .*? '(' .*? ')' .*? '"'
;

fragment Escapesequence
    : Simpleescapesequence
    | Octalescapesequence
    | Hexadecimalescapesequence
;

fragment Simpleescapesequence
    : '\\\''
    | '\\"'
    | '\\?'
    | '\\\\'
    | '\\a'
    | '\\b'
    | '\\f'
    | '\\n'
    | '\\r'
    | '\\t'
    | '\\v'
;

fragment Octalescapesequence
    : '\\' OCTALDIGIT
    | '\\' OCTALDIGIT OCTALDIGIT
    | '\\' OCTALDIGIT OCTALDIGIT OCTALDIGIT
;

fragment Hexadecimalescapesequence
    : '\\x' HEXADECIMALDIGIT+
;
fragment Universalcharactername
    : '\\u' Hexquad
    | '\\U' Hexquad Hexquad
;
fragment OCTALDIGIT
    : [0-7]
;
fragment HEXADECIMALDIGIT
    : [0-9a-fA-F]
;
fragment Hexquad
    : HEXADECIMALDIGIT HEXADECIMALDIGIT HEXADECIMALDIGIT HEXADECIMALDIGIT
;


MateKeyWord
    : 'mate'
;

AnyWord
    : WS .*? WS
;

WS : [ \t\r\n]+ -> skip ;