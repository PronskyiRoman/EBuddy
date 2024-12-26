//
//  TargetBuilder.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

public struct TargetBuilder {
    public static func buildTarget(forModule module: Module) -> Project {
        .init(
            name: module.name,
            packages: build(packagesForCase: module),
            settings: settings(for: module),
            targets: [
                build(moduleForCase: module),
                build(testModuleForCase: module)
            ]
        )
    }
}

private extension TargetBuilder {
    static func settings(for module: Module) -> Settings {
        switch module {
        case .internal(.app): .baseProjectSettings
        default: .baseTargetSettings
        }
    }

    static func build(moduleForCase case: Module) -> Target {
        switch `case` {
        case .internal(.app): CoreAppGenerator.generate(targetOfModule: `case`)
        case .internal(.core): CoreModuleGenerator.generate(targetOfModule: `case`)
        case .internal(.feature): FeatureModuleGenerator.generate(targetOfModule: `case`)
        case .external: SPMModuleGenerator.generate(targetOfModule: `case`)
        }
    }

    static func build(testModuleForCase case: Module) -> Target {
        switch `case` {
        case .internal(.app): CoreAppGenerator.generate(initialTestTargetOfModule: `case`)
        case .internal(.core): CoreModuleGenerator.generate(initialTestTargetOfModule: `case`)
        case .internal(.feature): FeatureModuleGenerator.generate(initialTestTargetOfModule: `case`)
        case .external: SPMModuleGenerator.generate(initialTestTargetOfModule: `case`)
        }
    }

    static func build(packagesForCase case: Module) -> [Package] {
        `case`.externalPackages
    }
}
