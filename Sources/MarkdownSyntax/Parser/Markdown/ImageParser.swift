
import Foundation
import Syntax

struct ImageParser: Parser {

    var body: AnyParser<Markdown.Element> {
        return RegularExpression("!\\[([^\\n\\]]*)\\]\\(([^\\n)]*)\\)").map { match in
            return Markdown.Element.image(name: match[1]!.text, link: match[2]!.text)
        }
    }

}
