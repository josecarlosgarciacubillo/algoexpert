//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// O(n^3) time | O(1) space
func longestPalidromeSubstring(str: String) -> String {
    var longest = ""
    for i in 0..<str.count {
        for j in i..<str.count {
            let startIndex = str.index(str.startIndex, offsetBy: i)
            let endIndex = str.index(str.startIndex, offsetBy: j)
            let substring = str[startIndex...endIndex]
            print(substring)
            if substring.count > longest.count && isPalindrome(str) {
                longest = String(substring)
            }
        }
    }
    return longest
}

func isPalindrome(_ str: String) -> Bool {
    var leftIndex = 0
    var rightIndex = str.count - 1
    while leftIndex < rightIndex {
        if str.charAt(at: leftIndex) != str.charAt(at: rightIndex) {
            return false
        }
        leftIndex += 1
        rightIndex -= 1
    }
    print("PALINDROME")
    return true
}

extension String {
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
}

let str = "abaxyzzyxf"
let charIndex = str.index(str.startIndex, offsetBy: 3)
//print(str[charIndex])
longestPalidromeSubstring(str: str)


/*
func longestPalidromeSubstring(str: String) -> String {
    var currentLongest = [0, 1]
    // We don't have to start at 0
    for i in 1..<str.count {
        let odd = getLongestPalindromeFrom(str, leftIndex: i - 1, rightIndex: i + 1)
        let even = getLongestPalindromeFrom(str, leftIndex: i - 1, rightIndex: i)
        let longest = max(odd, even)
    }
}

func getLongestPalindromeFrom(_ str: String, leftIndex: Int, rightIndex: Int) -> [Int] {
    
}
*/
