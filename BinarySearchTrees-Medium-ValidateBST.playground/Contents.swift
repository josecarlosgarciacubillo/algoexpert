///
///  Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(_ value: Int) -> BST {
        if value < self.value {
            if self.left == nil {
                self.left = BST(value)
            } else {
                self.left?.insert(value)
            }
        } else {
            if self.right == nil {
                self.right = BST(value)
            } else {
                self.right?.insert(value)
            }
        }
        return self
    }
}

extension BST: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

/// O(n) time | O(d) space where d is depth of the tree
func validateBst(tree: BST) -> Bool {
    return validateBst(tree: tree, minValue: Int.min, maxValue: Int.max)
}

func validateBst(tree: BST, minValue: Int, maxValue: Int) -> Bool {
    if tree.value < minValue || tree.value >= maxValue {
        return false
    }
    if let _ = tree.left, !validateBst(tree: tree.left!, minValue: minValue, maxValue: tree.value) {
        return false
    }
    if let _ = tree.right, !validateBst(tree: tree.right!, minValue: tree.value, maxValue: maxValue) {
        return false
    }
    return true
}

/// Test Case
var test1 = BST(10)
test1.insert(5).insert(15).insert(2).insert(5).insert(13).insert(22).insert(1).insert(14)
print(test1)
validateBst(tree: test1)

var test2 = BST(1)
test2.left = BST(5)
test2.right = BST(-3)
print(test2)
validateBst(tree: test2)
