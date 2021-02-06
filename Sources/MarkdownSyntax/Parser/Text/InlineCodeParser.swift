
import Foundation
import Syntax

struct InlineCodeParser: Parser {
    var body: AnyParser<Markdown.Text.Element> {
        return RegularExpression("`([^\\n`]+)`").map { match in
            return Markdown.Text.Element.inlineCode(match[1]!.text)
        }
    }
}
