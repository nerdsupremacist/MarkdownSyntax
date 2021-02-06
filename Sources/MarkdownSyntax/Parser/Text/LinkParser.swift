
import Foundation
import Syntax

struct LinkParser: Parser {

    var body: AnyParser<Markdown.Text.Element> {
        return RegularExpression("\\[([^\\n\\]]*)\\]\\(([^\\n)]*)\\)").map { match in
            return Markdown.Text.Element.link(name: match[1]!.text, link: match[2]!.text)
        }
    }

}
