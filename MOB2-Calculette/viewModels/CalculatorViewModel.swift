//
//  CalculatorViewModel.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var value = "0"
    @Published var history: [CalculatorOperation] = []
    
    private var currentOperation: Operation = .none
    
    private var runningNumber = 0.0
    private var userIsInTheMiddleOfTyping = false
    
    func touch(button: CalculatorButton) {
        switch button {
        case .add, .subtract, .multiply, .divide:
            if userIsInTheMiddleOfTyping {
                runningNumber = Double(value) ?? 0
                userIsInTheMiddleOfTyping = false
            }
            currentOperation = button.toOperation()
            
        case .clear:
            value = "0"
            runningNumber = 0
            currentOperation = .none
            userIsInTheMiddleOfTyping = false
            
        case .decimal:
            if !userIsInTheMiddleOfTyping || value == "0" {
                value = "0."
                userIsInTheMiddleOfTyping = true
            } else if !value.contains(".") {
                value = "\(value)."
            }
            
        case .negative:
            if let valueAsDouble = Double(value) {
                let negatedValue = -valueAsDouble
                value = NumberFormatter.formatNumber(negatedValue)
            }
            if !userIsInTheMiddleOfTyping {
                runningNumber = -runningNumber
            }
            
        case .modulo:
            if let valueAsDouble = Double(value) {
                let percentValue = valueAsDouble / 100
                if percentValue.truncatingRemainder(dividingBy: 1) == 0 {
                    value = "\(Int(percentValue))"
                } else {
                    value = "\(percentValue)"
                }
            }
            
        case .equal:
            if userIsInTheMiddleOfTyping || currentOperation != .none {
                let currentValue = Double(value) ?? 0
                var result: Double = 0.0
                
                switch currentOperation {
                case .add: result = runningNumber + currentValue
                case .subtract: result = runningNumber - currentValue
                case .multiply: result = runningNumber * currentValue
                case .divide: result = currentValue != 0 ? runningNumber / currentValue : 0
                case .none: result = currentValue
                }
                
                let operation = CalculatorOperation(operand1: runningNumber, operand2: currentValue, operation: currentOperation, result: result)
                history.append(operation)
                
                value = NumberFormatter.formatNumber(result)
                runningNumber = result
                currentOperation = .none
                userIsInTheMiddleOfTyping = false
            }
            
        default:
            if !userIsInTheMiddleOfTyping {
                value = button.rawValue
                userIsInTheMiddleOfTyping = true
            } else {
                value = "\(value)\(button.rawValue)"
            }
        }
    }
    
    
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
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


