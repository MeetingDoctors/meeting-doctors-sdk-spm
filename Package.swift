// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsSDK",
            targets: ["MeetingDoctorsSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.6.0"))
    ],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "artifacts/MeetingDoctorsCore.xcframework"
        ),
        .target(
            name: "MeetingDoctorsSDK",
            dependencies: [
                "MeetingDoctorsCore",
                .product(name: "CryptoSwift", package: "CryptoSwift")
            ]
        )
    ]
)
