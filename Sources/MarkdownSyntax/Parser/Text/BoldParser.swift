
import Foundation
import Syntax

struct BoldParser: Parser {
    let element: AnyParser<Markdown.Text.Element>

    var body: AnyParser<Markdown.Text.Element> {
        return Group {
            "**"

            Annotated(pattern: ".+?(?=\\*\\*)") {
                element
            }

            "**"
        }
        .map { Markdown.Text.Element.bold(Markdown.Text(annotated: $0)) }
    }
}
