
import Foundation
import Syntax

extension Markdown {

    public static func parse(_ text: String) throws -> Markdown {
        return try MarkdownParser().parse(text)
    }

}
