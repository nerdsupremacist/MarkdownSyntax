
import Foundation
import Syntax

struct CodeBlockParser: Parser {

    var body: AnyParser<Markdown.Element> {
        return RegularExpression("`{3}(.*)\\n((.|\\n)+?)`{3}").map { match in
            let language = match[1]!.text
            return Markdown.Element.codeblock(language: language.isEmpty ? nil : language, code: match[2]!.text)
        }
    }

}
