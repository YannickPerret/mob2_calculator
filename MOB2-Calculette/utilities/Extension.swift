//
//  extension.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 22.03.2024.
//

import Foundation

// String extension to remove trailing zeros and decimal points if not needed.
extension String {
    func trimmingTrailingZeros() -> String {
        return self.replacingOccurrences(of: "0+$", with: "", options: .regularExpression)
            .replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    }
}

// Double extension to round the number to a specified number of decimal places.
extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
// CalculatorButton extension to map buttons to their corresponding operations.

extension CalculatorButton {
    func toOperation() -> Operation {
        switch self {
        case .add: return .add
        case .subtract: return .subtract
        case .multiply: return .multiply
        case .divide: return .divide
        default: return .none
        }
    }
}
