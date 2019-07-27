///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

/// O(n) time | O(1) space
func kadanesAlgorithm(array: [Int]) -> Int {
    var maxEndingHere = array[0]
    var maxSoFar = array[0]
    for i in 1..<array.count {
        let num = array[i]
        maxEndingHere = max(num, maxEndingHere + num)
        maxSoFar = max(maxSoFar, maxEndingHere)
    }
    return maxSoFar
}

/// Test Case
let array = [3, 5, -9, 1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1, -5, 4]

kadanesAlgorithm(array: array)
