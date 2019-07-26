///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

class MinHeap {
    var heap = [Int]()
    
    init(array: [Int]){
        self.heap = array
    }
    
    /// O(n) time | O(1) space
    func buildHeap(array: inout [Int]) -> [Int] {
        let firstParentIndex = (array.count - 2) / 2
        var currentIndex = firstParentIndex
        while currentIndex >= 0 {
            siftDown(currentIndex: currentIndex, endIndex: array.count - 1, heap: &array)
            currentIndex -= 1
        }
        /*
        for i in stride(from: (array.count/2-1), through: 0, by: -1) {
            siftDown(currentIndex: i, endIndex: array.count - 1, heap: &array)
        }
        */
        return array
    }
    
    /// O(log n) time
    func siftDown(currentIndex: Int, endIndex: Int, heap: inout [Int]) {
        var childOneIndex = 2 * currentIndex + 1
        var currentIndex = currentIndex
        print(endIndex)
        while childOneIndex <= endIndex {
            let childTwoIndex = 2 * currentIndex + 2 <= endIndex ? currentIndex * 2 + 2 : -1
            var indexToSwap = 0
            if childTwoIndex != 1 && heap[childTwoIndex] < heap[childOneIndex] {
                indexToSwap = childTwoIndex
            } else {
                indexToSwap = childOneIndex
            }
            if heap[indexToSwap] < heap[currentIndex] {
                heap.swapAt(currentIndex, indexToSwap)
                currentIndex = indexToSwap
                childOneIndex = currentIndex * 2 + 1
            } else {
                return
            }
        }
    }
    
    /// O(log n) time
    func siftUp(currentIndex: Int, heap: inout [Int]) {
        var parentIndex = (currentIndex - 1) / 2
        var currentIndex = currentIndex
        while parentIndex > 0 && heap[currentIndex] < heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = (currentIndex - 1) / 2
        }
    }
    
    func peak() -> Int? {
        return heap.count - 1
    }
    
    /// O(log n) time
    func insert(value: Int) {
        heap.append(value)
        siftUp(currentIndex: heap.count - 1, heap: &heap)
    }
    
    /// O(log n) time
    func remove() -> Int? {
        heap.swapAt(0, heap.count - 1)
        let valueToRemove = heap.popLast()
        siftDown(currentIndex: 0, endIndex: heap.count - 1, heap: &heap)
        return valueToRemove
    }
}

/// Test Case
let array = [8, 12, 23, 17, 31, 30, 44, 102, 18]
let heap = MinHeap(array: array)
heap.heap
heap.peak()
heap.insert(value: 10)
heap.heap
heap.remove()
heap.heap

var buildArray = [8, 12, 23, 17, 31, 30, 44, 102, 18, 10]
let heapTwo = MinHeap(array: buildArray)
heapTwo.heap
heapTwo.buildHeap(array: &buildArray)
