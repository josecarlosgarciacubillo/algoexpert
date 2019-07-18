///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n^2*n!) time | O(n*n^2) space
/// Recursion method
func getPermutations(of arr: [Int]) -> [[Int]] {
    var permutations = [[Int]]()
    getPermutations(arr, [], &permutations)
    return permutations
}

func getPermutations(_ arr:[Int], _ currentPermutation: [Int], _ permutations: inout [[Int]]) {
    if arr.count == 0 && currentPermutation.count > 0 {
        permutations.append(currentPermutation)
    } else {
        for i in 0..<arr.count {
            var newArr = arr
            newArr.remove(at: i)
            var newPermutation = currentPermutation
            newPermutation.append(arr[i])
            getPermutations(newArr, newPermutation, &permutations)
        }
    }
}

/// O(n*n!) time | O(n*n^2) space
func getPermutationsSwap(of arr: inout [Int]) -> [[Int]] {
    var permutations = [[Int]]()
    permutationsSwapHelper(0, &arr, &permutations)
    return permutations
}

func permutationsSwapHelper(_ i: Int, _ arr: inout [Int], _ permutations: inout [[Int]]) {
    if i == arr.count - 1 {
        permutations.append(arr)
    } else {
        for j in i..<arr.count {
            arr.swapAt(i, j)
            permutationsSwapHelper(i + 1, &arr, &permutations)
            arr.swapAt(i, j)
        }
    }
}

/// Test case
var arr = [1, 2, 3]

print(getPermutations(of: arr))
print(getPermutationsSwap(of: &arr))


