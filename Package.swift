// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueSeaTradPlusAdapter",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BlueSeaTradPlusAdapter",
            targets: ["BlueSeaTradPlusAdapterTarget"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/blueseasx/BlueSeaSDK-Swift-Package.git",
            exact: "1.9.0"
        ),
        .package(url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git", from: "15.12.0")
    ],
    targets: [
            // This is a wrapper target to configure various settings required by main binary target.
            .target(
                name: "BlueSeaTradPlusAdapterTarget",
                dependencies: [
                    .target(name: "BlueSeaTradPlusAdapter"),
                    .product(name: "BlueSeaSDK", package: "BlueSeaSDK-Swift-Package"),
                    .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                ],
                path: "Sources",
                linkerSettings: [
                    // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                    // For now, these flags should be added manually to the project for integration.
                    .unsafeFlags(["-ObjC"])
                ]
            ),
            .binaryTarget(
                name: "BlueSeaTradPlusAdapter",
                url: "https://sdk.cdn.blueseasx.com/ios/V1.9.0/2026091500/adapter-V1.9.0.0/BlueSeaTradPlusAdapter.xcframework.zip",
                checksum: "7b67b6eed51afd866d56ba644bcc5f7e4779548b815ae87d1f5cfb31cc9bdc46"
            ),
        ]
)
