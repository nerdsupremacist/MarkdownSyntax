import XCTest
@testable import MarkdownSyntax

final class MarkdownSyntaxTests: XCTestCase {
    func testExample() throws {
        let code = """
        <p align="center">
            <img src="logo.png" width="400" max-width="90%" alt="Syntax" />
        </p>

        <p align="center">
            <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" />
            <a href="https://swift.org/package-manager">
                <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
            </a>
            <a href="https://twitter.com/nerdsupremacist">
                <img src="https://img.shields.io/badge/twitter-@nerdsupremacist-blue.svg?style=flat" alt="Twitter: @nerdsupremacist" />
            </a>
        </p>

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
