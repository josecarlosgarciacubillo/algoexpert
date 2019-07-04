//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

// Hacky way
// O(1) time | O(1) space
func isPalindrome(string: String) -> Bool {
    let reversed = String(string.reversed())
    if string == reversed {
        return true
    }
    return false
}

// O(n^2) time | O(n) space
// This time becuase altought we are just iterating throught the original string, we're inserting each character in a new String(collection) of O(n) size.
func isPalindromeLoop(string: String) -> Bool {
    var reversed = String()
    for c in string.reversed() {
        reversed.append(c)
    }
    if string == reversed {
        return true
    }
    return false
}

// O(n) time | O(n) space
func isPalindromeLoopChar(string: String) -> Bool {
    var reversed = [Character]()
    for c in string.reversed() {
        reversed.append(c)
    }
    if string == String(reversed) {
        return true
    }
    return false
}

// Recursive solution
// O(n) time | O(n) space
func isPalindromeRecursion(string: String, i: Int = 0) -> Bool {
    let j = string.count - 1 - i
    if i >= j {
        return true
    }
    if string[i] != string[j] {
        return false
    }
    return isPalindromeRecursion(string: string, i: i + 1)
}


// Pointers solution (Optimal)
// O(n) time | O(1) space
func isPalindromePointers(string: String) -> Bool {
    var leftIndex = 0
    var rightIndex = string.count - 1
    while leftIndex < rightIndex {
        if string[leftIndex] != string[rightIndex] {
            return false
        }
        leftIndex += 1
        rightIndex -= 1
    }
    return true
}

let test = "abcdefghihgfedcba"

isPalindrome(string: test)
isPalindromeLoop(string: test)
isPalindromeLoopChar(string: test)
isPalindromeRecursion(string: test)
isPalindromePointers(string: test)


