using Antlr4.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Text;

namespace mate
{
    public class MateVisitor : mateBaseVisitor<object>
    {
        string originText;
        string[] originTextColumns;

        public MateVisitor(string originText)
        {
            this.originText = originText;
            this.originTextColumns = this.originText.Split(Environment.NewLine, StringSplitOptions.None);
        }

        public string ResultText
        {
            get
            {
                StringBuilder sb = new StringBuilder();
                foreach(var s in this.originTextColumns)
                {
                    sb.AppendLine(s);
                }

                return sb.ToString();
            }
        }

        public override object VisitCodeblockComment([NotNull] mateParser.CodeblockCommentContext context)
        {
            return base.VisitCodeblockComment(context);
        }

        public override object VisitCodeblockMateKeyWord([NotNull] mateParser.CodeblockMateKeyWordContext context)
        {
            var token = context.Start;

            StringBuilder sb = new StringBuilder(originTextColumns[token.Line-1]);
            sb.Remove(token.Column, token.Text.Length);
            sb.Insert(token.Column, "class");
            originTextColumns[token.Line - 1] = sb.ToString();
            return base.VisitCodeblockMateKeyWord(context);
        }

        public override object VisitCodeblockPreprocess([NotNull] mateParser.CodeblockPreprocessContext context)
        {
            return base.VisitCodeblockPreprocess(context);
        }

        public override object VisitCodeblockStrings([NotNull] mateParser.CodeblockStringsContext context)
        {
            return base.VisitCodeblockStrings(context);
        }
    }
}
