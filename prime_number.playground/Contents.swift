import UIKit

func isPrime(_ number: Int) -> Bool {
    let primeCheckLimit = Int(ceil(Double(number).squareRoot()))
    if number < 2 { return false }
    return !((2...primeCheckLimit).contains { number % $0 == 0 })

}


func printPrimeNumbers(_ numberCount: Int) {
    for number in 1...numberCount {
        if(isPrime(number)) {
            print(number)
        }
    }
}

printPrimeNumbers(100)
