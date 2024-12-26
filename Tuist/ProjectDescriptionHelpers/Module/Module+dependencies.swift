//
//  Module+dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

extension Module {
    var dependencies: [Module] {
        switch self {
        case .internal(.app): .mainApp
        case .internal(.feature): .defaultFeature
        case .internal(.core(.architectureTools)): [.external(.composableArchitecture)]
        default: .empty
        }
    }
}
