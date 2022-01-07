// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PWCore",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PWCore",
            targets: ["PWCore"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .binaryTarget(
            name: "PWCore",
            path: "Frameworks/PWCore.xcframework"
        )
    ]
)
