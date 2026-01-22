// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FocusUtils",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "FocusUtils", targets: ["FocusUtils"]),
        .executable(name: "mvmouse", targets: ["mvmouse"])
    ],
    targets: [
        .target(name: "FocusUtils"),
        .executableTarget(
            name: "mvmouse",
            dependencies: ["FocusUtils"]
        )
    ]
)
