//
//  Subsets.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/3/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class Subsets {
    
    static func run() {
        print("Expected: [[], [1]], Actual: \(Subsets().subsets([1]))")
        print("Expected: [[], [1], [2], [1, 2]], Actual: \(Subsets().subsets([1, 2]))")
        print("Expected: [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]], Actual: \(Subsets().subsets([1, 2, 3]))")
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        for k in 0...nums.count {
            subsets(nums, 0, k, [], &res)
        }
        return res
    }
    
    func subsets(_ nums: [Int], _ offset: Int, _ k: Int, _ prefix: [Int], _ res: inout [[Int]]) {
        if k == 0 {
            res.append(prefix + [])
        } else if k == 1 {
            res.append(contentsOf: nums[offset..<nums.count].map( { (prefix + [$0]) as [Int] }))
        } else if k == nums.count - offset {
            res.append(prefix + [Int](nums[offset..<nums.count]))
        } else {
            for i in offset..<nums.count {
                let x = nums[i]
                subsets(nums, i+1, k-1, prefix + [x], &res)
            }
        }
    }
}
