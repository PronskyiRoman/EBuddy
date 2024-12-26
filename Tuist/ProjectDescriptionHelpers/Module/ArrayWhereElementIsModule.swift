//
//  ArrayWhereElementIsModule.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

extension Array where Element == Module {
    static var mainApp: Self { Module.Internal.allCases.map { .internal($0) } }
    static var empty: Self { [] }
    static var defaultFeature: Self {
        [.internal(.core(.architectureTools)), .internal(.core(.designSystem))]
    }
}
