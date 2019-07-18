//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// O(n^2) time | O(1) space
// Worst sorting algotrith
func bubbleSort(array: inout [Int]) -> [Int] {
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if array[i] > array[j] {
                let tmp = array[i]
                array[i] = array[j]
                array[j] = tmp
                //array.swapAt(i, j)
            }
        }
    }
    return array
}

// Optimized by observing that the n-th pass finds the n-th largest element and puts it into
// its final place. So, the inner loop can avoid looking at the last n-1 items when running
// for the n-th time.
func bubbleSortOpt(array: inout [Int]) -> [Int] {
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array[j-1] {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
    return array
}

// Algoexoert Solution
func bubbleSortAlgo(array: inout [Int]) -> [Int] {
    var isSorted = false
    var counter = 0
    while !isSorted {
        isSorted = true
        for i in 0..<array.count - 1 - counter {
            if array[i] > array[i + 1] {
                swap(i, i + 1, &array)
                isSorted = false
            }
        }
        counter += 1
    }
    return array
}

func swap(_ i: Int, _ j: Int, _ array: inout [Int]) {
    let tmp = array[j]
    array[j] = array[i]
    array[i] = tmp
}

//var array = [8, 5, 2, 9, 5, 6, 3]
var array = [-4, 5, 10, 8, -10, -6, -4, -2, -5, 3, 5, -4, -5, -1, 1, 6, -7, -6, -7, 8, -10, -7, -7, -6, -6, -5, -5, -4, -4, -4, -2, -1, 1, 3, 5, 5, 6, 8, 8, 10]
bubbleSort(array: &array)
bubbleSortOpt(array: &array)
bubbleSortAlgo(array: &array)

