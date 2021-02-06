
import Foundation
import Syntax

struct TextElementParser: Parser {
    var body: AnyParser<Markdown.Text.Element> {
        Recursive { textElement in
            Either {
                InlineCodeParser()
                BoldParser(element: textElement)
                ItalicsParser(element: textElement)
                LinkParser()
            }
        }
    }
}
