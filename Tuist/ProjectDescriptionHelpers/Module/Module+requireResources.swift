//
//  Module+requireResources.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation

extension Module {
    var requireResources: Bool {
        switch self {
        case .internal(.app): true
        case .internal(.core(.designSystem)): true
        default: false
        }
    }
}
