//
//  BuildEnvironment.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

struct BuildEnvironmentAccessor {
    static let baseTargetConfigurations = BuildEnvironment.allCases.map({ $0.targetConfiguration })
    static let baseProjectConfigurations = BuildEnvironment.allCases.map({ $0.projectConfiguration })
}

enum BuildEnvironment: String, CaseIterable {
    case debug
}

private extension BuildEnvironment {
    var name: String { rawValue.capitalized }
    var configurationName: ConfigurationName { .init(stringLiteral: name) }

    var targetConfigPath: Path {
        switch self {
        case .debug: .relativeToRoot(Constants.Path.appConfigurations + "Debug.xcconfig")
        }
    }

    var appConfigPath: Path {
        switch self {
        case .debug: .relativeToRoot(Constants.Path.appConfigurations + "Debug.xcconfig")
        }
    }

    var projectConfiguration: Configuration {
        switch self {
        case .debug: .debug(name: configurationName, xcconfig: appConfigPath)
        }
    }

    var targetConfiguration: Configuration {
        switch self {
        case .debug: .debug(name: configurationName, xcconfig: targetConfigPath)
        }
    }
}
