//
//  CalculatorViewModel.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation
import SwiftUI

// ViewModel for the calculator, responsible for handling user interactions and updating the UI.
class CalculatorViewModel: ObservableObject {
    //Async variable with observer
    @Published var value = "0"
    @Published var history: [CalculatorOperation] = []
    
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    // operand
    private var lastOperand: Double? = nil
    private var currentOperation: Operation = .none
    
    private var runningNumber = 0.0
    
    // Flag to check if the user is currently entering a number.
    private var userIsInTheMiddleOfTyping = false
    
    
    // Function called when any button on the calculator is pressed.
    func touch(button: CalculatorButton) {
        switch button {
            
        // Handles arithmetic operation buttons.
        case .add, .subtract, .multiply, .divide:
            if userIsInTheMiddleOfTyping {
                runningNumber = Double(value) ?? 0
                userIsInTheMiddleOfTyping = false
            }
            currentOperation = button.toOperation()
            
        // Handles the clear button, resetting the calculator.
        case .clear:
            value = "0"
            runningNumber = 0
            currentOperation = .none
            userIsInTheMiddleOfTyping = false
            
        // Handles the decimal point.
        case .decimal:
            if !userIsInTheMiddleOfTyping || value == "0" {
                value = "0."
                userIsInTheMiddleOfTyping = true
            } else if !value.contains(".") {
                value = "\(value)."
            }
            
        // Toggles the sign of the current value.
        case .negative:
            if let valueAsDouble = Double(value) {
                let negatedValue = -valueAsDouble
                value = NumberFormatter.formatNumber(negatedValue)
            }
            if !userIsInTheMiddleOfTyping {
                runningNumber = -runningNumber
            }
            
        // Handles the modulo operation.
        case .modulo:
            if let valueAsDouble = Double(value) {
                let percentValue = valueAsDouble / 100
                if percentValue.truncatingRemainder(dividingBy: 1) == 0 {
                    value = "\(Int(percentValue))"
                } else {
                    value = "\(percentValue)"
                }
            }
            
        // Executes the current operation.
        case .equal:
            var operand = 0.0
            if userIsInTheMiddleOfTyping {
                operand = Double(value) ?? 0
                lastOperand = operand
            } else {
                operand = lastOperand ?? 0
            }
            
            var result: Double = 0.0
            
            switch currentOperation {
                case .add: result = runningNumber + operand
                case .subtract: result = runningNumber - operand
                case .multiply: result = runningNumber * operand
                case .divide: result = operand != 0 ? runningNumber / operand : 0
                case .none: result = runningNumber
            }
            
            let operation = CalculatorOperation(operand1: runningNumber, operand2: operand, operation: currentOperation, result: result)
            history.append(operation)
            
            value = NumberFormatter.formatNumber(result)
            runningNumber = result
            
            if !userIsInTheMiddleOfTyping {
                lastOperand = operand
            }
            
            currentOperation = .none
            userIsInTheMiddleOfTyping = false
            
        default:
            if !userIsInTheMiddleOfTyping {
                value = button.rawValue
                userIsInTheMiddleOfTyping = true
            } else {
                if value.count < 15 {
                    value = "\(value)\(button.rawValue)"
                }
                else {
                    errorMessage = "Impossible de mettre plus de 15 chiffres"
                    showAlert = true
                    return
                }
            }
        }
    }
    
    
    // Calculates the button width based on the screen size.
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
