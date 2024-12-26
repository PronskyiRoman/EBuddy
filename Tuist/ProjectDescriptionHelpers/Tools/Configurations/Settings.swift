//
//  Settings.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

extension ProjectDescription.Settings {
    public static var baseTargetSettings: Self {
        .settings(
            base: .baseSettings,
            configurations: BuildEnvironmentAccessor.baseTargetConfigurations,
            defaultSettings: .recommended
        )
    }

    public static var baseProjectSettings: Self {
        .settings(
            base: .baseSettings,
            configurations: BuildEnvironmentAccessor.baseProjectConfigurations,
            defaultSettings: .recommended
        )
    }
}

extension Dictionary where Key == String, Value == Project.Options {
    public static var baseSPMSettings: Self {
        ["LocalSwiftPackage": .options(disableSynthesizedResourceAccessors: false)]
    }
}

private extension ProjectDescription.SettingsDictionary {
    static var baseSettings: Self {
        [
            "SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD" : "NO",
            "SUPPORTS_MACCATALYST" : "NO",
            "TARGETED_DEVICE_FAMILY" : "1",
            "ENABLE_USER_SCRIPT_SANDBOXING": "NO",
            "ENABLE_MODULE_VERIFIER": "YES",
            "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "NO",
            "MODULE_VERIFIER_SUPPORTED_LANGUAGES": ["objective-c", "objective-c++"]
        ]
    }
}
