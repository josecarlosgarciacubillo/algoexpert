///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

/// O(log n) time | O(1) space
/// Always have to be a sorted array
/// Iteratively solution
func binarySearch(_ array: [Int], target: Int) -> Int {
    var leftPointer = 0
    var rightPointer = array.count - 1
    var middlePointer = 0
    while leftPointer <= rightPointer {
        middlePointer = (leftPointer + rightPointer) / 2
        if array[middlePointer] == target {
            return middlePointer
        } else {
            if target < array[middlePointer] {
                rightPointer = middlePointer - 1
            } else {
                leftPointer = middlePointer + 1
            }
        }
    }
    if leftPointer > rightPointer {
        return -1
    }
    return middlePointer
}

/// O(log n) time | O(log n) space -> because the allocation of recursive calls
/// Recursive solution
func binarySearchRecursive(_ array: [Int], target: Int) -> Int {
    return binarySearchHelper(array, target, 0, array.count - 1)
}

func binarySearchHelper(_ array: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
    if left > right { return -1 }
    let middlePointer = (left + right) / 2
    if array[middlePointer] == target {
        return middlePointer
    } else {
        if target < array[middlePointer] {
            return binarySearchHelper(array, target, left, middlePointer - 1)
        } else {
            return binarySearchHelper(array, target, middlePointer + 1, right)
        }
    }
}

/// Test Case
let array = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
let target = 43

binarySearch(array, target: target)
binarySearchRecursive(array, target: target)
