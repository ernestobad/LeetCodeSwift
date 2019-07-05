//
//  TheSkylineProblem2.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/4/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

// Divide an conquer solution from https://leetcode.com/problems/the-skyline-problem/solution/
class TheSkylineProblem2 {
    
    static func run() {
        print("Expected: [ [2 10], [3 15], [7 12], [12 0], [15 10], [20 8], [24, 0] ], " +
            "Actual: \(TheSkylineProblem2().getSkyline([ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]))")
    }
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        return getSkyline(buildings, 0, buildings.count)
    }
    
    func getSkyline(_ buildings: [[Int]], _ start: Int, _ count: Int) -> [[Int]] {
        if count == 0 {
            return [[Int]]()
        } else if count == 1 {
            let b = buildings[start]
            return [[b[0], b[2]], [b[1], 0]]
        } else {
            let mid = (start + count/2) - 1
            let left = getSkyline(buildings, start, (mid+1)-start)
            let right = getSkyline(buildings, mid+1, (start+count)-(mid+1))
            return mergeSkyLines(left, right)
        }
    }
    
    func mergeSkyLines(_ left: [[Int]], _ right: [[Int]]) -> [[Int]] {
        // TODO
        return [[Int]]()
    }
}
