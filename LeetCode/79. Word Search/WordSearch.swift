//
//  WordSearch.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/17/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class WordSearch {
    static func run() {
        let board: [[Character]] = [ ["A","B","C","E"],
                                     ["S","F","C","S"],
                                     ["A","D","E","E"] ]
        
        print("Expected: true, Actual: \(WordSearch().exist(board, "ABCCED"))")
        print("Expected: true, Actual: \(WordSearch().exist(board, "SEE"))")
        print("Expected: false, Actual: \(WordSearch().exist(board, "ABCB"))")
        print("Expected: true, Actual: \(WordSearch().exist(board, "AB"))")
        print("Expected: true, Actual: \(WordSearch().exist(board, "A"))")
        print("Expected: true, Actual: \(WordSearch().exist(board, ""))")
        print("Expected: false, Actual: \(WordSearch().exist(board, "X"))")
        print("Expected: true, Actual: \(WordSearch().exist(board, "ESE"))")
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard let ch = word.first else { return true }
        let suffix = word.suffix(word.count-1)
        var visited = Set<RowCol>()
        
        for r in 0..<board.count {
            for c in 0..<board[r].count {
                if exists(board, ch, suffix, RowCol(row: r, col: c), &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    func exists(_ board: [[Character]], _ ch: Character, _ suffix: Substring, _ rowCol: RowCol, _ visited: inout Set<RowCol>) -> Bool {
        guard ch == board[rowCol.row][rowCol.col] else { return false }
        guard !visited.contains(rowCol) else { return false }
        guard let nextCh = suffix.first else { return true }
        
        visited.insert(rowCol)
        
        let nextSuffix = suffix.suffix(suffix.count-1)
        if rowCol.row > 0, exists(board, nextCh, nextSuffix, RowCol(row: rowCol.row-1, col: rowCol.col), &visited) {
            return true
        } else if rowCol.col > 0, exists(board, nextCh, nextSuffix, RowCol(row: rowCol.row, col: rowCol.col-1), &visited) {
            return true
        } else if rowCol.row < board.count-1, exists(board, nextCh, nextSuffix, RowCol(row: rowCol.row+1, col: rowCol.col), &visited) {
            return true
        } else if rowCol.col < board[rowCol.row].count-1, exists(board, nextCh, nextSuffix, RowCol(row: rowCol.row, col: rowCol.col+1), &visited) {
            return true
        }
        
        visited.remove(rowCol)
        return false
    }
    
    struct RowCol : Hashable {
        let row: Int
        let col: Int
    }
}
