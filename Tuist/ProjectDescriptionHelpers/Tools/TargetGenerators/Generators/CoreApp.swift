//
//  CoreApp.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 23/12/2024.
//

import Foundation
import ProjectDescription

struct CoreAppGenerator: TargetGenerator {
    static func generate(targetOfModule module: Module) -> Target {
        var target = generate(initialTargetOfModule: module)
        target.settings = .baseProjectSettings
        target.sources = projectFiles
        target.infoPlist = infoPlist
        target.resources = resources
        target.settings = .baseProjectSettings

        return target
    }
}

private extension CoreAppGenerator {
    static var projectFiles: SourceFilesList {
        let targetSources: SourceFileGlob = .glob(
            "\(Constants.Path.maiAppModule)**",
            excluding: sources.map({ .path($0) }) + ["./Modules/**"]
        )

        return .sourceFilesList(globs: [targetSources])
    }

    static var resources: ResourceFileElements {
        ["\(Constants.Path.maiAppModule + Constants.Path.resources)"]
    }

    static var infoPlist: InfoPlist {
        .extendingDefault(with: [
            "CFBundleDisplayName": "$(DISPLAY_NAME)",
            "CFBundleVersion": "$(PRODUCT_BUNDLE_VERSION)",
            "CFBundleShortVersionString": "$(PRODUCT_BUNDLE_VERSION)",
            "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
            "UIUserInterfaceStyle": "Light",
            "UIRequiresFullScreen": true,
            "UILaunchStoryboardName": "LaunchView",
            "ITSAppUsesNonExemptEncryption": false,
//            "UIDeviceFamily": [1],
        ])
    }
}
