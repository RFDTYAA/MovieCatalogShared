// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [
        // Dependensi yang digunakan oleh modul Shared
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: ["Kingfisher"],
            path: "Shared", // Lokasi source code
            resources: [
                // Daftarkan folder Assets agar bisa digunakan
                .process("Assets.xcassets")
            ]
        )
    ]
)