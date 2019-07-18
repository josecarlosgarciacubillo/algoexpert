///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// Swifty Way
class MinMaxStack {
    var stack = [Int]()
    
    /// O(1) time
    func peek() -> Int {
        if stack.count > 0 {
            return stack.last!
        }
        return Int()
    }
    /// O(1) time
    func pop() -> Int {
        if stack.count > 0 {
            return stack.removeLast()
        }
        return Int()
    }
    /// O(1) time
    func push(_ number: Int) {
        stack.append(number)
    }
    /// O(n) time
    func getMin() -> Int {
        if stack.count > 0 {
            return stack.min()!
        }
        return Int()
    }
    /// O(n) time
    func getMax() -> Int {
        if stack.count > 0 {
            return stack.max()!
        }
        return Int()
    }
}

/// AlgoExpert Way
class MinMaxStackHash {
    var minMaxStack = [[String: Int]]()
    var stack = [Int]()
    
    /// O(1) time
    func peek() -> Int {
        if stack.count > 0 {
            return stack[stack.count - 1]
        }
        return Int()
    }
    /// O(1) time
    func pop() -> Int {
        if stack.count > 0 {
            minMaxStack.popLast()
            return stack.popLast()!
        }
        return Int()
    }
    /// O(1) time
    func push(_ number: Int) {
        var newMinMax = ["min": number, "max": number]
        if minMaxStack.count > 0 {
            let lastMinMax = minMaxStack[minMaxStack.count - 1]
            newMinMax["min"] = min(lastMinMax["min"]!, number)
            newMinMax["max"] = max(lastMinMax["max"]!, number)
        }
        minMaxStack.append(newMinMax)
        stack.append(number)
    }
    /// O(1) time
    func getMin() -> Int {
        return minMaxStack[minMaxStack.count - 1]["min"]!
    }
    /// O(1) time
    func getMax() -> Int {
        return minMaxStack[minMaxStack.count - 1]["max"]!
    }
}

/// Test Cases
let stack = MinMaxStack()
stack.push(5)
stack.getMin()
stack.getMax()
stack.peek()
stack.push(7)
stack.getMin()
stack.getMax()
stack.peek()
stack.push(2)
stack.getMin()
stack.getMax()
stack.peek()
stack.pop()
stack.pop()
stack.getMin()
stack.getMax()
stack.peek()

let stackHash = MinMaxStackHash()
stack.pop()
stackHash.push(5)
stackHash.getMin()
stackHash.getMax()
stackHash.peek()
stackHash.push(7)
stackHash.getMin()
stackHash.getMax()
stackHash.peek()
stackHash.push(2)
stackHash.getMin()
stackHash.getMax()
stackHash.peek()
stackHash.pop()
stackHash.pop()
stackHash.getMin()
stackHash.getMax()
stackHash.peek()
stackHash.push(23)
stackHash.push(15)
stackHash.push(55)
stackHash.getMin()
stackHash.getMax()
