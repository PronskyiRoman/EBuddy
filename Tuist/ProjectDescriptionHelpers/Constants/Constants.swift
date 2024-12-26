//
//  Constants.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

public enum Constants {}

extension Constants {
    public enum Strings {
        public static let appName = "EBuddy"
        static let bundleId = "$(PRODUCT_BUNDLE_IDENTIFIER_OVERRIDE)"
    }
}

extension Constants {
    enum Path {
        static let app = ""
        static let maiAppModule = "./" + Constants.Strings.appName + "/"
        static let coreModule = "Modules/Core/"
        static let featureModule = "Modules/Features/"
        static let appConfigurations = "Configurations/"
        static let resources = "Resources/**"
    }
}
