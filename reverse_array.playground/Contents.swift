import UIKit

func reverse(_ collection: [Int]) -> [Int] {
    var reversedCollection = [Int]()
    var totalEntries = collection.count - 1
    while(totalEntries >= 0) {
        reversedCollection.append(collection[totalEntries])
        totalEntries -= 1
    }
    return reversedCollection
}

reverse([1,2,3,4,5])

