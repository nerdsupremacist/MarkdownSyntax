
import Foundation
import Syntax

struct BlockquoteParser: Parser {

    var body: AnyParser<Markdown.Element> {
        return RegularExpression("^>[ \\t]*(.+)[ \\t]*$").map { match in
            return Markdown.Element.blockquote(match[1]!.text)
        }
    }

}
