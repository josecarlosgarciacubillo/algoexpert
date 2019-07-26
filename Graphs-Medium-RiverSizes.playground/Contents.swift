///
/// Created by José Carlos García
/// Mexican Dev Mafia
///
import Foundation

/// O(wh) time | O(wh) space where w = width and h = height
func rivesSizes(matrix: [[Int]]) -> [Int] {
    var sizes = [Int]()
    /// Initialize the mirror bool matrix of visited nodes
    var visited = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    /// Iterate over every element in tre matrix
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            /// If node is visited we continue
            if visited[i][j] {
                continue
            }
            traverseNode(i: i, j: j, matrix: matrix, visited: &visited, sizes: &sizes)
        }
    }
    return sizes.sorted()
}

func traverseNode(i: Int, j: Int, matrix: [[Int]], visited: inout [[Bool]], sizes: inout [Int]) {
    /// Setting river size
    var currentRiverSize = 0
    /// Setting nodes to search stack
    var nodesToExplore: [[Int]] = [[i, j]]
    while !nodesToExplore.isEmpty {
        var currentNode = nodesToExplore.popLast()
        let i = currentNode![0]
        let j = currentNode![1]
        if visited[i][j] {
            continue
        }
        visited[i][j] = true
        /// We skip the node cuz' is land
        if matrix[i][j] == 0 {
            continue
        }
        /// If not land update the river size
        currentRiverSize += 1
        /// Update next nodes to explore
        let unvisitedNeighbors = getUnvisitedNeighbords(i: i, j: j, matrix: matrix, visited: visited)
        for neighbord in unvisitedNeighbors {
            nodesToExplore.append(neighbord)
        }
    }
    if currentRiverSize > 0 {
        sizes.append(currentRiverSize)
    }
}

func getUnvisitedNeighbords(i: Int, j: Int, matrix: [[Int]], visited: [[Bool]]) -> [[Int]] {
    var unvisitedNeighbords = [[Int]]()
    /// Node above us
    if i > 0 && !visited[i - 1][j] {
        unvisitedNeighbords.append([i - 1, j])
    }
    /// Node below us
    if i < matrix.count - 1 && !visited[i + 1][j] {
        unvisitedNeighbords.append([i + 1, j])
    }
    /// Node at left
    if j > 0 && !visited[i][j - 1] {
        unvisitedNeighbords.append([i, j - 1])
    }
    /// Node at right
    if j < matrix[0].count - 1 && !visited[i][j + 1] {
        unvisitedNeighbords.append([i, j + 1])
    }
    return unvisitedNeighbords
}

/// Test Case
let matrix = [
    [1,0,0,1,0,1],
    [1,0,1,0,0,1],
    [0,0,1,0,1,1],
    [1,0,1,0,1,1],
    [1,0,1,1,0,1]
]

rivesSizes(matrix: matrix)
