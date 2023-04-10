// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription

let package = Package(
    name: "Game of Life",
    platforms: [
        .iOS("16.1")
    ],
    products: [
        .library(
            name: "GameOfLife",
            targets: ["GameOfLife"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-async-algorithms", "0.1.0"..<"0.2.0"),
        .package(url: "https://github.com/kkk669/swift-collections", "1.2.0"..<"1.3.0"),
    ],
    targets: [
        .target(
            name: "GameOfLife",
            dependencies: [
                .product(
                    name: "BitCollections",
                    package: "swift-collections",
                    moduleAliases: ["BitCollections": "MyBitCollections"]
                )
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("StrictConcurrency"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
            ]
        ),
        .executableTarget(
            name: "AppModule",
            dependencies: [
                "GameOfLife",
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-enable-actor-data-race-checks"]),
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("StrictConcurrency"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
            ]
        ),
    ]
)

#if canImport(AppleProductTypes)
    import AppleProductTypes

    package.products += [
        .iOSApplication(
            name: "Game of Life",
            targets: ["AppModule"],
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .gamepad),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone,
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad])),
            ],
            appCategory: .simulationGames
        )
    ]
#endif
