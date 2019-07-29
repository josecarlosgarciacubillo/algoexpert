///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

func fibonacci(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

/// Simple recursion
/// O(2^n) time | O(n) space
func getNthFibRecursion(_ n: Int) -> Int {
    if n == 2 {
        return 1
    } else if n == 1 {
        return 0
    } else {
        return getNthFibRecursion(n - 1) + getNthFibRecursion(n - 2)
    }
}

/// Recursion + Memoization
/// O(n) time | O(n) space
func getNthFibMemo(_ n: Int, memoize: inout [Int: Int] = [1: 0, 2: 1]) -> Int {
    if let n = memoize[n] {
        return n
    } else {
        memoize[n] = getNthFibMemo(n - 1, memoize: &memoize) + getNthFibMemo(n - 2, memoize: &memoize)
        return memoize[n]!
    }
}

/// Iterative -> Optimal
/// O(n) time | O(1) space
func getNthFibIterative(_ n: Int) -> Int {
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

/// My version
func getNthFib(_ n: Int, _ memo: inout [Int: Int] = [:]) -> Int {
    if let number = memo[n] {
        return number
    }
    guard n >= 2 else {
        memo[n] = n
        return n
    }
    let fib = getNthFib(n - 1, &memo) + getNthFib(n - 2, &memo)
    memo[n] = fib
    return fib
}

/// Test Case
let n = 6
var memo = [Int: Int]()

fibonacci(n)
getNthFibRecursion(n)
//getNthFibMemo(6)
getNthFibIterative(6)
getNthFib(6, &memo)
