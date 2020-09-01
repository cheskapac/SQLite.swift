// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SQLite.swift",
    products: [
        .library(name: "SQLite", targets: ["SQLite"])
    ],
    dependencies: [
        .package(url: "https://github.com/antwork/SQLCipher.git", from: "0.0.4")
    ],
    targets: [
        .target(
            name: "SQLite",
            dependencies: [
                "SQLiteObjc",
                .product(name: "SQLCipher", package: "SQLCipher"),
            ],
            path: "Sources/SQLite",
            swiftSettings: [
                .define("SQLITE_SWIFT_SQLCIPHER")
            ]
        ),
        .target(name: "SQLiteObjc"),
        .testTarget(
            name: "SQLiteTests",
            dependencies: ["SQLite"],
            path: "Tests/SQLiteTests"
        )
    ]
)

#if os(Linux)
    package.dependencies = [.package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")]
    package.targets = [
        .target(name: "SQLite", exclude: ["Extensions/FTS4.swift", "Extensions/FTS5.swift"]),
        .testTarget(name: "SQLiteTests", dependencies: ["SQLite"], path: "Tests/SQLiteTests", exclude: [
            "FTS4Tests.swift",
            "FTS5Tests.swift"
        ])
    ]
#endif
