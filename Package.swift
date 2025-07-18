// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Shared",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(name: "Shared", targets: ["Shared"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: ["Kingfisher"]
        )
    ]
)
