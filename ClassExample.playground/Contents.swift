import UIKit

class Vehicle {
    var tyres:Int
    let speedPerGear = 10
    public private(set) var currentGear: Int
    
    var currentSpeed:Int {
        currentGear * speedPerGear
    }
    
    init(numberOfTyres: Int, currentGear: Int) {
        tyres = numberOfTyres
        self.currentGear = currentGear
    }
    
    convenience init() {
        self.init(numberOfTyres: 4, currentGear: 0)
    }
    
    func changeGear(to number: Int) {
        currentGear = number
    }
    
    func displayInformation() -> String {
        """
        This vehicle has \(tyres) tyres
        Vehicle is running at the speed of \(currentSpeed) kmph in gear \(currentGear)
        """
    }
}

var v = Vehicle()
v.changeGear(to: 2)
v.currentGear
v.currentSpeed
print(v.displayInformation())
