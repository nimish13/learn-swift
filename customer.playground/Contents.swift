import UIKit

enum InvalidTransactionError: Error {
    case insufficientAmount
    case negativeAmountDeposited
}

class Customer {
    static var totalAccounts = 0
    let accountNumber: Int
    var balance: Double
    var name: String
    
    init(custName: String, custBalance: Double = 1000.0) {
        name = custName
        Customer.totalAccounts += 1
        accountNumber = Customer.totalAccounts
        balance = custBalance
    }
    
    func deposit(amount: Double) throws {
        if amount < 0 {
            throw InvalidTransactionError.negativeAmountDeposited
        }
        balance += amount
    }
    
    func withdrawl(amount: Double) throws {
        if amount > balance {
            throw InvalidTransactionError.insufficientAmount
        }
       balance -= amount
    }
    
    func displayDetails() -> String {
        """
        Customer Name - \(name)
        Customer Account - \(accountNumber)
        Customer Balance - \(balance)
        """
    }
}

var customer1 = Customer(custName: "Nimish")
var customer2 = Customer(custName: "Nimish", custBalance: 2000)

do {
    try customer1.deposit(amount: 100)
    print(customer1.displayDetails())
    try customer1.withdrawl(amount: 600)
    print(customer1.displayDetails())
} catch InvalidTransactionError.insufficientAmount {
    print("Account doest not have sufficient balance")
} catch InvalidTransactionError.negativeAmountDeposited {
    print("Please deposit amount > 0")
}

do {
    try customer2.deposit(amount: 100)
    print(customer2.displayDetails())
    try customer2.withdrawl(amount: 3000)
    print(customer2.displayDetails())
} catch InvalidTransactionError.insufficientAmount {
    print("Account doest not have sufficient balance")
} catch InvalidTransactionError.negativeAmountDeposited {
    print("Please deposit amount > 0")
}

