//
//  Module+externalPackages.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 25/12/2024.
//

import Foundation
import ProjectDescription

extension Module {
    var externalPackages: [Package] {
        switch self {
        case .internal(.core(.architectureTools)):
            [
                .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.17.0"))
            ]
        default: []
        }
    }
}
