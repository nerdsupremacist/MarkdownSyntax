
import Foundation
import Syntax

extension Markdown {

    public class Text {
        public enum Element {
            case link(name: Substring, link: Substring)
            case bold(Text)
            case italics(Text)
            case inlineCode(Substring)
        }

        public let annotated: AnnotatedString<Element>

        init(annotated: AnnotatedString<Element>) {
            self.annotated = annotated
        }
    }

}
