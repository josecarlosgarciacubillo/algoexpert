///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n*d) time | O(n) space where d = # of denominations
func numberOfWaysToMakeChange(n: Int, denoms: [Int]) -> Int {
    var ways = Array(repeating: 0, count: n + 1)
    /// Edge case if input is 0
    ways[0] = 1
    for denom in denoms {
        for amount in 1..<n+1 {
            if denom <= amount {
                ways[amount] += ways[amount - denom]
            }
        }
    }
    return ways[n]
}

/// Test Case
let denoms = [1, 5, 10, 20]
let n = 10

numberOfWaysToMakeChange(n: n, denoms: denoms)
