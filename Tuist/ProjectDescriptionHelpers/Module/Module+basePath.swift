//
//  Module+basePath.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation

extension Module {
    enum BasePath {
        case none
        case rootDirectory
        case relevant(toValue: String)
    }

    var basePath: BasePath {
        switch self {
        case .internal(.app): BasePath.rootDirectory
        case .internal(.core): BasePath.relevant(toValue: Constants.Path.coreModule)
        case .internal(.feature): BasePath.relevant(toValue: Constants.Path.featureModule)
        case .external: BasePath.none
        }
    }

    public var path: String {
        switch self.basePath {
        case .none: ""
        case .rootDirectory: ""
        case let .relevant(path): path + name
        }
    }
}
