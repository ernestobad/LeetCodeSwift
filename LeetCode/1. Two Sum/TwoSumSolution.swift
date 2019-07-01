//
//  TwoSumSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/1/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class TwoSumSolution {
    static func run() {
    
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for (i, n) in nums.enumerated() {
            let m = target - n
            if let j = map[m] {
                return [j, i]
            }
            map[n] = i
        }
        return [Int]()
    }
}
