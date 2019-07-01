//
//  SpiralMatrixSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/23/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class SpiralMatrixSolution {
    
    static func run() {
        let matrix1 = [[1, 2, 3],
                       [8, 9, 4],
                       [7, 6, 5]]
        print("expected: [1, 2, 3, 4, 5, 6, 7, 8, 9], actual: \(SpiralMatrixSolution().spiralOrder(matrix1))")
        
        let matrix2 = [[1, 2],
                       [4, 3]]
        print("expected: [1, 2, 3, 4], actual: \(SpiralMatrixSolution().spiralOrder(matrix2))")
        
        let matrix3 = [[1],
                       [2]]
        print("expected: [1, 2], actual: \(SpiralMatrixSolution().spiralOrder(matrix3))")

        let matrix4 = [[1, 2]]
        print("expected: [1, 2], actual: \(SpiralMatrixSolution().spiralOrder(matrix4))")

        let matrix5 = [[1]]
        print("expected: [1], actual: \(SpiralMatrixSolution().spiralOrder(matrix5))")

        let matrix6: [[Int]] = [[]]
        print("expected: [], actual: \(SpiralMatrixSolution().spiralOrder(matrix6))")
        
        let matrix7 = [[1, 2],
                       [6, 3],
                       [5, 4]]
        print("expected: [1, 2, 3, 4, 5, 6], actual: \(SpiralMatrixSolution().spiralOrder(matrix7))")
        
        let matrix8 = [[01, 02, 03, 04, 05],
                       [12, 13, 14, 15, 06],
                       [11, 10, 09, 08, 07]]
        print("expected: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], actual: \(SpiralMatrixSolution().spiralOrder(matrix8))")
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var values = [Int]()
        
        var dir = Direction.right
        var row = 0
        var col = 0
        var h = matrix.count
        var w = matrix.count > 0 ? matrix[0].count : 0
        var i = 0
        
        repeat {
            
            guard row >= 0, row < matrix.count,
                col >= 0, col < matrix[row].count else {
                return values
            }
            
            values.append(matrix[row][col])
            
            guard let nextDir = nextDirection(dir, i, w, h) else {
                return values
            }
            i = dir == nextDir ? i+1 : 1
            
            switch nextDir {
            case .up: row -= 1
            case .down: row += 1
            case .right: col += 1
            case .left: col -= 1
            }
            
            if dir != nextDir, nextDir == .right {
                w -= 2
                h -= 2
                i = 0
            }
            
            dir = nextDir
            
        } while true
        
        return values
    }
    
    func nextDirection(_ dir: Direction, _ i: Int, _ w: Int, _ h: Int) -> Direction? {
        switch dir {
        case .right:
            return i < w-1 ? .right : (h > 1 ? .down : nil)
        case .down:
            return i < h-1 ? .down : (w > 1 ? .left : nil)
        case .left:
            return i < w-1 ? .left : (h > 2 ? .up : nil)
        case .up:
            return i < h-2 ? .up : (w > 2 ? .right : nil)
        }
    }
    
    enum Direction {
        case left
        case right
        case up
        case down
    }
}
