//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// Brute force solution
// O(n^2) time | O(1) space
func twoNumberSum(array: [Int], targetSum: Int) -> [Int] {
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if targetSum == array[i] + array[j] {
                return [array[i], array[j]].sorted()
            }
        }
    }
    return []
}

// Hash table solution
// y = targetSum - x
// O(n) time | O(n) space
func twoNumberSumHash(array: [Int], targetSum: Int) -> [Int] {
    var nums = [Int: Bool]()
    for num in array {
        let potentialMatch = targetSum - num
        if let _ = nums[potentialMatch] {
            return [potentialMatch, num].sorted()
        } else {
            nums[num] = true
        }
    }
    return []
}

let testArray = [4, 6, 1]
let targetSum = 5

twoNumberSum(array: testArray, targetSum: targetSum)
twoNumberSumHash(array: testArray, targetSum: targetSum)
