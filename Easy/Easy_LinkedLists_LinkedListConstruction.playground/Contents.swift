//
//  Created by José Carlos García
//  Mexican Dev Mafia
//
import Foundation

// O(n) time | O(1) space -> Insert at position
// O(1) time | O(1) space -> Set head, tail, insert after, insert before
class DoublyLinkedList {
    var head: Node?
    var tail: Node?
    
    init(head: Node?, tail: Node?) {
        self.head = head
        self.tail = tail
    }
    // O(1) time | O(1) space
    func setHeadWith(_ node: Node) {
        if head == nil {
            head = node
            tail = node
            return
        }
        insertBefore(head, with: node)
    }
    // O(1) time | O(1) space
    func setTailWith(_ node: Node) {
        if tail == nil {
            setHeadWith(node)
            return
        }
        insertAfter(tail, with: node)
    }
    // O(1) time | O(1) space
    func insertBefore(_ node: Node?, with nodeToInsert: Node) {
        if nodeToInsert == head && nodeToInsert == tail {
            return
        }
        remove(nodeToInsert)
        nodeToInsert.prev = node?.prev
        nodeToInsert.next = node
        if node?.prev == nil {
            head = nodeToInsert
        } else {
            node?.prev?.next = nodeToInsert
        }
        node?.prev = nodeToInsert
    }
    // O(1) time | O(1) space
    func insertAfter(_ node: Node?, with nodeToInsert: Node) {
        if nodeToInsert == head && nodeToInsert == tail {
            return
        }
        remove(nodeToInsert)
        nodeToInsert.prev = node
        nodeToInsert.next = node?.next
        if node?.next == nil {
            tail = nodeToInsert
        } else {
            node?.next?.prev = nodeToInsert
        }
        node?.next = nodeToInsert
    }
    // O(p) time | O(1) space "p" -> position
    func insertAtPosition(_ position: Int, with nodeToInsert: Node) {
        if position == 1 {
            setHeadWith(nodeToInsert)
            return
        }
        var node = head
        var currentPosition = 1
        while node != nil && currentPosition != position {
            node = node!.next
            currentPosition += 1
        }
        if node != nil {
            insertBefore(node, with: nodeToInsert)
        } else {
            setTailWith(nodeToInsert)
        }
    }
    // O(n) time | O(1) space
    func removeNodesWithValue(_ value: Int) {
        guard var node = head else {
            return
        }
        while node != nil {
            let nodeToRemove = node
            node = node.next!
            if nodeToRemove.value == value {
                remove(nodeToRemove)
            }
        }
    }
    // O(1) time | O(1) space
    func remove(_ node: Node) {
        if var head = head {
            if node == head {
                head = head.next!
            }
        }
        if var tail = tail {
            if node == tail {
                tail = tail.prev!
            }
        }
        removeNodeBindings(node)
    }
    // O(n) time | O(1) space
    func containsNodeWithValue(_ value: Int) -> Bool {
        var node = head
        while node != nil && node!.value != value {
            node = node!.next
        }
        return node != nil
    }
    
    func removeNodeBindings(_ node: Node) {
        if let _ = node.prev {
            node.prev?.next = node.next
        }
        if let _ = node.next {
            node.next?.prev = node.prev
        }
        node.prev = nil
        node.next = nil
    }
}

class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next && lhs.prev == rhs.prev && lhs.value == rhs.value
    }
    var next: Node?
    weak var prev: Node?
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

// Pretty printing
extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)
let doublyLinkedList = DoublyLinkedList(head: nil, tail: nil)

doublyLinkedList.setHeadWith(node1)
doublyLinkedList.setTailWith(node4)
doublyLinkedList.insertBefore(node4, with: node2)
doublyLinkedList.insertAfter(node2, with: node3)
doublyLinkedList.containsNodeWithValue(2)
doublyLinkedList.remove(node2)
doublyLinkedList.setTailWith(node2)
doublyLinkedList.insertAtPosition(1, with: node5)

print(doublyLinkedList)
