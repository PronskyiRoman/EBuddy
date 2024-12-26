//
//  CoreModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

public struct CoreModuleGenerator: TargetGenerator {
    static func generate(targetOfModule module: Module) -> Target {
        var target = generate(initialTargetOfModule: module)
        target.sources = targetFiles
        target.settings = .baseTargetSettings

        return target
    }
}

private extension CoreModuleGenerator {
    static var targetFiles: SourceFilesList {
        let sources: SourceFileGlob = .glob("**", excluding: sources.map(Path.init))
        return .sourceFilesList(globs: [sources])
    }
}
