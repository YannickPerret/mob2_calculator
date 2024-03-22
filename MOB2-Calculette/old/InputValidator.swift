//
//  InputValidator.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation


struct IsnputValidator {
    static func isValidDecimalInput(_ input: String) -> Bool {
        return !input.contains(".")
    }
}
