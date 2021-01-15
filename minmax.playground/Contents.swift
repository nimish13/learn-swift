import UIKit

func minmax(_ firstInteger: Int, _ secondInteger: Int) -> (min: Int?, max: Int?) {
    //    Incase both are equal both min and max will have same value we will return empty tuple
    var comparedTuple: (min: Int?, max: Int?)
    
    if firstInteger < secondInteger {
        comparedTuple.min = firstInteger
        comparedTuple.max = secondInteger
    } else if firstInteger > secondInteger {
        comparedTuple.min = secondInteger
        comparedTuple.max = firstInteger
    }
    
    return comparedTuple
}

minmax(10, 20)

minmax(20, 20)

minmax(30, 20)
