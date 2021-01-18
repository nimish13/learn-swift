import UIKit

class Category: Equatable {
    static let defaultSalesTax = 0.1
    var name: String
    var isExemptedFromTax: Bool
    
    init(name: String, isExemptedFromTax: Bool) {
        self.name = name
        self.isExemptedFromTax = isExemptedFromTax
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
}

class Product: Hashable {
    static let defaultImportDuty = 0.05
    var name: String
    var isImported: Bool
    var price: Double
    var category: Category
    
    init(name: String, isImported: Bool, price: Double, category: Category) {
        self.name = name
        self.isImported = isImported
        self.price = price
        self.category = category
    }
    
    private func subTotal(quantity: Int = 1) -> Double {
        price * Double(quantity)
    }
    
    private func totalTax(quantity: Int = 1) -> Double {
        var tax = 0.0
        if isImported {
            tax += (price * Product.defaultImportDuty)
        }
        if !category.isExemptedFromTax {
            tax += (price * Category.defaultSalesTax)
        }
        return tax * Double(quantity)
    }
    
    func sellingPrice(quantity: Int = 1) -> Double {
        subTotal(quantity: quantity) + totalTax(quantity: quantity)
    }
    
    func priceSummary(quantity: Int = 1) -> String {
        """
        \(name.padding(toLength: 25, withPad: " ", startingAt: 0))\
        \(String(quantity).padding(toLength: 15, withPad: " ", startingAt: 0))\
        \(UnicodeScalar(0x20B9)!)\
        \(String(price).padding(toLength: 14, withPad: " ", startingAt: 0))\
        \(String(totalTax(quantity: quantity)).padding(toLength: 15, withPad: " ", startingAt: 0))\
        \(String(sellingPrice(quantity: quantity)).padding(toLength: 15, withPad: " ", startingAt: 0))\n
        """
    }
    
    func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self).hashValue)
    }

    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
            lhs.isImported == rhs.isImported &&
            lhs.category == rhs.category &&
            lhs.price == rhs.price
    }
}

class ShoppingCart {
    static let shared = ShoppingCart()
    
    private init() {}
    
    var items = Dictionary<Product, Int>()
    
    
    func add(product: Product) {
        if items[product] != nil {
            items[product]! += 1
        } else {
            items[product] = 1
        }
    }

    func remove(product: Product) {
        if items[product] != nil {
            items[product]! -= 1
            if items[product] == 0 {
                items[product] = nil
            }
        }
    }
    
    private func total() -> Double {
        var sum = 0.0
        for (product, quantity) in items {
            sum += product.sellingPrice(quantity: quantity)
        }
        return sum
    }

    func summary() -> String {
        var displayData = """
        \("Product".padding(toLength: 25, withPad: " ", startingAt: 0))\
        \("Quantity".padding(toLength: 15, withPad: " ", startingAt: 0))\
        \("Unit Price".padding(toLength: 15, withPad: " ", startingAt: 0))\
        \("Tax".padding(toLength: 15, withPad: " ", startingAt: 0))\
        \("Total".padding(toLength: 15, withPad: " ", startingAt: 0))\n
        """
        for (product, quantity) in items {
            displayData += product.priceSummary(quantity: quantity)
        }
        displayData += "".padding(toLength: 85, withPad: "-", startingAt: 0)
        displayData += "\n\("Total".padding(toLength: 69, withPad: " ", startingAt: 0)) \(UnicodeScalar(0x20B9)!)\(total())\n"
        displayData += "".padding(toLength: 85, withPad: "-", startingAt: 0)
        return displayData
    }
}

let foodCategory = Category(name: "Food", isExemptedFromTax: true)
let bookCategory = Category(name: "Book", isExemptedFromTax: true)
let medicineCategory = Category(name: "Medicine", isExemptedFromTax: true)
let chocolateCategory = Category(name: "Chocolate", isExemptedFromTax: false)
let stationaryCategory = Category(name: "Stationary", isExemptedFromTax: false)


let apple = Product(name: "Apple", isImported: false, price: 20.0, category: foodCategory)
let importedApple = Product(name: "Apple", isImported: true, price: 200.0, category: foodCategory)

let shivaMythoBook = Product(name: "The Shiva Mythology", isImported: false, price: 2000.0, category: bookCategory)

let combiflam = Product(name: "CombiFlam", isImported: false, price: 50.0, category: medicineCategory)
let importedMed = Product(name: "Pfizer", isImported: true, price: 250.0, category: medicineCategory)

let indianChocolate = Product(name: "Dairy Milk", isImported: false, price: 50.0, category: chocolateCategory)
let importedChocolate = Product(name: "Lindt Lindor", isImported: true, price: 600.0, category: chocolateCategory)

let pencil = Product(name: "Natraj Pencil", isImported: true, price: 10.0, category: stationaryCategory)

var cart = ShoppingCart.shared

cart.add(product: apple)
cart.add(product: apple)
cart.add(product: importedApple)
cart.remove(product: apple)
cart.add(product: combiflam)
cart.add(product: pencil)
cart.add(product: pencil)
print(cart.summary())
