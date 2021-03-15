//
//  Comtest1.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 11/30/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class Contest165C {
    
    // Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.
    
    static func run() {
        
    }
    
    func countSquares(_ matrix: [[Int]]) -> Int {
        
        var dict = [[Int]:Int]()
        var count = 0
        
        for r in 0..<matrix.count {
            for c in 0..<matrix[0].count {
                for size in 1...min(matrix.count, matrix[0].count) {
                    for squares in squaresContainingElement(x: c, y: r, in: matrix, size: size) {
                        let key = [squares[0], squares[1], size]
                        if dict[key] == nil {
                            dict[key] = 0
                        }
                        dict[key] = dict[key]! + 1
                        if dict[key] == size*size {
                            count += 1
                        }
                    }
                }
            }
        }
        
        return count
    }
    
    func squaresContainingElement(x: Int, y: Int, in matrix: [[Int]], size: Int) -> [[Int]] {
        let x0 = max((x - size) + 1, 0)
        let x1 = min((x + size) - 1, matrix[0].count-1) - (size-1)
        let y0 = max((y - size) + 1, 0)
        let y1 = min((y + size) - 1, matrix.count-1) - (size-1)
        var res = [[Int]]()
        for x in x0...x1 {
            for y in y0...y1 {
                res.append([x, y])
            }
        }
        return res
    }
}

class Contest165B {
    
//    Given two integers tomatoSlices and cheeseSlices. The ingredients of different burgers are as follows:
//
//    Jumbo Burger: 4 tomato slices and 1 cheese slice.
//    Small Burger: 2 Tomato slices and 1 cheese slice.
//    Return [total_jumbo, total_small] so that the number of remaining tomatoSlices equal to 0 and the number of remaining cheeseSlices equal to 0. If it is not possible to make the remaining tomatoSlices and cheeseSlices equal to 0 return [].
//
    static func run() {
        print("Expected: [1,6], Actual: \(Contest165B().numOfBurgers(16, 7))")
        print("Expected: [], Actual: \(Contest165B().numOfBurgers(17, 4))")
        print("Expected: [], Actual: \(Contest165B().numOfBurgers(4, 17))")
        print("Expected: [0,0], Actual: \(Contest165B().numOfBurgers(0, 0))")
        print("Expected: [?, ?], Actual: \(Contest165B().numOfBurgers(878512, 238197))")
        print("Expected: [776,429], Actual: \(Contest165B().numOfBurgers(3962, 1205))")
    }
    
    func numOfBurgers(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {
        
        guard tomatoSlices % 2 == 0 else {
            return []
        }
        
        guard tomatoSlices/4 <= cheeseSlices, cheeseSlices <= tomatoSlices/2 else {
            return []
        }
        
        if tomatoSlices == 0, cheeseSlices == 0 {
            return [0, 0]
        }
        
        let jumboCount = binarySearch(0, cheeseSlices) { (jumboCount: Int) -> Bool in
            let remTomatoSlices = tomatoSlices - jumboCount*4
            if remTomatoSlices/2 <= (cheeseSlices-jumboCount) {
                return true
            } else {
                return false
            }
        }
        
        guard jumboCount*4 + (cheeseSlices-jumboCount)*2 == tomatoSlices else {
            return []
        }
        
        return [jumboCount, cheeseSlices-jumboCount]
    }
    
    public func binarySearch(_ startIndex: Int, _ endIndex: Int, _ isTargetLessOrEqualThan: ((Int) -> Bool)) -> Int {
        var lowIndex = startIndex
        var highIndex = endIndex
        while lowIndex != highIndex {
            let midIndex = lowIndex + (highIndex-lowIndex)/2
            if isTargetLessOrEqualThan(midIndex) {
                highIndex = midIndex
            } else {
                lowIndex = midIndex+1
            }
        }
        return lowIndex
    }
}

class Contest165A {
    
    static func run() {
        let moves1 = [[0,0],[2,0],[1,1],[2,1],[2,2]]
        print("Expected: A, Actual: \(Contest165A().tictactoe(moves1))")

        let moves2 = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]]
        print("Expected: B, Actual: \(Contest165A().tictactoe(moves2))")

        let moves3 = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]]
        print("Expected: Draw, Actual: \(Contest165A().tictactoe(moves3))")

        let moves4 = [[0,0],[1,1]]
        print("Expected: Pending, Actual: \(Contest165A().tictactoe(moves4))")
    }
    
    // A - X
    // B - O
    func tictactoe(_ moves: [[Int]]) -> String {
        var arr = [[Int]](repeating: [-1, -1, -1], count: 3)
        
        var isATurn = true
        for move in moves {
            if isATurn {
                arr[move[0]][move[1]] = 1
            } else {
                arr[move[0]][move[1]] = 0
            }
            isATurn = !isATurn
        }
        
        // check rows:
        for i in 0..<3 {
            let val = arr[i][0]
            var all = true
            guard val != -1 else { continue }
            for j in 1..<3 {
                if arr[i][j] != val { all = false; break }
            }
            if all {
                return val == 1 ? "A" : "B"
            }
        }
        
        // check cols:
        for i in 0..<3 {
            let val = arr[0][i]
            var all = true
            guard val != -1 else { continue }
            for j in 1..<3 {
                if arr[j][i] != val { all = false; break }
            }
            if all {
                return val == 1 ? "A" : "B"
            }
        }
        
        // check diag1
        let val1 = arr[0][0]
        if val1 != -1 {
            var all = true
            for j in 1..<3 {
                if arr[j][j] != val1 { all = false; break }
            }
            if all {
                return val1 == 1 ? "A" : "B"
            }
        }
        
        // check diag1
        let val2 = arr[0][2]
        if val2 != -1 {
            var all = true
            for j in 1..<3 {
                if arr[0+j][2-j] != val2 { all = false; break }
            }
            if all {
                return val2 == 1 ? "A" : "B"
            }
        }
        
        if arr.contains(where: { $0.contains(-1) } ) {
            return "Pending"
        } else {
            return "Draw"
        }
    }
}
