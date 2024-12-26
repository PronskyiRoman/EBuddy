//
//  FeatureModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

struct FeatureModuleGenerator: TargetGenerator {
    static func generate(targetOfModule module: Module) -> Target {
        var target = generate(initialTargetOfModule: module)
        target.sources = targetFiles
        target.settings = .baseTargetSettings

        return target
    }
}

private extension FeatureModuleGenerator {
    static var targetFiles: SourceFilesList {
        let sources: SourceFileGlob = .glob("**", excluding: sources.map(Path.init))
        return .sourceFilesList(globs: [sources])
    }
}
