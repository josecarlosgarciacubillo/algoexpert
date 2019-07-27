///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

/// O(n*2^n) time | O(n*2^n) space -> Mainly because we're creting 2^n subsets for each element
func powerset(array: [Int]) -> [[Int]] {
    var subsets: [[Int]] = [[]]
    for ele in array {
        for i in 0..<subsets.count {
            let currentSubset = subsets[i]
            subsets.append(currentSubset + [ele])
        }
    }
    return subsets
}

/// Test Case
let array = [1, 2, 3]

print(powerset(array: array))
