import UIKit

func makeIncrementer(_ incrementAmount: Int) -> (Int) -> Int {
    
    func addNumber(_ number: Int) -> Int { number + incrementAmount }
    
    return addNumber
}


let tenIncrementer = makeIncrementer(10)
tenIncrementer(10)
tenIncrementer(3)
tenIncrementer(7)
