// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "PWCore",
    platforms: [
        .iOS("15.5")
    ],
    products: [
	// Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PWCore",
            targets: ["PWCoreTargets"]),
        .library(
            name: "DeviceIdentity",
            targets: ["DeviceIdentityTargets"])
    ],
    targets: [
        // PWCore binary frameworks
        .binaryTarget(
            name: "PWCore",
            path: "Frameworks/PWCore.xcframework"
        ),
        .binaryTarget(
            name: "DeviceIdentity",
            path: "Frameworks/DeviceIdentity.xcframework"
        ),

        // Third-party runtime dependencies as dynamic xcframeworks 
        .binaryTarget(
            name: "PINCache",
            path: "Frameworks/PINCache.xcframework"
        ),
        .binaryTarget(
            name: "PINOperation",
            path: "Frameworks/PINOperation.xcframework"
        ),
        .binaryTarget(
            name: "SSZipArchive",
            path: "Frameworks/SSZipArchive.xcframework"
        ),

        // Wrapper targets that attach the PWCore binaries to the products
        .target(
            name: "PWCoreTargets",
            dependencies: [
                .target(name: "PWCore"),
                .target(name: "PINCache"),
                .target(name: "PINOperation"),
                .target(name: "SSZipArchive")
            ],
            path: "PWCoreTargets"
        ),
        .target(
            name: "DeviceIdentityTargets",
            dependencies: [
                .target(name: "DeviceIdentity"),
                .target(name: "PWCoreTargets")
            ],
            path: "DeviceIdentityTargets"
        )
    ]
)
