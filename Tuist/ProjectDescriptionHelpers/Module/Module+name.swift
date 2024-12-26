//
//  Module+name.swift
//  ProjectDescriptionHelpers
//
//  Created by Roman Pronskyi on 21/12/2024.
//

import Foundation

extension Module {
    public var name: String {
        switch self {
        case .internal(.app): Constants.Strings.appName
        default: "\(self)".extracted
        }
    }
}

private extension String {
    var extracted: Self {
        var value = split(separator: ".").last ?? "Module Name Is Incorrect"
        while value.hasSuffix(")") { value.removeLast() }
        return .init(value).withCapitalFirst
    }

    private var withCapitalFirst: Self {
        var mutableSelf = self
        let capitalFirst = String(mutableSelf.removeFirst()).capitalized
        return capitalFirst + mutableSelf
    }
}
