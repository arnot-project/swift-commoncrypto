// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CommonCryptoWrapper",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "CommonCryptoWrapper",
            targets: ["CommonCryptoWrapper"]),
    ],
    targets: [
        .target(
            name: "CommonCryptoWrapper",
            dependencies: ["SwiftCommonCrypto"]),
        .systemLibrary(
            name: "SwiftCommonCrypto"),
        .testTarget(
                    name: "CommonCryptoWrapperTests",
                    dependencies: ["CommonCryptoWrapper"])
    ]
)
