//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

/*
func fibonacci(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

// Simple recursion
// O(2^n) time | O(n) space
func getNthFib(_ n: Int) -> Int {
    if n == 2 {
        return 1
    } else if n == 1 {
        return 0
    } else {
        return getNthFib(n - 1) + getNthFib(n - 2)
    }
}

// Recursion + Memoization
// O(n) time | O(n) space
func getNthFib(_ n: Int, memoize: inout [Int: Int] = [1: 0, 2: 1]) -> Int {
    if let n = memoize[n] {
        return n
    } else {
        memoize[n] = getNthFib(n - 1, memoize: &memoize) + getNthFib(n - 2, memoize: &memoize)
        return memoize[n]!
    }
}
*/
// Iterative -> Optimal
// O(n) time | O(1) space
func getNthFib(_ n: Int) -> Int {
    var lastTwo = [0, 1]
    var counter = 3
    while counter <= n {
        let nextFib = lastTwo[0] + lastTwo[1]
        lastTwo[0] = lastTwo[1]
        lastTwo[1] = nextFib
        counter += 1
    }
    return n > 1 ? lastTwo[1] : lastTwo[0]
}

getNthFib(6)
