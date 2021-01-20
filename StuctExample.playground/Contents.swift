import UIKit

struct Vehicle {
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
    
    init(numberOfTyres: Int, speed: Int) {
        let gear = speed / 10
        self.init(numberOfTyres: numberOfTyres, currentGear: gear)
    }
    
    mutating func changeGear(to number: Int) {
        currentGear = number
    }
    
    func displayInformation() -> String {
        """
        This vehicle has \(tyres) tyres
        Vehicle is running at the speed of \(currentSpeed) kmph in gear \(currentGear)
        """
    }
}

var v = Vehicle(numberOfTyres: 2, speed: 50)
print(v.displayInformation())
v.changeGear(to: 2)
v.currentGear
v.currentSpeed
print(v.displayInformation())
