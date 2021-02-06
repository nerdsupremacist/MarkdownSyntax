
import Foundation
import Syntax

struct MarkdownParser: Parser {
    var body: AnyParser<Markdown> {
        return Repeat {
            MarkdownElementParser()
        }
        .map { Markdown(elements: $0) }
    }
}
