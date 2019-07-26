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

/// O(n) time | O(n) space
func inOrderTraverse(tree: BST, array: inout [Int]) -> [Int] {
    if let left = tree.left {
        inOrderTraverse(tree: left, array: &array)
    }
    array.append(tree.value)
    if let right = tree.right {
        inOrderTraverse(tree: right, array: &array)
    }
    return array
}

/// O(n) time | O(n) space
func preOrderTraverse(tree: BST, array: inout [Int]) -> [Int] {
    array.append(tree.value)
    if let left = tree.left {
        preOrderTraverse(tree: left, array: &array)
    }
    if let right = tree.right {
        preOrderTraverse(tree: right, array: &array)
    }
    return array
}

/// O(n) time | O(n) space
func postOrderTraverse(tree: BST, array: inout [Int]) -> [Int] {
    if let left = tree.left {
        postOrderTraverse(tree: left, array: &array)
    }
    if let right = tree.right {
        postOrderTraverse(tree: right, array: &array)
    }
    array.append(tree.value)
    return array
}



/// Test Case
var test1 = BST(10)
test1.insert(5).insert(2).insert(1).insert(5).insert(15).insert(22)
print(test1)

var array1 = [Int]()
var array2 = [Int]()
var array3 = [Int]()
inOrderTraverse(tree: test1, array: &array1)
preOrderTraverse(tree: test1, array: &array2)
postOrderTraverse(tree: test1, array: &array3)
