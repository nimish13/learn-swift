import UIKit

func calculateCharacterOccurence(_ string: String) -> [Character: Int] {
    var occurenceCollection = [Character: Int]()
    
    for character in string {
        if let currentCount = occurenceCollection[character] {
            occurenceCollection[character] = currentCount + 1
        } else {
            occurenceCollection[character] = 1
        }
    }
    
    return occurenceCollection
}

calculateCharacterOccurence("occurence")
