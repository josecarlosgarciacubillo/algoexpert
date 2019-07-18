///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(n) time | O(n) space
func balancedBrackets(of string: String) -> Bool {
    let openingBrackets: [Character] = ["(", "[", "{"]
    let closingBrackets: [Character] = [")", "]", "}"]
    let matchingBrackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack = [Character]()
    for character in string {
        if openingBrackets.contains(character) {
            stack.append(character)
        } else if closingBrackets.contains(character) {
            if stack.count == 0 {
                return false
            }
            if stack.last == matchingBrackets[character] {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    return stack.count == 0
}

/// Test Cases
let string = "(((((([[[[[[{{{{{{{{{{{{()}}}}}}}}}}}}]]]]]]))))))((([])({})[])[])[]([]){}(())"
balancedBrackets(of: string)



