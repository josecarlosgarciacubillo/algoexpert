///
/// Created by José Carlos García
/// Mexican Dev Mafia
///

import Foundation

/// CS = CN + L + R
/// O(n^2) time | O(n) space
func threeNumberSum(in array: inout [Int], of targetSum: Int) -> [[Int]] {
    array.sort()
    var triplets = [[Int]]()
    for i in 0..<array.count - 2 {
        var left = i + 1
        var right = array.count - 1
        while left < right {
            let currentSum = array[i] + array[left] + array[right]
            if currentSum == targetSum {
                triplets.append([array[i], array[left], array[right]])
                left += 1
                right -= 1
            } else if currentSum < targetSum {
                left += 1
            } else if currentSum > targetSum {
                right -= 1
            }
        }
    }
    return triplets
}

/// Test Cases
var array = [12, 3, 1, 2, -6, 5, -8, 6]
let targetSum = 0

threeNumberSum(in: &array, of: targetSum)
