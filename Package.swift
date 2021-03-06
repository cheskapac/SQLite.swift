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
                "SQLCipher"
            ],
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
