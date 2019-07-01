//
//  3SumSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/1/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ThreeSumSolution {
    static func run() {
        let nums = [-1,0,1,2,-1,-4]
        print("expected: [[-1,-1,2],[-1,0,1]], actual: \(ThreeSumSolution().threeSum(nums))")
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var map = [Int: Int]()
        for (i, n) in sortedNums.enumerated() {
            if n < 0 { continue }
            map[n] = i
        }
        var res = [[Int]]()
        var lastN = 0
        var lastM = 0
        main: for (i, n) in sortedNums.enumerated() {
            guard i+1 < sortedNums.count else { break }
            if i > 0, lastN == n { continue }
            lastN = n
            for j in i+1..<sortedNums.count {
                let m = sortedNums[j]
                if j > i+1, lastM == m { continue }
                lastM = m
                if n+m > 0 { continue main }
                let l = (n+m) * -1
                if let idx = map[l], idx > i, idx > j {
                    res.append([n, m, l])
                }
            }
        }
        return res
    }
}
