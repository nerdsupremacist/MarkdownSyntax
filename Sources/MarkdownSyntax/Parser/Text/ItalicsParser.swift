
import Foundation
import Syntax

struct ItalicsParser: Parser {
    let element: AnyParser<Markdown.Text.Element>

    var body: AnyParser<Markdown.Text.Element> {
        return Group {
            "*"

            Annotated(pattern: "((.+?)|(\\*\\*))*(?=\\*)") {
                element
            }

            "*"
        }
        .map { Markdown.Text.Element.italics(Markdown.Text(annotated: $0)) }
    }
}
