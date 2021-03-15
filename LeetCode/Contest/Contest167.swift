//
//  Contest167.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 12/14/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class Contest167D {
    
    static func run() {
        let grid1 =
            [[0,0,0],
             [1,1,0],
             [0,0,0],
             [0,1,1],
             [0,0,0]]
        print("Expected: 6, Actual: \(Contest167D().shortestPath(grid1, 1))")
    
        let grid2 =
            [[0,1,1],
             [1,1,1],
             [1,0,0]]
        print("Expected: -1, Actual: \(Contest167D().shortestPath(grid2, 1))")
        
        let grid3 =
            [[0,1,1],
             [1,1,1],
             [1,0,0]]
        print("Expected: 4, Actual: \(Contest167D().shortestPath(grid3, 2))")
        
        let grid4 =
            [[0,0,0],
             [1,1,0],
             [0,0,0],
             [0,1,1],
             [0,0,0],
             [1,1,0],
             [0,0,0],
             [0,1,1],
             [0,0,0]]
        print("Expected: 18, Actual: \(Contest167D().shortestPath(grid4, 0))")
        
        let grid5 =
            [[0,0,0],
             [1,1,0],
             [0,0,0],
             [0,1,1],
             [0,0,0],
             [1,1,0],
             [0,0,0],
             [0,1,1],
             [0,0,0]]
        print("Expected: 10, Actual: \(Contest167D().shortestPath(grid5, 2))")
        
        let grid6 =
            [[0,0,0],
             [0,0,0],
             [0,0,1]]
        print("Expected: -1, Actual: \(Contest167D().shortestPath(grid6, 0))")
        
        let grid7 =
            [[0,0,0],
             [0,0,0],
             [0,0,0]]
        print("Expected: 4, Actual: \(Contest167D().shortestPath(grid7, 0))")
        
        let grid8 = [[0,1,1,1,0,0,0,1,1,0,1,1,1,0,0,1,0,0,1,0,1,0,1,1,0,1,1,0,1,1,1,1,0,0,0,1,1,0,0,1],[0,0,0,0,0,1,1,0,0,1,1,0,1,0,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,1,1,1,0,1,1,1,1],[0,1,1,1,1,1,0,1,0,1,0,1,0,1,0,0,1,0,1,1,0,0,1,1,0,0,1,0,1,0,0,1,0,1,1,0,0,0,1,1],[0,1,0,1,1,1,1,1,1,0,1,1,0,0,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,0,0,1,0,1,1,0,1,1,1],[1,0,0,1,0,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,0,1,0,0,1,0,0,1,1,1,0,1,0,1,1,1,0,0,1],[1,1,1,1,1,1,1,0,0,0,0,0,1,0,1,1,0,0,1,0,1,1,1,1,0,0,1,1,1,0,1,0,1,0,1,1,1,0,1,1],[0,0,0,1,1,1,0,1,1,1,1,1,0,1,0,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,0,1],[0,1,1,0,1,0,0,1,1,1,0,0,1,0,0,1,0,1,1,1,1,1,1,1,0,1,1,0,1,1,1,0,1,0,0,1,0,0,1,0],[0,1,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0,1,1,1,1,0,1,0,0,0,0,0,1,1,0,1,1,0,1,1,1,1,1,0],[0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0],[1,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,1,0,0,0,1,1,0,1,1,1,0,0,1,0,1,1,1,0,0,1,0,0,1,1],[0,0,1,1,0,0,1,1,1,0,1,1,0,1,0,0,0,1,1,0,0,0,0,1,1,0,1,1,0,0,1,0,0,1,1,0,0,0,1,0],[0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,1,1,0,1,1,0,1,0,0,0,1,0,0,0,1,0,1,1,1,1,1,0,1,1],[0,1,1,1,1,0,0,0,0,0,1,1,1,1,0,1,1,1,0,0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,1,0,1,0,1,1],[1,0,0,0,1,1,1,0,0,0,0,1,1,0,1,1,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,1,0,1],[1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,0,1,0,1],[1,0,1,0,1,0,1,1,1,0,1,0,0,0,1,0,0,0,0,1,1,1,0,0,1,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1],[0,1,1,0,0,0,1,1,0,0,1,0,1,1,1,0,0,1,0,0,1,1,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,1],[1,0,1,0,0,1,0,1,0,1,1,1,1,1,0,1,0,0,0,0,0,0,0,1,0,1,0,1,1,1,1,1,0,0,1,0,0,0,1,1],[0,1,0,1,0,0,0,1,0,0,1,1,0,0,1,1,0,0,0,1,0,1,1,1,0,1,1,1,0,0,1,1,1,0,0,0,1,0,0,0],[0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,0,0,1,0,1,0,1,0,0,0,0,1,0,1,1,0,1],[0,0,1,1,0,1,1,0,1,0,0,0,1,1,0,0,1,1,1,0,0,0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,1,0,0,0],[1,1,1,1,0,0,1,0,1,0,1,1,0,1,1,0,0,0,0,1,1,1,1,1,0,1,0,1,0,0,0,0,0,1,0,1,1,1,1,1],[0,0,0,0,1,1,0,0,0,1,0,1,1,1,1,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,0,1,1,1,0,1,0,0,1,0]]
        print("Expected: ?, Actual: \(Contest167D().shortestPath(grid8, 617))")
    }
    
    struct Entry {
        var dict = [Int: Int]()
    }
    
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        
        guard grid.count > 0, grid[0].count > 0 else {
            return -1
        }
        
        let rowCount = grid.count
        let colCount = grid[0].count
        
        var curr = [[Entry?]](repeating: [Entry?](repeating: nil, count: colCount), count: rowCount)
        
        curr[0][0] = Entry()
        curr[0][0]?.dict[0] = 0
        
        var changed = false
        
        repeat {
            
            changed = false
            
            for r in 0..<rowCount {
                for c in 0..<colCount {
                    if curr[r][c] == nil {
                        curr[r][c] = Entry()
                    }
                    
                    let hasObstacle = grid[r][c] != 0
                    
                    for neighbor in getNeighbors(r, c, rowCount, colCount) {
                        if let entry = curr[neighbor.0][neighbor.1] {
                            for (kp, min) in entry.dict {
                                let newKp: Int
                                if hasObstacle, kp >= k {
                                    continue
                                } else if hasObstacle {
                                    newKp = kp+1
                                } else {
                                    newKp = kp
                                }
                                
                                if let oldMin = curr[r][c]!.dict[newKp]  {
                                    if min+1 < oldMin {
                                        curr[r][c]!.dict[newKp] = min+1
                                        changed = true
                                    }
                                } else {
                                    curr[r][c]!.dict[newKp] = min+1
                                    changed = true
                                }
                            }
                        }
                    }
                }
            }
            
        } while changed
        
        return curr[rowCount-1][colCount-1]?.dict.values.min() ?? -1
    }
    
    func getNeighbors(_ r: Int, _ c: Int, _ rowCount: Int, _ colCount: Int) -> [(Int, Int)] {
        var neighbors = [(Int, Int)]()
        if r > 0 {
            neighbors.append((r-1, c))
        }
        if c > 0 {
            neighbors.append((r, c-1))
        }
        if r < rowCount-1 {
            neighbors.append((r+1, c))
        }
        if c < colCount-1 {
            neighbors.append((r, c+1))
        }
        return neighbors
    }
}

class Contest167C {
    
//    Input: mat = [[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], threshold = 4
//    Output: 2
//    Explanation: The maximum side length of square with sum less than 4 is 2 as shown.
    
//    Input: mat = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], threshold = 1
//    Output: 0
    
//    Input: mat = [[1,1,1,1],[1,0,0,0],[1,0,0,0],[1,0,0,0]], threshold = 6
//    Output: 3
    
//    Input: mat = [[18,70],[61,1],[25,85],[14,40],[11,96],[97,96],[63,45]], threshold = 40184
//    Output: 2
    
    static func run() {
        let mat = [[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]]
        print("Expected: 2, Actual: \(Contest167C().maxSideLength(mat, 4))")
        
        let mat2 = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]]
        print("Expected: 0, Actual: \(Contest167C().maxSideLength(mat2, 1))")
        
        let mat3 = [[1,1,1,1],[1,0,0,0],[1,0,0,0],[1,0,0,0]]
        print("Expected: 3, Actual: \(Contest167C().maxSideLength(mat3, 6))")
        
        let mat4 = [[18,70],[61,1],[25,85],[14,40],[11,96],[97,96],[63,45]]
        print("Expected: 2, Actual: \(Contest167C().maxSideLength(mat4, 40184))")
    }
    
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        
        
        var curr = mat
        
        if !test(curr, 1, threshold) {
            return 0
        }
        
        var l = 1
        while next(&curr, l+1, mat), test(curr, l+1, threshold) {
            l = l+1
        }
        return l
    }
    
    func next(_ mat: inout [[Int]], _ l: Int, _ omat: [[Int]]) -> Bool {
        let rCount = mat.count
        let cCount = mat[0].count
        
        guard l <= rCount, l <= cCount else {
            return false
        }
        
        var hasNext = false
        
        for r in 0...(rCount - l) {
            for c in 0...(cCount - l) {
                let lastCol = (c+l)-1
                let lastRow = (r+l)-1
                
                var colSum = 0
                for rp in r...lastRow {
                    colSum += omat[rp][lastCol]
                }
                
                var rowSum = 0
                for cp in c..<lastCol {
                    rowSum += omat[lastRow][cp]
                }
                
                mat[r][c] = mat[r][c] + colSum + rowSum
                
                hasNext = true
            }
        }
        
        return hasNext
    }
    
    func test(_ mat: [[Int]], _ l: Int, _ threshold: Int) -> Bool {
        let rCount = mat.count
        let cCount = mat[0].count
        
        for r in 0...(rCount - l) {
            for c in 0...(cCount - l) {
                if mat[r][c] <= threshold {
                    return true
                }
            }
        }
        
        return false
    }
}

class Contest167B {
    
    static func run() {
        
        print("Expected: [123,234], Actual: \(Contest167B().sequentialDigits(100, 300))")
        
        print("Expected: [1234,2345,3456,4567,5678,6789,12345], Actual: \(Contest167B().sequentialDigits(1000, 13000))")
    }
    
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var r = [Int]()
        for i in 1..<9 {
            var curr = i
            while complete(&curr, low, high, &r) { }
        }
        return r.sorted()
    }
    
    func complete(_ curr: inout Int, _ low: Int, _ high: Int, _ r: inout [Int]) -> Bool {
        
        let shouldCountinue: Bool
        
        if curr >= low, curr <= high {
            r.append(curr)
            shouldCountinue = true
        } else if curr < low {
            shouldCountinue = true
        } else { // if curr > high
            shouldCountinue = false
        }
        
        if shouldCountinue {
            let lastDigit = curr % 10
            guard lastDigit < 9 else { return false }
            curr = curr * 10 + (lastDigit+1)
        }
        
        return shouldCountinue
    }
}

class Contest167A {
    
    static func run() {
        
        // [1,0,1]
        let list1 = ListNode(1, ListNode(0, ListNode(1, nil)))
        print("Expected: 5, Actual: \(Contest167A().getDecimalValue(list1))")
        
        // [0]
        let list2 = ListNode(0, nil)
        print("Expected: 0, Actual: \(Contest167A().getDecimalValue(list2))")
        
        // [1]
        let list3 = ListNode(1, nil)
        print("Expected: 1, Actual: \(Contest167A().getDecimalValue(list3))")
        
        // [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
        let list4 = ListNode(1, ListNode(0, ListNode(0, ListNode(1, ListNode(0, ListNode(0, ListNode(1, ListNode(1, ListNode(1, ListNode(0, ListNode(0, ListNode(0, ListNode(0, ListNode(0, ListNode(0, nil)))))))))))))))
        print("Expected: 18880, Actual: \(Contest167A().getDecimalValue(list4))")
        
        // [0,0]
        let list5 = ListNode(0, ListNode(0, nil))
        print("Expected: 0, Actual: \(Contest167A().getDecimalValue(list5))")
    }
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        var vals = [Int]()
        var curr = head
        while curr != nil {
            vals.append(curr!.val)
            curr = curr?.next
        }
        
        var acc = 0
        for i in 0..<vals.count {
            let v = vals[i]
            if v != 0 {
                let p = (vals.count - 1) - i
                acc += Int(pow(Double(2), Double(p)))
            }
        }
        
        return acc
    }
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}



