///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n*d) time | O(n) space where d = # of denominations
func minNumberOfCoinsForChange(n: Int, denoms: [Int]) -> Int {
    var numOfCoins = Array(repeating: Int.max, count: n + 1)
    /// Edge case if input is 0
    numOfCoins[0] = 0
    for denom in denoms {
        for amount in 1..<numOfCoins.count {
            if denom <= amount {
                numOfCoins[amount] = min(numOfCoins[amount], 1 + numOfCoins[amount - denom])
            }
        }
    }
    return numOfCoins[n] != Int.max ? numOfCoins[n] : -1
}

/// Test Case
let denoms = [1, 2, 4]
let n = 6

minNumberOfCoinsForChange(n: n, denoms: denoms)
