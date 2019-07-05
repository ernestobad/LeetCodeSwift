//
//  TheSkylineProblem.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/4/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

// original solution
class TheSkylineProblem1 {
    
    static func run() {
        print("Expected: [ [2 10], [3 15], [7 12], [12 0], [15 10], [20 8], [24, 0] ], " +
            "Actual: \(TheSkylineProblem1().getSkyline([ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]))")
    }
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        
        var points = [ (x: Int, idx: Int, isPush: Bool) ]()
        
        for (idx, b) in buildings.enumerated() {
            points.append((b[0], idx, true))
            points.append((b[1], idx, false))
        }
        
        points.sort { $0.x < $1.x }
        
        var orderedStack = [(idx: Int, height: Int)]()
        var res = [[Int]]()
        var lastHeight = 0
        
        var i = 0
        while i < points.count {
            let x = points[i].x
            while i < points.count, points[i].x == x {
                
                let idx = points[i].idx
                let height = buildings[idx][2]
                let isPush = points[i].isPush
                
                if isPush {
                    orderedInsert(&orderedStack, (idx, height), { $0.height <= $1.height })
                } else {
                    orderedStack.removeAll(where: { $0.idx == idx })
                }
                
                i += 1
            }
            
            let currHeight = orderedStack.last?.height ?? 0
            if currHeight != lastHeight {
                res.append([x, currHeight])
                lastHeight = currHeight
            }
        }
        
        return res
    }
    
    public func orderedInsert<E>(_ arr: inout [E], _ value: E, _ isLessOrEqual: ((E, E) -> Bool)) {
        let idx = binarySearch(arr, value, isLessOrEqual)
        arr.insert(value, at: idx)
    }
    
    public func binarySearch<E>(_ arr: [E], _ targetValue: E, _ isLessOrEqual: ((E, E) -> Bool)) -> Array<E>.Index {
        var lowIndex = arr.startIndex
        var highIndex = arr.endIndex
        while lowIndex != highIndex {
            let midIndex = arr.index(lowIndex, offsetBy: arr.distance(from: lowIndex, to: highIndex)/2)
            if isLessOrEqual(targetValue, arr[midIndex]) {
                highIndex = midIndex
            } else {
                lowIndex = arr.index(after: midIndex)
            }
        }
        return lowIndex
    }
}
