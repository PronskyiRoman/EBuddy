// swift-tools-version: 6.0
import PackageDescription
import ProjectDescriptionHelpers

#if TUIST
    import struct ProjectDescription.PackageSettings
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:],
        baseSettings: .baseTargetSettings,
        projectOptions: .baseSPMSettings
    )
#endif

@MainActor let package = Package(
    name: Constants.Strings.appName,
    platforms: [
        .iOS(.v18)
    ],
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
