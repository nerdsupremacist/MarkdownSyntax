
import Foundation
import Syntax

struct HorizontalRuleParser: Parser {
    var body: AnyParser<Markdown.Element> {
        Either {
            RegularExpression("^[ \\t]*-{3,}[ \\t]*$").map(to: Markdown.Element.horizontalRule)
            RegularExpression("^[ \\t]*{3,}[ \\t]*$").map(to: Markdown.Element.horizontalRule)
        }
    }
}
