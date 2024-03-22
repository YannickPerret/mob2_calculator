//
//  NumberFormatter.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation

struct NumberFormatter {
    static func formatNumber(_ number: Double) -> String {
        let roundedNumber = number.round(to: 5)
        if roundedNumber.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(roundedNumber))" 
        } else {
            return String(roundedNumber).trimmingTrailingZeros()
        }
    }
}
