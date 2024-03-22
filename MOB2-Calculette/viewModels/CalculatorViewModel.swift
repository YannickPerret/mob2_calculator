//
//  CalculatorViewModel2.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 22.02.2024.
//

import Foundation
import SwiftUI

// ViewModel for the calculator, responsible for handling user interactions and updating the UI.
class CalculatorViewModel: ObservableObject {
    //Async variable with observer

    @Published var value = "0"
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    // operand
    private var calculator = Calculator()
    private var lastOperand: Double? = nil
    private var currentOperation: Operation = .none
    private var runningNumber = 0.0
    
    // Flag to check if the user is currently entering a number.
    private var userIsInTheMiddleOfTyping = false
    
    
    // Function called when any button on the calculator is pressed.
    func touch(button: CalculatorButton) {
        
        switch button {
        case .add, .subtract, .multiply, .divide:
            prepareForOperation(button)
        case .clear:
            clearValues()
        case .decimal:
            addDecimalPoint()
        case .negative:
            toggleSign()
        case .modulo:
            applyPercentage()
        case .equal:
            executeOperation()
        default:
            appendNumber(button: button)
        }
    }
    
    private func prepareForOperation(_ button: CalculatorButton) {
        if userIsInTheMiddleOfTyping {
            runningNumber = Double(value) ?? 0
            userIsInTheMiddleOfTyping = false
        }
        currentOperation = button.toOperation()
    }
    
    private func clearValues() {
        value = "0"
        runningNumber = 0
        currentOperation = .none
        userIsInTheMiddleOfTyping = false
    }
    
    private func addDecimalPoint() {
        if !userIsInTheMiddleOfTyping {
            value = "0."
            userIsInTheMiddleOfTyping = true
        } else if !value.contains(".") {
            value = "\(value)."
        }
    }
    
    private func toggleSign() {
        if let valueAsDouble = Double(value) {
            value = String(-valueAsDouble)
            if !userIsInTheMiddleOfTyping {
                runningNumber = -runningNumber
            }
        }
    }
    
    private func applyPercentage() {
        if let valueAsDouble = Double(value) {
            value = String(valueAsDouble / 100)
        }
    }
    
    private func executeOperation() {
        let operand = userIsInTheMiddleOfTyping ? Double(value) ?? 0 : lastOperand ?? 0
        let result = calculator.performOperation(runningNumber, operand: operand, operation: currentOperation)
        value = String(result)
        value = NumberFormatter.formatNumber(result)

        runningNumber = result
        userIsInTheMiddleOfTyping = false
        lastOperand = operand
        currentOperation = .none
    }
    
    private func appendNumber(button: CalculatorButton) {
        let number = button.rawValue
        if userIsInTheMiddleOfTyping {
            if value.count < 15 {
                value = "\(value)\(number)"
            } else {
                errorMessage = "Impossible de mettre plus de 15 chiffres"
                showAlert = true
            }
        } else {
            value = number != "0" ? number : "0"
            userIsInTheMiddleOfTyping = true
        }
    }
    
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}
