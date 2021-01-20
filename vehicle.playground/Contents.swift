import UIKit

class Vehicle {
    let name:String
    var price = 0.0
    
    init(vehicleName: String, price: Double) {
        name = vehicleName
        self.price = price
    }
    
    init(vehicleName: String) {
        name = vehicleName
    }
    
    func displayInformation() -> String {
        """
        Name of vehicle is \(name)
        Price of vehicle is \(price)
        """
    }
}


class Bike: Vehicle {
    let dealer:String
    
    init(vehicleName: String, price: Double, dealer: String) {
        self.dealer = dealer
        super.init(vehicleName: vehicleName, price: price)
    }
    
    override func displayInformation() -> String {
        let info = super.displayInformation()
        return info + "\nDealer is \(dealer)"
    }
}


var bike = Bike(vehicleName: "Apache 200", price: 75000.0, dealer: "TVS")

bike.displayInformation()
bike.price += 10000.50
bike.displayInformation()
