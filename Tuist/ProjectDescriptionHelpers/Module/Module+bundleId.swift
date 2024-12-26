//
//  Module+bundleIdentifier.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation

extension Module {
    var bundleIdentifier: String {
        let bundleId = Constants.Strings.bundleId
        let bundleName = name.lowercased()
        let other = bundleId + "." + bundleName

        return switch self {
        case .internal(.app): bundleId
        default: other
        }
    }

    var testBundleIdentifier: String {
        let bundleId = Constants.Strings.bundleId
        let bundleName = name.lowercased()
        let suffix = ".test"
        let main = bundleId + suffix
        let other = bundleId + "." + bundleName + suffix

        return switch self {
        case .internal(.app): main
        default: other
        }
    }
}
