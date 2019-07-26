///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(d) time | O(1) space where d = depth
class Node: Equatable {
    var name: String
    var ancestor: Node?
    
    init(_ name: String) {
        self.name = name
    }
    
    func addAsAncestor(_ descendants: [Node]) {
        for descendant in descendants {
            descendant.ancestor = self
        }
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.name == rhs.name
    }
}

func getYoungestCommonAncestor(topAncestor: inout Node, descendantOne: inout Node, descendantTwo: inout Node) -> Node {
    let depthOne = getDescendantDepth(descentant: &descendantOne, topAncestor: topAncestor)
    let depthTwo = getDescendantDepth(descentant: &descendantTwo, topAncestor: topAncestor)
    if depthOne > depthTwo {
        return backtrackAncestralTree(lowerDescendant: &descendantOne, higherDescendant: &descendantTwo, diff: depthOne - depthTwo)
    } else {
        print(descendantTwo.name)
        print(descendantOne.name)
        return backtrackAncestralTree(lowerDescendant: &descendantTwo, higherDescendant: &descendantOne, diff: depthTwo - depthOne)
    }
}

func getDescendantDepth(descentant: inout Node, topAncestor: Node) -> Int {
    var depth = 0
    while descentant != topAncestor {
        depth += 1
        descentant = descentant.ancestor!
    }
    return depth
}

func backtrackAncestralTree(lowerDescendant: inout Node, higherDescendant: inout Node, diff: Int) -> Node {
    var diff = diff
    while diff > 0 {
        if let lowerDescentandAncestor = lowerDescendant.ancestor {
            lowerDescendant = lowerDescentandAncestor
        }
        diff -= 1
    }
    while lowerDescendant != higherDescendant {
        lowerDescendant = lowerDescendant.ancestor!
        higherDescendant = higherDescendant.ancestor!
    }
    return lowerDescendant
}
    
/// Test Case
var root = Node("A")
var nodeB = Node("B")
var nodeC = Node("C")
var nodeD = Node("D")
var nodeE = Node("E")
var nodeF = Node("F")
var nodeG = Node("G")
var nodeH = Node("H")
var nodeI = Node("I")

root.addAsAncestor([nodeB, nodeC])
nodeB.addAsAncestor([nodeD, nodeE])
nodeC.addAsAncestor([nodeF, nodeG])
nodeD.addAsAncestor([nodeH, nodeI])

let common = getYoungestCommonAncestor(topAncestor: &root, descendantOne: &nodeE, descendantTwo: &nodeI)
print(common.name)
