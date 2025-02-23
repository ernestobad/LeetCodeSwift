//
//  MaximalRectangle3.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/24/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MaximalRectangle3 {
    
    static func run() {
        
        let matrix0: [[Character]] = [
            ["1","1","1","1","1"],
            ["1","1","1","1","1"],
            ["1","1","1","1","1"],
            ["1","1","1","1","0"]
        ]
        
        print("Expected: 16, Actual: \(MaximalRectangle3().maximalRectangle(matrix0))")
        
        let matrix1: [[Character]] = [
            ["1","0","1","0","0"],
            ["1","0","1","1","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
        ]
        
        print("Expected: 6, Actual: \(MaximalRectangle3().maximalRectangle(matrix1))")
        
        let matrix2: [[Character]] = [
            ["1","0","1","0","0"],
            ["1","0","0","0","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
        ]
        
        print("Expected: 5, Actual: \(MaximalRectangle3().maximalRectangle(matrix2))")
        
        let matrix3: [[Character]] = [
            ["1","1"],
            ["1","0"],
        ]
        
        print("Expected: 2, Actual: \(MaximalRectangle3().maximalRectangle(matrix3))")
        
        let matrix4: [[Character]] = [
            ["1","1"],
            ["1","1"],
        ]
        
        print("Expected: 4, Actual: \(MaximalRectangle3().maximalRectangle(matrix4))")
        
        let matrix5: [[Character]] = [
            ["1","0"],
            ["0","0"],
        ]
        
        print("Expected: 1, Actual: \(MaximalRectangle3().maximalRectangle(matrix5))")
        
        let matrix6: [[Character]] = [
            ["1","0"],
            ["1","0"],
        ]
        
        print("Expected: 2, Actual: \(MaximalRectangle3().maximalRectangle(matrix6))")
        
        let matrix7: [[Character]] = [
            ["1","1","1","1","1","1","1","1"],
            ["1","1","1","1","1","1","1","0"],
            ["1","1","1","1","1","1","1","0"],
            ["1","1","1","1","1","0","0","0"],
            ["0","1","1","1","1","0","0","0"]]
        
        print("Expected: 21, Actual: \(MaximalRectangle3().maximalRectangle(matrix7))")
        
        let matrix8: [[Character]] = [["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","0","0","1","1","1","1","1","1","1","1","0","0","1","1","1","0","1","1","1","1","1","1","1","1"],["1","1","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","0","1","0","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","0","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","0","1","1","0","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","0","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","0","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","1","1","0","1","1","1","1"],["0","1","1","0","1","1","0","1","0","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","0","1"],["0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","0","0","1","1","0","0","1","1","0","1","1","0","1","0","1","0","1"],["1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","1","0","1","0","1","1","0","1","0","1","1"],["1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1","1"],["1","1","1","0","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","0","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","0","1","0","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","1","1","1","1","1","0","0","1","1","1","1","1"],["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1"],["1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","1","0","0","1","0","1","1","1","1","1","0","1","1","1","1","1","1"],["1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1","0","1","1","0","1","1"],["1","1","0","0","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","0","1","1","1","0","0","1","1","1","1","1","1","1","1"],["1","1","1","0","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","0","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1"],["1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","0","1","1","1","1","1","1","1","1","1","0","1","1","1","0","1"],["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","0","1","1","1","0","1","1","0","1","1"],["1","1","1","1","0","1","1","0","1","1","1","1","1","1","0","1","1","0","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","0","0","0","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","0","1","0","1","0","1","1","0","1","1","1","1","1","1","1","1"],["1","0","1","1","0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1"],["1","0","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1"],["0","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1","0","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","1","0","1","1","1","1","0","1","1","1","1","1","1","0","1","0","1","1","0","0","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","1","1","1","0"],["1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0","0","1","1","1","1"],["1","1","0","1","1","0","1","1","1","1","1","1","0","1","0","1","1","1","1","1","0","1","1","1","1","1","1","1","1","0","0","1","1","1","0","1","0","1","0","0"],["0","1","1","0","1","1","1","1","1","1","1","0","0","1","1","1","1","1","0","0","1","0","1","1","1","1","1","0","1","1","1","0","1","1","0","1","1","1","0","1"]]
        
        print("Expected: ??, Actual: \(MaximalRectangle3().maximalRectangle(matrix8))")
    }
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        var cmatrix: [[EntryInfo?]] = matrix.map({ $0.map({ $0 == "1" ? EntryInfo(leftCount: 0, rightCount: 0, height: 0) : nil }) })
        
        var maxSize = 0
        
        for r in cmatrix.indices {
            
            var leftCount = 0
            for c in cmatrix[r].indices {
                
                guard var curr = cmatrix[r][c] else {
                    leftCount = 0
                    continue
                }
                
                if let above = (r > 0 ? cmatrix[r-1][c] : nil) {
                    curr.height = above.height + 1
                    curr.leftCount = min(above.leftCount, leftCount)
                } else {
                    curr.height = 1
                    curr.leftCount = leftCount
                }
                
                cmatrix[r][c] = curr
                
                leftCount += 1
            }
            
            var rightCount = 0
            for c in cmatrix[r].indices.reversed() {
                
                guard var curr = cmatrix[r][c] else {
                    rightCount = 0
                    continue
                }
                
                if let above = (r > 0 ? cmatrix[r-1][c] : nil) {
                    curr.rightCount = min(above.rightCount, rightCount)
                } else {
                    curr.rightCount = rightCount
                }
                
                cmatrix[r][c] = curr
                
                let size = curr.height * (curr.leftCount + 1 + curr.rightCount)
                maxSize = max(maxSize, size)
                
                rightCount += 1
            }
        }
        
        return maxSize
    }
    
    struct EntryInfo {
        var leftCount: Int
        var rightCount: Int
        var height: Int
    }
}
