import UIKit

func logger(_ number: Int, runner: (Int) -> Void) {
    print("Before running function")
    runner(number)
    print("After running function")
}

logger(100) { (num: Int) -> Void in
    print("I am being run from a closure function")
    print("A number being passed from Logger function and printed is closure- \(num)")
}
