//
//  GameOfLifeSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/23/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class GameOfLifeSolution {
    static func run() {
        var m = [[0,1,0],
                 [0,0,1],
                 [1,1,1],
                 [0,0,0]]
        
        GameOfLifeSolution().gameOfLife(&m)
        
        print(m)
    }
    
    func gameOfLife(_ board: inout [[Int]]) {
        
        let rows = board.count
        let cols = board.count > 0 ? board[0].count : 0
        
        for row in 0..<rows {
            for col in 0..<cols {
                guard getIsAlive(board, row, col) else { continue }
                let c0 = max(0, col-1)
                let c1 = min(cols-1, col+1)
                let r0 = max(0, row-1)
                let r1 = min(rows-1, row+1)
                for c in c0...c1 {
                    for r in r0...r1 {
                        guard !(c == col && r == row) else { continue }
                        inc(&board, r, c)
                    }
                }
            }
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                let isAlive = getIsAlive(board, row, col)
                let nCount = getNCount(board, row, col)
                if isAlive, nCount < 2 {
                    board[row][col] = 0
                } else if isAlive, nCount >= 2, nCount <= 3 {
                    board[row][col] = 1
                } else if isAlive, nCount > 3 {
                    board[row][col] = 0
                } else if !isAlive, nCount == 3 {
                    board[row][col] = 1
                } else {
                    board[row][col] = isAlive ? 1 : 0
                }
            }
        }
    }
    
    func inc(_ m: inout [[Int]], _ row: Int, _ col: Int) {
        let v = m[row][col]
        let rv = (v & 0xF)
        let nCount = (v & 0xF0) >> 4
        m[row][col] = ((nCount+1) << 4) | rv
    }
    
    func getIsAlive(_ m: [[Int]], _ row: Int, _ col: Int) -> Bool {
        return (m[row][col] & 0x0F) == 1
    }
    
    func getNCount(_ m: [[Int]],  _ row: Int, _ col: Int) -> Int {
        return (m[row][col] & 0xF0) >> 4
    }
}
