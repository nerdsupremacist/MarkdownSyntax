
import Foundation
import Syntax

struct UnorderedListParser: Parser {

    var body: AnyParser<Markdown.Element> {
        return Repeat(min: 1) {
            "-"

            Annotated(pattern: "\\S(.*\\S)?") {
                TextElementParser()
            }
        }
        .map { Markdown.Element.unorderedList(elements: $0.map { Markdown.Text(annotated: $0) }) }
    }

}
