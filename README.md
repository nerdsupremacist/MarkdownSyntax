# MarkdownSyntax

Yet another Markdown Parser written in Swift, with a particularly simple public API.
This is a proof of concept Markdown Parser showcasing how to use my own library [Syntax](https://github.com/nerdsupremacist/Syntax).

## Installation
### Swift Package Manager

You can install MarkdownSyntax via [Swift Package Manager](https://swift.org/package-manager/) by adding the following line to your `Package.swift`:

```swift
import PackageDescription

let package = Package(
    [...]
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/MarkdownSyntax.git", from: "0.1.0")
    ]
)
```

## Usage

````swift
let markdown = """
# Text

A view that displays one or more lines of read-only text.

A **text** view draws a string in your app's user interface using a
`Font/body` font that's appropriate for the current platform. You can
choose a different standard font, like `Font/title` or `Font/caption`,
using the `View/font(_:)` view modifier.

```swift
Text("Hamlet")
  .font(.title)
```

![A text view showing the name "Hamlet" in a title font.](SwiftUI-Text-title.png)
"""

let document = try Markdown.parse(markdown)
````

You can inspect everything in the document via `.elements`:

```swift
for element in markdown.elements {
  switch element {
  case .html(let html):
  
  case .heading(let heading):
  
  case .horizontalRule:
  
  case .paragraph(let paragraph):
  
  case .blockquote(let quote):
  
  case .orderedList(let startIndex, let elements):
  
  case .unorderedList(let elements):
  
  case .image(let altText, let link):

  case .codeblock(let language, let code):

  case .reference(let label, let content):

  }
}
```
## Support

MarkdownSyntax does **not** yet fully comply with the [CommonMark Spec](https://spec.commonmark.org/0.29/#indented-code-blocks).
Here's an overview of the features of Markdown that have been implemented. Note there might be quite a lot of special cases that are not handled yet. 

- [x] Headlines
    - [x] Levels 1-4
    - [x] Special handling for Levels 1-2 with `===` and `---` lines below
- [x] Text
    - [x] Bold
    - [x] Italics
    - [x] Links
    - [x] Inline Code
        - [ ] Multibackticks to escape backticks in code
- [x] Images
- [x] References
- [ ] Tables
- [x] Inline HTML
- [x] Blockquotes
- [x] Code Blocks
    - [ ] Multibackticks to escape backticks in code
- [x] Ordered Lists
- [x] Unordered Lists

## Contributions
Contributions are welcome and encouraged!

## License
Syntax is available under the MIT license. See the LICENSE file for more info.
