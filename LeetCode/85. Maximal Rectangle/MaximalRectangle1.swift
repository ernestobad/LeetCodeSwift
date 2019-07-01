//
//  MaximalRectangle1.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/24/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MaximalRectangle1 {
    
    static func run() {
        let matrix0: [[Character]] = [
            ["1","1","1","1","1"],
            ["1","1","1","1","1"],
            ["1","1","1","1","1"],
            ["1","1","1","1","0"]
        ]
        
        print("Expected: 16, Actual: \(MaximalRectangle1().maximalRectangle(matrix0))")
        
        let matrix1: [[Character]] = [
            ["1","0","1","0","0"],
            ["1","0","1","1","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
        ]
        
        print("Expected: 6, Actual: \(MaximalRectangle1().maximalRectangle(matrix1))")
        
        let matrix2: [[Character]] = [
            ["1","0","1","0","0"],
            ["1","0","0","0","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
        ]
        
        print("Expected: 5, Actual: \(MaximalRectangle1().maximalRectangle(matrix2))")
        
        let matrix3: [[Character]] = [
            ["1","1"],
            ["1","0"],
        ]
        
        print("Expected: 2, Actual: \(MaximalRectangle1().maximalRectangle(matrix3))")
        
        let matrix4: [[Character]] = [
            ["1","1"],
            ["1","1"],
        ]
        
        print("Expected: 4, Actual: \(MaximalRectangle1().maximalRectangle(matrix4))")
        
        let matrix5: [[Character]] = [
            ["1","0"],
            ["0","0"],
        ]
        
        print("Expected: 1, Actual: \(MaximalRectangle1().maximalRectangle(matrix5))")
        
        let matrix6: [[Character]] = [
            ["1","0"],
            ["1","0"],
        ]
        
        print("Expected: 2, Actual: \(MaximalRectangle1().maximalRectangle(matrix6))")
        
        let matrix7: [[Character]] = [
            ["1","1","1","1","1","1","1","1"],
            ["1","1","1","1","1","1","1","0"],
            ["1","1","1","1","1","1","1","0"],
            ["1","1","1","1","1","0","0","0"],
            ["0","1","1","1","1","0","0","0"]]
        
        print("Expected: 21, Actual: \(MaximalRectangle1().maximalRectangle(matrix7))")
        
        let matrix8: [[Character]] = [["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","0","0","1","1","1","1","1","1","1","1","0","0","1","1","1","0","1","1","1","1","1","1","1","1"],["1","1","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","0","1","0","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","0","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","0","1","1","0","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","0","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","0","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","1","1","0","1","1","1","1"],["0","1","1","0","1","1","0","1","0","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","0","1"],["0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","0","0","1","1","0","0","1","1","0","1","1","0","1","0","1","0","1"],["1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","1","0","1","0","1","1","0","1","0","1","1"],["1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1","1"],["1","1","1","0","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","0","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","0","1","0","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","1","1","1","1","1","0","0","1","1","1","1","1"],["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1"],["1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","1","0","0","1","0","1","1","1","1","1","0","1","1","1","1","1","1"],["1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1","0","1","1","0","1","1"],["1","1","0","0","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","0","1","1","1","0","0","1","1","1","1","1","1","1","1"],["1","1","1","0","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","0","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1"],["1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","0","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1"],["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","1","1","0","1","1","0","1","1"],["1","1","1","1","0","1","1","0","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","0","0","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","0","1","0","1","0","1","1","0","1","1","1","1","1","1","1","1"],["1","0","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1"],["1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1"],["0","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","0","1","1","1","1","1","1","0","1","0","1","1","0","0","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","0"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","0","1","1","1","1"],["1","1","0","1","1","0","1","1","1","1","1","1","0","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","0","1","1","1","0","1","0","1","0","0"],["0","1","1","0","1","1","1","1","1","1","1","0","0","1","1","1","1","1","0","0","1","0","1","1","1","1","1","0","1","1","1","0","1","1","0","1","1","1","0","1"]]
        
        print("Expected: ??, Actual: \(MaximalRectangle1().maximalRectangle(matrix8))")
    }
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        var known = Set<Rectangle>()
        var new = Set<Rectangle>()
        
        for r in matrix.indices {
            for c in matrix[r].indices {
                if matrix[r][c] == "1" {
                    let rect = Rectangle(rc0: RowCol(row: r, col: c),
                                         rc1: RowCol(row: r, col: c))
                    known.insert(rect)
                    new.insert(rect)
                }
            }
        }
        
        guard !new.isEmpty else { return 0 }
        
        var max = 1
        
        while !new.isEmpty {
            var new2 = Set<Rectangle>()
            for rect in new {
                expansions(rect, matrix, &known, &new2, &max)
            }
            new = new2
        }
        
        return max
    }
    
    func expansions(_ r: Rectangle, _ matrix: [[Character]], _ known: inout Set<Rectangle>, _ new: inout Set<Rectangle>, _ maxSize: inout Int)  {
        
        // up
        if r.rc0.row-1 >= 0 {
            let nr = Rectangle(rc0: RowCol(row: r.rc0.row-1, col: r.rc0.col), rc1: r.rc1)
            if !known.contains(nr), !new.contains(nr), (nr.rc0.col ... nr.rc1.col).allSatisfy({ matrix[nr.rc0.row][$0] == "1" }) {
                new.insert(nr)
                maxSize = max(maxSize, nr.size)
            }
            known.insert(nr)
        }
        
        // down
        if r.rc1.row+1 < matrix.count {
            let nr = Rectangle(rc0: r.rc0, rc1: RowCol(row: r.rc1.row+1, col: r.rc0.col))
            if !known.contains(nr), !new.contains(nr), (nr.rc0.col ... nr.rc1.col).allSatisfy({ matrix[nr.rc1.row][$0] == "1" }) {
                new.insert(nr)
                maxSize = max(maxSize, nr.size)
            }
            known.insert(nr)
        }
        
        // left
        if r.rc0.col-1 >= 0 {
            let nr = Rectangle(rc0: RowCol(row: r.rc0.row, col: r.rc0.col-1), rc1: r.rc1)
            if !known.contains(nr), !new.contains(nr), (nr.rc0.row ... nr.rc1.row).allSatisfy({ matrix[$0][nr.rc0.col] == "1" }) {
                new.insert(nr)
                maxSize = max(maxSize, nr.size)
            }
            known.insert(nr)
        }
        
        // right
        if r.rc1.col+1 < matrix[0].count {
            let nr = Rectangle(rc0: r.rc0, rc1: RowCol(row: r.rc1.row, col: r.rc1.col+1))
            if !known.contains(nr), !new.contains(nr), (nr.rc0.row ... nr.rc1.row).allSatisfy({ matrix[$0][nr.rc1.col] == "1" }) {
                new.insert(nr)
                maxSize = max(maxSize, nr.size)
            }
            known.insert(nr)
        }
    }
    
    struct RowCol : Hashable {
        let row: Int
        let col: Int
    }
    
    struct Rectangle : Hashable {
        let rc0: RowCol
        let rc1: RowCol
        
        var size: Int {
            return (rc1.row - rc0.row + 1) * (rc1.col - rc0.col + 1)
        }
    }
}
