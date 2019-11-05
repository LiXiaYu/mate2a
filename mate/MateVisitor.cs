using System;
using System.Collections.Generic;
using System.Text;
using Antlr4.Runtime.Misc;

namespace mate
{
    public class mateVisitor : mateBaseVisitor<object>
    {
        Dictionary<string, object> memory = new Dictionary<string, object>();

        public override object VisitExpression([NotNull] mateParser.ExpressionContext context)
        {
            return base.VisitExpression(context);
        }
    }
}
