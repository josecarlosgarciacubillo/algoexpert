///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

class Node {
    var name: String
    var children = [Node]()
    
    init(_ name: String) {
        self.name = name
    }
    
    func addChild(_ name: String) -> Node {
        let child = Node(name)
        children.append(child)
        return child
    }
    
    /// O(v + e) time | O(v) space -> v = vertice, e = edge
    func depthFirstSearch(_ array: inout [String]) -> [String] {
        array.append(self.name)
        for child in children {
            child.depthFirstSearch(&array)
        }
        return array
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var s = "\(name)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

func df(_ node: Node, _ array: inout [String]) -> [String] {
    array.append(node.name)
    for child in node.children {
        df(child, &array)
    }
    return array
}

/// Test Case
var nodeA = Node("A")
nodeA.addChild("B")
nodeA.addChild("C")
nodeA.addChild("D")
nodeA.children.first?.addChild("E")
nodeA.children.first?.addChild("F")
nodeA.children.first?.children[1].addChild("I")
nodeA.children.first?.children[1].addChild("J")
nodeA.children.last?.addChild("G")
nodeA.children.last?.addChild("H")
nodeA.children.last?.children.first?.addChild("K")

print(nodeA)

var array = [String]()
nodeA.depthFirstSearch(&array)

var ar = [String]()
df(nodeA, &ar)
