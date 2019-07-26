///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
}

class SuffixTrie {
    var root = TrieNode()
    let endSymbol: Character = "*"
    
    init(string: String) {
        populateSuffixTrieFrom(string)
    }
    
    /// O(n^2) time | O(n^2) space
    func populateSuffixTrieFrom(_ string: String) {
        for i in 0..<string.count {
            insertSubstringStartingAt(i, string: string)
        }
    }
    
    func insertSubstringStartingAt(_ i: Int, string: String) {
        var node = root
        for i in 0..<string.count {
            let startIndex = string.index(string.startIndex, offsetBy: i)
            let endIndex = string.index(string.startIndex, offsetBy: i + 1)
            let letter = String(string[startIndex..<endIndex])
            //if node.children[letter.first!] == nil {
            if !node.children.keys.contains(letter.first!) {
                let newNode = TrieNode()
                node.children[letter.first!] = newNode
            }
            node = node.children[letter.first!]!
        }
        node.children[endSymbol] = nil
    }
    
    /// O(n) time | O(1) space
    func contains(_ string: String) -> Bool {
        guard !string.isEmpty else { return false }
        var node = root
        for letter in string {
            //if node.children[letter] == nil {
            if !node.children.keys.contains(letter) {
                print(letter)
                return false
            }
            node = node.children[letter]!
        }
        return node.children[endSymbol] == nil ? true : false
        //return node.children.keys.contains(endSymbol)
    }
}

/// Test Case
//let str = "babc"
let str = "ab"
var trie = SuffixTrie(string: str)
trie.contains("ab")
trie.root.children["b"]
