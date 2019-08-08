///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

func longestSubstringWithoutDuplication(_ string: String) -> String {
    var lastSeen = [Character: Int]()
    var longest = [0, 1]
    var startIndex = 0
    for i in 0..<string.count {
        let char = string[string.index(string.startIndex, offsetBy: i)]
        if let lastSeen = lastSeen[char] {
            startIndex = max(startIndex, lastSeen + 1)
        }
        if longest[1] - longest[0] < i + 1 - startIndex {
            longest = [startIndex, i + 1]
        }
        lastSeen[char] = i
    }
    let startSubstringIndex = string.index(string.startIndex, offsetBy: longest[0])
    let endSubstringIndex = string.index(string.startIndex, offsetBy: longest[1] - 1)
    let longestSubstring = String(string[startSubstringIndex...endSubstringIndex])
    return longestSubstring
}

/// Test Case
let input = "clementisacap"

longestSubstringWithoutDuplication(input)
