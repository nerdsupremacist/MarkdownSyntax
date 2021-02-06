
import Foundation
import Syntax

struct HeadingParser: Parser {

    var body: AnyParser<Markdown.Element.Heading> {
        Either {
            Either(Markdown.Element.Heading.Level.allCases.reversed()) { level in
                HeadingLineParser(level: level)
            }

            HeadingWithPostfixParser(level: .h1, postfixCharacter: "=")
            HeadingWithPostfixParser(level: .h2, postfixCharacter: "-")
        }
    }

}

private struct HeadingLineParser: Parser {
    let level: Markdown.Element.Heading.Level

    private var prefix: String {
        return Array(repeating: "#", count: level.rawValue).joined()
    }

    var body: AnyParser<Markdown.Element.Heading> {
        return RegularExpression("^[ \\t]*\(NSRegularExpression.escapedPattern(for: prefix))[ \\t]*(\\S.+?)\\s*$").map { match in
            Markdown.Element.Heading(level: level, text: match[1]!.text)
        }
    }
}

private struct HeadingWithPostfixParser: Parser {
    let level: Markdown.Element.Heading.Level
    let postfixCharacter: Character

    var body: AnyParser<Markdown.Element.Heading> {
        return RegularExpression("^[ \\t]*(\\S.*)\\n[ \\t]*\(postfixCharacter){3,}\\s*").map { match in
            Markdown.Element.Heading(level: level, text: match[1]!.text)
        }
    }
}
