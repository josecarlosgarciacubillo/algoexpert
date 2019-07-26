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

/// O(n) time | O(log n) space
func invertBinaryTreeRecursion(tree: inout BST?) {
    guard var tree = tree else { return }
    swapNodes(tree: &tree)
    invertBinaryTreeRecursion(tree: &tree.left)
    invertBinaryTreeRecursion(tree: &tree.right)
}

/// O(n) time | O(n) space
func invertBinaryTreeIteration(tree: inout BST) {
    var queue: [BST] = [tree]
    while !queue.isEmpty {
        var current = queue.removeFirst()
        swapNodes(tree: &current)
        if let left = current.left {
            queue.append(left)
        }
        if let right = current.right {
            queue.append(right)
        }
    }
}

func swapNodes(tree: inout BST) {
    let tmpLeft = tree.left
    tree.left = tree.right
    tree.right = tmpLeft
}


/// Test Case
var root: BST? = BST(1)
var node2 = BST(2)
var node3 = BST(3)
var node4 = BST(4)
var node5 = BST(5)
var node6 = BST(6)
var node7 = BST(7)
var node8 = BST(8)
var node9 = BST(9)
//test1.insert(2).insert(3).insert(4).insert(5).insert(6).insert(7).insert(8).insert(9)
root!.left = node2
root!.right = node3
node2.left = node4
node2.right = node5
node4.left = node8
node4.right = node9
node3.left = node6
node3.right = node7

print(root!)
//invertBinaryTreeRecursion(tree: &root)
invertBinaryTreeIteration(tree: &root!)
print(root!)
