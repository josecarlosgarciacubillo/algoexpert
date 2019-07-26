///
/// Created by José Carlos García
/// Mexican Dev Mafia
///

import Foundation

/// O(n log n + m log m) time -> because sorting each array | O(1) space
func smallestDifference(in arrayOne: inout [Int], and arrayTwo: inout [Int]) -> [Int] {
    arrayOne.sort()
    arrayTwo.sort()
    var indexOne = 0
    var indexTwo = 0
    var smallest = Int.max
    var current = Int.max
    var smallestPair = [Int]()
    while indexOne < arrayOne.count && indexTwo < arrayTwo.count {
        let firstNumber = arrayOne[indexOne]
        let secondNumber = arrayTwo[indexTwo]
        if firstNumber < secondNumber {
            current = secondNumber - firstNumber
            indexOne += 1
        } else if secondNumber < firstNumber {
            current = firstNumber - secondNumber
            indexTwo += 1
        } else {
            return [firstNumber, secondNumber]
        }
        if smallest > current {
            smallest = current
            smallestPair = [firstNumber, secondNumber]
        }
    }
    return smallestPair
}

/// Test Cases
var arrayOne = [-1, 5, 10, 20, 28, 3]
var arrayTwo = [26, 134, 135, 15, 17]

smallestDifference(in: &arrayOne, and: &arrayTwo)
