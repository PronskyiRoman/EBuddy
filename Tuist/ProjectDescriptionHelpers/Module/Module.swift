//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

typealias ModuleExtension = CaseIterable & Sendable & Equatable & Hashable

public enum Module: ModuleExtension {
    case `internal`(Internal)
    case external(External)
}

extension Module {
    public static var allCases: [Module] {
        Module.Internal.allCases.map { .internal($0) }
        + Module.External.allCases.map { .external($0) }
    }
}
