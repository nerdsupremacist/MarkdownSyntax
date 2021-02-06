
import Foundation

extension Markdown {
    public enum Element {
        public struct Heading {
            public enum Level: Int, CaseIterable {
                case h1 = 1
                case h2
                case h3
                case h4
            }

            public let level: Level
            public let text: Substring
        }

        case heading(Heading)
        case horizontalRule

        case paragraph(Markdown.Text)

        case blockquote(Substring)

        case orderedList(startIndex: Int, elements: [Markdown.Text])
        case unorderedList(elements: [Markdown.Text])

        case image(name: Substring, link: Substring)
        case codeblock(language: Substring?, code: Substring)

        case reference(Substring, Substring)

        // TODO: Tables + Inline HTML
    }
}
