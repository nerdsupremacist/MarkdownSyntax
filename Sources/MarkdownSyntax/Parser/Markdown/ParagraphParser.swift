
import Foundation
import Syntax

struct ParagraphParser: Parser {
    var body: AnyParser<Markdown.Text> {
        return Annotated(pattern: "^(.*\\S.*)(\\n.+(.*\\S.*))*$") {
            TextElementParser()
        }
        .map { Markdown.Text(annotated: $0) }
    }
}
