import UIKit

let maxPossibleNumber = 92
func calulateFibonacciSeries(for number: Int) -> Int? {
    if number > 92 { return nil }
    var (firstNumber, secondNumber) = (1, 1)
    for _ in 3...number {
        let tempNumber = secondNumber
        secondNumber += firstNumber
        firstNumber = tempNumber
    }
    return secondNumber
}


if let fibonacciSeriesLastNumber = calulateFibonacciSeries(for: 100) {
    print(fibonacciSeriesLastNumber)
} else {
    print("Out of range")
}
