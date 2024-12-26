//
//  Module+product.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 26/12/2024.
//

import Foundation
import ProjectDescription

extension Module {
    var product: Product {
        switch self {
        case .internal(.app): .app
        default: .framework
        }
    }
}
