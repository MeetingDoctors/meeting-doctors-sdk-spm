// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsCore",
            targets: ["MeetingDoctorsCoreWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .exact("1.6.0"))
    ],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "artifacts/MeetingDoctorsCore.xcframework"
        ),
        .target(
            name: "MeetingDoctorsCoreWrapper",
            dependencies: [
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .target(name: "MeetingDoctorsCore")
            ],
            path: "MeetingDoctorsCoreWrapper"
        )
    ]
)
