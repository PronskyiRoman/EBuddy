//
//  Module+Internal.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

extension Module {
    public enum Internal: ModuleExtension {
        case app
        case core(Core)
        case feature(Feature)
    }
}

extension Module.Internal {
    public static var allCases: [Module.Internal] {
        Module.Internal.Core.allCases.map { .core($0) }
        + Module.Internal.Feature.allCases.map { .feature($0) }
    }
}
