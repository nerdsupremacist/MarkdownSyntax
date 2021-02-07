import XCTest
@testable import MarkdownSyntax

final class MarkdownSyntaxTests: XCTestCase {
    func testExample() throws {
        let code = """
        <div class="center">
            Hello world!
        </div>

        # Hello World
        ## This is another heading

        We can use **bold** as well as *italics* for text ;)
        Or even [links](https://google.com)!

        > this is a quote

        I can also write `inline code` right here.
        Or more complex codeblocks:

        ```swift
        let markdown = "Awesome!"
        ```

        ------

        I can also write lists:

        1. One
        1. Two
        1. Three

        Even unordered lists:

        - something
        - some other thing

        Here's some image

        ![Image](1)

        [1]: http://url/a.png
        """

        let markdown = try Markdown.parse(code)
        print(markdown.elements)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
