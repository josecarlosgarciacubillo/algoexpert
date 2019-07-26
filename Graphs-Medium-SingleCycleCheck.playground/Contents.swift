///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n) time | O(1) space
func hasSingleCycle(_ array: [Int]) -> Bool {
    var numElementsVisited = 0
    var currentIndex = 0
    while numElementsVisited < array.count {
        /// More than 1 cycle, because alredy visited
        if numElementsVisited > 0 && currentIndex == 0 {
            return false
        }
        numElementsVisited += 1
        currentIndex = getNextIndex(currentIndex, array)
    }
    return currentIndex == 0
}

func getNextIndex(_ currentIndex: Int, _ array: [Int]) -> Int {
    let jump = array[currentIndex]
    let nextIndex = (currentIndex + jump) % array.count
    return nextIndex >= 0 ? nextIndex : nextIndex + array.count
}

/// Test Case
let array = [2, 3, 1, -4, -4, 2]

hasSingleCycle(array)

