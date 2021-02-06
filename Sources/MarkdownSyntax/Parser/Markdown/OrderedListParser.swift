
import Foundation
import Syntax

struct OrderedListParser: Parser {
    var body: AnyParser<Markdown.Element> {
        return Repeat(min: 1) {
            OrderedListElementParser()
        }
        .map { elements in
            let startIndex = elements[0].index
            return Markdown.Element.orderedList(startIndex: startIndex, elements: elements.map(\.text))
        }
    }
}

private struct OrderedListElement {
    let index: Int
    let text: Markdown.Text
}

private struct OrderedListElementParser: Parser {
    var body: AnyParser<OrderedListElement> {
        return Group {
            IntLiteral()

            "."

            Annotated(pattern: "\\S(.*\\S)?") {
                TextElementParser()
            }
        }
        .map { index, annotated in
            OrderedListElement(index: index, text: Markdown.Text(annotated: annotated))
        }
    }
}
