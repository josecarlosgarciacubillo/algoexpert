///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

/// Swifty Method
/// O(n^2) time -> because sorting | O(1) space
func findThreeLargestNumbers(in array: inout [Int]) -> [Int] {
    if array.count == 3 { return array.sorted() }
    array = array.sorted()
    let slice = array.suffix(3)
    array = Array(slice)
    return array
}

/// O(n) time | O(1) space
func findThreeLargestNumbersX(in array: inout [Int]) -> [Int] {
    if array.count == 3 { return array.sorted() }
    var threeLargest = Array(repeating: Int.min, count: 3)
    for num in array {
        updateLargest(&threeLargest, num)
    }
    return array
}

func updateLargest(_ threeLargest: inout [Int], _ num: Int) {
    if num > threeLargest[2] {
        shiftAndUpdate(&threeLargest, num, 2)
    } else if num > threeLargest[1] {
        shiftAndUpdate(&threeLargest, num, 1)
    } else if num > threeLargest[0] {
        shiftAndUpdate(&threeLargest, num, 0)
    }
}

func shiftAndUpdate(_ array: inout [Int], _ num: Int, _ index: Int) {
    for i in 0..<index {
        if i == index {
            array[i] = num
        } else {
            array[i] = array[i + 1]
        }
    }
}

func swap(_ array: inout [Int], _ num: Int, _ index: Int) {
    if index == 0 {
        array[0] = num
    } else if index == 1 {
        array[0] = array[1]
        array[1] = num
    } else {
        array[3] = num
        
    }
}

var array = [141, 1, 17, -7, -17, -27, 18, 541, 8, 7, 7]

findThreeLargestNumbers(in: &array)
findThreeLargestNumbersX(in: &array)
