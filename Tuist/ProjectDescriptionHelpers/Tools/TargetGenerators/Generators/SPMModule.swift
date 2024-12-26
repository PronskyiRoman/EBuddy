//
//  SPMModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 25/12/2024.
//

import Foundation
import ProjectDescription

struct SPMModuleGenerator: TargetGenerator {
    static func generate(targetOfModule module: Module) -> Target {
        generate(initialTargetOfModule: module)
    }
}
