import UIKit

func factorial(_ number: Int) -> Int {
    if number == 1 {
        return 1
    } else {
        return number * factorial(number - 1)
    }
}

factorial(5)

