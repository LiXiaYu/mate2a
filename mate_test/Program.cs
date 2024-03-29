﻿using System;
using Antlr4.Runtime;
using mate;

namespace mate_test
{
    class Program
    {
        static void Main(string[] args)
        {

            string input = @"#include <stdio.h>
#define MDPEKLF\
KKKKK 33
//shmmm
/*ddd mate */
mate AAA
{
        string aa=""888jjjj"";
};

int main(){

auto a=""ddd"";
return
0;
}";

            var stream = new AntlrInputStream(input);
            var lexer = new mateLexer(stream);
            var tokens = new CommonTokenStream(lexer);
            var parser = new mateParser(tokens);
            var tree = parser.program();

            var visitor = new MateVisitor(input);
            var result = visitor.Visit(tree);

            Console.WriteLine(tree.ToStringTree(parser));
            Console.WriteLine(result);
            Console.WriteLine();
            Console.WriteLine(visitor.ResultText);
            Console.ReadKey();
        }
    }
}
