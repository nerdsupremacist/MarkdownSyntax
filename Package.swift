// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarkdownSyntax",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "MarkdownSyntax",
                 targets: ["MarkdownSyntax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/Syntax.git", from: "1.0.1"),
    ],
    targets: [
        .target(name: "MarkdownSyntax",
                dependencies: ["Syntax"]),
        .testTarget(name: "MarkdownSyntaxTests",
                    dependencies: ["MarkdownSyntax"]),
    ]
)
