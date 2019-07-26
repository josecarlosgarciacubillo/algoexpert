///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

/// O(n+m) time | O(1) space where n+m is the sum of one entire row and column
func searchInSortedMatrix(matrix: [[Int]], target: Int) -> [Int] {
    /// Start from top right index of the matrix
    var rowIndex = 0
    var columnIndex = matrix[0].count - 1
    while rowIndex < matrix.count && columnIndex >= 0 {
        if matrix[rowIndex][columnIndex] > target {
            columnIndex -= 1
        } else if matrix[rowIndex][columnIndex] < target{
            rowIndex += 1
        } else {
            return [rowIndex, columnIndex]
        }
    }
    return [-1, -1]
}

/// Test Case
let matrix = [
    [1,4,7,12,15,1000],
    [2,5,19,31,32,1001],
    [3,8,24,33,35,1002],
    [40,41,42,44,45,1003],
    [99,100,103,106,128,1004]
]
let target = 99

searchInSortedMatrix(matrix: matrix, target: target)
