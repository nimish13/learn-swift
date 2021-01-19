import UIKit

enum ArithmaticOperation {
    case add
    case subtract
    case multiply
    case divide
    
    func evaluate<T: FloatingPoint>(_ firstOperand: T, _ secondOperand: T) -> T {
        switch self {
        case .add:
            return firstOperand + secondOperand
        case .subtract:
            return firstOperand - secondOperand
        case .multiply:
            return firstOperand * secondOperand
        case .divide:
            return firstOperand / secondOperand
        }
    }
}

struct Calculator {
    static func calculate<T: FloatingPoint>(_ firstOperand: T, _ operation: ArithmaticOperation, _ secondOperand: T) -> T {
        operation.evaluate(firstOperand, secondOperand)
    }
}

let firstOperand: Float = 100
let secondOperand: Float = 100

Calculator.calculate(firstOperand, .add, secondOperand)
