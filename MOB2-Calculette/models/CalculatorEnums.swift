//
//  enum.swift
//  MOB2-Calculette
//
//  Created by yannick perret on 15.03.2024.
//

import Foundation
import SwiftUI


enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "C"
    case decimal = "."
    case modulo = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color(UIColor(red: 0xF5/255.0, green: 0xFD/255.0, blue: 0xB0/255.0, alpha: 1))
        case .clear, .negative, .modulo:
            return Color(UIColor(red: 0xF7/255.0, green: 0xE6/255.0, blue: 0xAD/255.0, alpha: 1))
        default:
            return Color(UIColor(red: 0xBC/255.0, green: 0xFF/255.0, blue: 0xB9/255.0, alpha: 1))
        }
    }
    
    var textColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .black
        default:
            return .black
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}
