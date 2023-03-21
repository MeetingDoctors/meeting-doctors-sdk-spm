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
    ],
    targets: [
        .binaryTarget(
            name: "MeetingDoctorsCore",
            path: "artifacts/MeetingDoctorsCore.xcframework"
        ),
        .binaryTarget(
            name: "CryptoSwift",
            path: "artifacts/CryptoSwift.xcframework"
        ),
        .target(
            name: "MeetingDoctorsCoreWrapper",
            dependencies: [
                .target(name: "CryptoSwift"),
                .target(name: "MeetingDoctorsCore")
            ]
        ),
        .target(
            name: "MeetingDoctorsSDK",
            dependencies: [
                .target(name: "MeetingDoctorsCoreWrapper")
            ]
        )
    ]
)
