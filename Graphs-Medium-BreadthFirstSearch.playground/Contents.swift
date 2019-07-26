///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(v + e) time | O(v) space
class Node {
    var name: String
    var children = [Node]()
    
    init(_ name: String) {
        self.name = name
    }
    
    func addChild(_ name: String) -> Node {
        self.children.append(Node(name))
        return self
    }
    
    func breadthFirstSearch(_ array: inout [String]) -> [String] {
        let queue = Queue()
        queue.enqueue(self)
        while queue.list.count > 0 {
            let currentNode = queue.dequeue()!
            array.append(currentNode.name)
            for child in currentNode.children {
                queue.enqueue(child)
            }
        }
        return array
    }
    
    /* Same without using Queue class
    func breadthFirstSearch(_ array: inout [String]) -> [String] {
        var queue: [Node] = [self]
        while queue.count > 0 {
            let currentNode = queue.removeFirst()
            array.append(currentNode.name)
            for child in currentNode.children {
                queue.append(child)
            }
        }
        return array
    }
    */
}

class Queue {
    var list = [Node]()
    
    func enqueue(_ element: Node) {
        list.append(element)
    }
    
    func dequeue() -> Node? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
}

/// Test Case
var root = Node("A")
root.addChild("B")
root.addChild("C")
root.addChild("D")
root.children[0].addChild("E")
root.children[0].addChild("F")
root.children[2].addChild("G")
root.children[2].addChild("H")
root.children[0].children[1].addChild("I")
root.children[0].children[1].addChild("J")
root.children[2].children[0].addChild("K")

var array = [String]()
root.breadthFirstSearch(&array)

