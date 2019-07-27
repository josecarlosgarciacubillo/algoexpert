///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n) time | O(n) space
func maxSubsetSumNoAdjacent(_ array: [Int]) -> Int {
    if array.isEmpty {
        return 0
    } else if array.count == 1 {
        return array.first!
    }
    var maxSums = array
    maxSums[1] = max(array[0], array[1])
    for i in 2..<array.count {
        maxSums[i] = max(maxSums[i - 1], maxSums[i - 2] + array[i])
    }
    return maxSums.last!
}

/// O(n) time | O(1) space
func maxSubsetSumNoAdjacentMemo(_ array: [Int]) -> Int {
    if array.isEmpty {
        return 0
    } else if array.count == 1 {
        return array.first!
    }
    var second = array[0]
    var first = max(array[0], array[1])
    for i in 2..<array.count {
        let current = max(first, second + array[i])
        second = first
        first = current
    }
    return first
}


/// Test Case
let array = [75, 105, 120, 75, 90, 135]

maxSubsetSumNoAdjacent(array)
maxSubsetSumNoAdjacentMemo(array)
