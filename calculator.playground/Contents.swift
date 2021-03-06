import UIKit

enum ArithmaticOperation: Character {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    func evaluate(_ firstOperand: Double, _ secondOperand: Double) -> Double {
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

//struct Calculator {
//    static func calculate(firstOperand: Double, operation: Character, secondOperand: Double) -> Double? {
//        let arithmaticOperation = ArithmaticOperation.init(rawValue: operation)
//        return arithmaticOperation?.evaluate(firstOperand: firstOperand, secondOperand: secondOperand)
//    }
//}
//
//if let answer = Calculator.calculate(firstOperand: 200, operation: "+", secondOperand: 20) {
//    print(answer)
//} else {
//    print("Wrong operator selected")
//}

ArithmaticOperation.add.evaluate(5, 7)
ArithmaticOperation.subtract.evaluate(5, 7)
ArithmaticOperation.multiply.evaluate(5, 7)
ArithmaticOperation.divide.evaluate(5, 7)
