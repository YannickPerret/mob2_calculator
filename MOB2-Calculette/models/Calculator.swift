//
//  Calculator.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation

struct Calculator {
    func performOperation(_ runningNumber: Double, operand: Double, operation: Operation) -> Double {
        switch operation {
        case .add:
            return runningNumber + operand
        case .subtract:
            return runningNumber - operand
        case .multiply:
            return runningNumber * operand
        case .divide:
            return operand != 0 ? runningNumber / operand : Double.nan
        case .none:
            return runningNumber
        }
    }
}
