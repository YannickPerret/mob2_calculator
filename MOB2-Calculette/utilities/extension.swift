//
//  extension.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 22.03.2024.
//

import Foundation

extension String {
    func trimmingTrailingZeros() -> String {
        return self.replacingOccurrences(of: "0+$", with: "", options: .regularExpression)
            .replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

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
