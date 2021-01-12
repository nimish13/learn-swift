import UIKit

func fibonacci(_ number: Int) -> Int {
    var (firstNumber, secondNumber) = (1, 1)
    for _ in 3...number {
        let tempNumber = secondNumber
        secondNumber += firstNumber
        firstNumber = tempNumber
    }
    return secondNumber
}


let fibonacciSeriesLastNumber = fibonacci(10)

print(fibonacciSeriesLastNumber)
