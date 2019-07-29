//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
    }
}
/*
func findClosestValueInBst(tree: BST, target: Int) -> Int {
    return findClosestValueInBstHelper(tree: tree, target: target, closest: &tree.value)
}

func findClosestValueInBstHelper(tree: BST, target: Int, closest: inout Int) -> Int {
    if tree == nil {
        return closest
    }
    if (target - closest) > (target - tree.value) {
        closest = tree.value
    }
    if target < tree.value {
        return findClosestValueInBstHelper(tree: tree.left!, target: target, closest: &closest)
    } else if target > tree.value {
        return findClosestValueInBstHelper(tree: tree.right!, target: target, closest: &closest)
    } else {
        return closest
    }
}
*/

func findClosestValueInBst(tree: BST, target: Int) -> Int {
    return findClosestValueInBstHelper(tree: tree, target: target, closest: Int.max)
}

func findClosestValueInBstHelper(tree: BST, target: Int, closest: Int) -> Int {
    var closest = closest
    var currentNode: BST? = tree
    while currentNode != nil {
        if target - closest > target - currentNode!.value {
            closest = currentNode!.value
        }
        if target < currentNode!.value {
            currentNode = currentNode?.left
        } else if target > currentNode!.value {
            currentNode = currentNode?.right
        } else {
            break
        }
    }
    return closest
}
/*
func findClosestValueInBst(tree: BST, target: Int) -> Int {
    var currentNode: BST? = tree
    while currentNode != nil {
        if target > currentNode!.value {
            currentNode = currentNode!.right!
        } else {
            currentNode = currentNode!.left!
        }
    }
    return currentNode!.value
}
*/
var bst = BST(value: 10)
var node5 = BST(value: 5)
var node15 = BST(value: 15)
var node13 = BST(value: 13)
var node22 = BST(value: 22)
var node14 = BST(value: 14)

bst.left = node5
bst.right = node15
node15.left = node13
node15.right = node22
node13.right = node14

findClosestValueInBst(tree: bst, target: 12)

/*
bst.left?.value = 5
bst.right?.value = 15
bst.right?.left?.value = 13
bst.right?.right?.value = 22
bst.right?.left?.right?.value = 14
*/

//findClosestValueInBst(tree: bst, target: 12)
