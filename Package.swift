// swift-tools-version:5.6
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
            exact: "1.9.1"
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
                path: "Sources"
            ),
            .binaryTarget(
                name: "BlueSeaTradPlusAdapter",
                url: "https://sdk.cdn.blueseasx.com/ios/V1.9.1/2026101000/adapter-V1.9.1.0/BlueSeaTradPlusAdapter.xcframework.zip",
                checksum: "ec956937ea52452804273408e9ee168fb4f581bca8442007be029f7463809945"
            ),
        ]
)
