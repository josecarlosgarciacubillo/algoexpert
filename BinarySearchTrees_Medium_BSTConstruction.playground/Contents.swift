//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
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
    
    func contains(_ value: Int) -> Bool {
        if value < self.value {
            if self.left == nil {
                return false
            } else {
                return self.left!.contains(value)
            }
        } else if value > self.value {
            if self.right == nil {
                return false
            } else {
                return self.right!.contains(value)
            }
        } else {
            return true
        }
    }
}

let root = BST(10)
root.insert(5)
root.insert(15)

root.contains(25)

print(root.value)
print(root.left?.value)
print(root.right?.value)


