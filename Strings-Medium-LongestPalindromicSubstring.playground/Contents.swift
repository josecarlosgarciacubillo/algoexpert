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
            let endIndex = str.index(str.startIndex, offsetBy: j + 1)
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
longestPalidromeSubstring(str: str)

