using System;
using System.Collections.Generic;
using System.Text;
using Antlr4.Runtime.Misc;

namespace mate
{
    public class mateVisitor : mateBaseVisitor<object>
    {
        Dictionary<string, object> memory = new Dictionary<string, object>();

        public override object VisitCodeblockMateKeyWord([NotNull] mateParser.CodeblockMateKeyWordContext context)
        {
            return base.VisitCodeblockMateKeyWord(context);
        }

        public override object VisitCodeblockPreprocess([NotNull] mateParser.CodeblockPreprocessContext context)
        {
            return base.VisitCodeblockPreprocess(context);
        }
    }
}
