//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// O(n) time | O(n) space
func caesarCipherEncryptor(string: String, key: Int) -> String {
    var coded = String()
    var alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    var alphabetDic = [Character: Int]()
    for i in 0..<alphabet.count {
        alphabetDic[alphabet[i]] = i + 1
    }
    for c in string {
        if let position = alphabetDic[c] {
            if position + key % 26 > alphabet.count {
                coded.append(alphabet[position + key % 26 - alphabet.count - 1])
            } else {
                coded.append(alphabet[position + key % 26 - 1])
            }
        }
    }
    return coded
}

func caesarCipherEncryptorAlt(string: String, key: Int) -> String {
    var newLetters = [Character]()
    let newKey = key % 26
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    for letter in string {
        newLetters.append(getNewLetter(letter, newKey, alphabet))
    }
    return String(newLetters)
}

func getNewLetter(_ letter: Character, _ newKey: Int, _ alphabet: [Character]) -> Character {
    let newLetterCode = alphabet.firstIndex(of: letter)! + newKey
    return newLetterCode <= 25 ? alphabet[newLetterCode] : alphabet[-1 + newLetterCode % 25]
}

/*
// Check cast and syntax for Unicode
// O(n) time | O(n) space
func caesarCipherEncryptorUnicode(string: String, key: Int) -> String {
    var newLetters = [Character]()
    let newKey = key % 26
    for letter in string {
        newLetters.append(getNewLetter(letter, newKey))
    }
    return String(newLetters)
}

func getNewLetter(_ letter: Character, _ newKey: Int) -> Character {
    let newLetterCode = Int(UnicodeScalar(String(letter))!.value) + newKey
    return newLetterCode <= 122 ? Unicode.Scalar(newLetterCode) : Unicode.Scalar(96 + newLetterCode % 122)
}
*/

let test = "xyz"
let key = 2

caesarCipherEncryptor(string: test, key: key)
caesarCipherEncryptorAlt(string: test, key: key)


