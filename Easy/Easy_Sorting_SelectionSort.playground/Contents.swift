//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// Selection Sort
// O(n^2) time | O(1) space
func selectionSort(_ array: inout [Int]) -> [Int] {
    if array.count == 0 {
        return []
    }
    var currentIndex = 0
    while currentIndex < array.count - 1 {
        var smallestIndex = currentIndex
        for i in currentIndex+1..<array.count {
            //if array[smallestIndex] > array[i] {
            if array[i] < array[smallestIndex] {
                smallestIndex = i
            }
        }
        array.swapAt(currentIndex, smallestIndex)
        currentIndex += 1
    }
    return array
}

var array = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]

selectionSort(&array)
