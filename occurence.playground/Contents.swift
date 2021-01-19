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

extension String {
    func removeDuplicates() -> String {
        var uniqueStringSet = Set<Character>()
        return self.filter { uniqueStringSet.insert($0).inserted }
    }
}

let inputString = "occurrence"
let output = calculateCharacterOccurence(inputString)

for character in inputString.removeDuplicates() {
    print("\(character) => \(output[character]!)")
}


