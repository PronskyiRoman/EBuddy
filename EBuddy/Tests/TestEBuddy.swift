//
//  TestEBuddy.swift
//  EBuddy
//
//  Created by Roman Pronskyi on 26/12/2024.
//

import Foundation
import Testing

@Suite("Tests EBuddy")
struct TestEBuddy {
    @Test
    func twoPlusTwo_isFour() {
        // when
        let result = 2 + 2
        // then
        #expect(result == 4)
    }
}
