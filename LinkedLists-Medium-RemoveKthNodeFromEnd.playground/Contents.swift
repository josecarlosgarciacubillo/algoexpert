///
///  Created by José Carlos García
///  Mexican Dev Mafia
///
import Foundation

class LinkedList {
    var value: Int
    var next: LinkedList?
    
    init(value: Int) {
        self.value = value
    }
}

// Pretty printing
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "[\(self.value) -> "
        var node = next
        
        while node != nil {
            text += "\(node!.value) "
            node = node!.next
            if node != nil { text += " -> " }
        }
        return text + "]"
    }
}

/// O(n) time | O(1) space
func removeKthNodeFromEnd(head: LinkedList, k: Int) {
    var counter = 1
    var firstPointer = head
    var secondPointer: LinkedList? = head
    /// Positioning secondPointer
    while counter <= k {
        secondPointer = secondPointer?.next
        counter += 1
    }
    /// Edge case -> head node is the one to remove
    if secondPointer == nil {
        head.value = head.next!.value
        head.next = head.next?.next
        return
    }
    while secondPointer?.next != nil {
        firstPointer = firstPointer.next!
        secondPointer = secondPointer?.next
    }
    firstPointer.next = firstPointer.next?.next
}

var head = LinkedList(value: 0)
var node1 = LinkedList(value: 1)
var node2 = LinkedList(value: 2)
var node3 = LinkedList(value: 3)
var node4 = LinkedList(value: 4)
var node5 = LinkedList(value: 5)
var node6 = LinkedList(value: 6)
var node7 = LinkedList(value: 7)
var node8 = LinkedList(value: 8)
var node9 = LinkedList(value: 9)
head.next = node1
node1.next = node2
node2.next = node3
//node3.next = node4
//node4.next = node5
//node5.next = node6
//node6.next = node7
//node7.next = node8
//node8.next = node9
print(head)

removeKthNodeFromEnd(head: head, k: 4)
print(head)
