
import Foundation
import Syntax

struct MarkdownElementParser: Parser {
    var body: AnyParser<Markdown.Element> {
        Either {
            HTMLNodeParser().map(Markdown.Element.html)
            HeadingParser().map(Markdown.Element.heading)
            ImageParser()
            BlockquoteParser()
            CodeBlockParser()
            ReferenceParser()
            HorizontalRuleParser()
            OrderedListParser()
            UnorderedListParser()
            ParagraphParser().map(Markdown.Element.paragraph)
        }
    }
}

