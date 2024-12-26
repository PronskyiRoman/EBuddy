//
//  TargetGenerator.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

protocol TargetGenerator {
    static func generate(targetOfModule module: Module) -> Target
}

extension TargetGenerator {
    static func generate(initialTargetOfModule module: Module) -> Target {
        baseTarget(of: module)
    }

    static func generate(initialTestTargetOfModule module: Module) -> Target {
        baseTestTarget(of: module)
    }

    static var sources: [String] {
        FileConstants.excludeSourcesList
    }
}

private enum FileConstants {
    static let testSources = ["**/Test*.swift", "**/Mock*.swift"]
    static var excludeSourcesList: [String] { testSources.map { "**/" + $0 } + ["**/Project.swift"] }
}

private extension TargetGenerator {
    static func baseTestTarget(of module: Module) -> Target {
        let name = module.name + "Tests"
        var testModule: Target = .target(
            name: name,
            destinations: .iOS,
            product: .unitTests,
            bundleId: module.testBundleIdentifier
        )

        testModule.infoPlist = .default

        let testSourcesOfMainApp: [SourceFileGlob] = FileConstants.testSources.map { .glob("\(Constants.Path.maiAppModule)\($0)") }
        let testSources: [SourceFileGlob] = FileConstants.testSources.map { .glob("\($0)") }
        testModule.sources = .sourceFilesList(globs:  module == .internal(.app) ? testSourcesOfMainApp : testSources)

        testModule.dependencies = [
            .target(name: module.name)
        ]

        return testModule
    }

    static func baseTarget(of module: Module) -> Target {
        .target(
            name: module.name,
            destinations: .iOS,
            product: module.product,
            bundleId: module.bundleIdentifier,
            sources: "**",
            resources: resources(for: module),
            dependencies: prepareDependencies(for: module),
            settings: .baseTargetSettings
        )
    }

    static func resources(for module: Module) -> ResourceFileElements? {
        let resourcesPath = Constants.Path.resources
        let mainAppResourcesPath = Constants.Path.maiAppModule + resourcesPath

        return switch (module, module.requireResources) {
        case (.internal(.app), true): ["\(mainAppResourcesPath)"]
        case (_, true): ["\(resourcesPath)"]
        case (_, false): .none
        }
    }

    static func prepareDependencies(for module: Module) -> [TargetDependency] {
        module.dependencies.compactMap {
            switch $0 {
            case .internal: .project(target: $0.name, path: Path.relativeToRoot($0.path))
            case .external(.composableArchitecture): .package(product: $0.name, type: .runtime)
            }
        }
    }
}
