// swift-tools-version:5.9
import PackageDescription

// Uses the dynamic xcframework variant with the third-party runtime dependencies
// vendored as their own dynamic xcframeworks (NOT baked into PWCore):
//   Core            -> Frameworks/PWCore.xcframework  (dynamic)
//                      links @rpath/PINCache.framework, @rpath/PINOperation.framework,
//                      @rpath/SSZipArchive.framework
//   DeviceIdentity  -> Frameworks/DeviceIdentity.xcframework (dynamic, depends on PWCore)
//   PINCache / PINOperation / SSZipArchive -> Frameworks/*.xcframework (dynamic)
//
// Those three dynamic xcframeworks are produced by build-thirdparty-xcframeworks.sh in the
// build repo, from the same PWCore.xcworkspace + Pods (use_frameworks!) that build PWCore.
// They MUST be present so dyld can satisfy PWCore's @rpath loads at runtime — a plain
// SPM source dependency on PINCache/ZipArchive would compile *statically* and the app
// would crash at launch with: dyld: Library not loaded: @rpath/PINCache.framework/PINCache.
//
// Binary targets can't declare dependencies, so the xcframeworks are wrapped in a
// `*Targets` source target that attaches the third-party binaries; the library products
// vend the wrapper targets. Dynamic binary targets are auto-embedded & signed into the app.
let package = Package(
    name: "PWCore",
    platforms: [
        .iOS("15.5")
    ],
    products: [
        .library(
            name: "PWCore",
            targets: ["PWCoreTargets"]),
        .library(
            name: "DeviceIdentity",
            targets: ["DeviceIdentityTargets"])
    ],
    targets: [
        // Vendored binary frameworks (dynamic variant)
        .binaryTarget(
            name: "PWCore",
            path: "Frameworks/PWCore.xcframework"
        ),
        .binaryTarget(
            name: "DeviceIdentity",
            path: "Frameworks/DeviceIdentity.xcframework"
        ),

        // Third-party runtime dependencies as dynamic xcframeworks (satisfy PWCore's @rpath loads)
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

        // Wrapper targets that attach the vendored binaries to the products
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
                .target(name: "PWCoreTargets") // DeviceIdentity subspec depends on PWCore/Core
            ],
            path: "DeviceIdentityTargets"
        )
    ]
)
