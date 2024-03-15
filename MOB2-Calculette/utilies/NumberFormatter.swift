//
//  NumberFormatter.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation

struct NumberFormatter {
    static func formatNumber(_ number: Double) -> String {
        let roundedNumber = number.round(to: 3) 
        if roundedNumber.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(roundedNumber))"
        } else {
            return String(roundedNumber).trimmingTrailingZeros()
        }
    }
}

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
