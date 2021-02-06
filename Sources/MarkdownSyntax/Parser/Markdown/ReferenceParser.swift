
import Foundation
import Syntax

struct ReferenceParser: Parser {

   var body: AnyParser<Markdown.Element> {
       return RegularExpression("\\[([^\\n\\]]+)\\]:[ \\t]*(.+)").map { match in
           return Markdown.Element.reference(match[1]!.text, match[2]!.text)
       }
   }

}
