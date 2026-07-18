// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Premonition",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "PremonitionCore", targets: ["PremonitionCore"]),
        .executable(name: "Premonition", targets: ["PremonitionApp"]),
    ],
    targets: [
        .target(name: "PremonitionCore"),
        .executableTarget(
            name: "PremonitionApp",
            dependencies: ["PremonitionCore"],
            path: "Sources/PremonitionApp"
        ),
        .testTarget(name: "PremonitionCoreTests", dependencies: ["PremonitionCore"]),
        .testTarget(name: "AcceptanceTests", dependencies: ["PremonitionCore"]),
        .testTarget(name: "PremonitionAppTests", dependencies: ["PremonitionApp"]),
    ]
)
