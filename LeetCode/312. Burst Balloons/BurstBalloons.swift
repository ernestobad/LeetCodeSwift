//
//  BurstBalloons.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/9/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

// NOTE: non-original, based on https://leetcode.com/problems/burst-balloons/solution/
class BurstBalloons {
    static func run() {
        print("Expected: 167, Actual: \(BurstBalloons().maxCoins([3,1,5,8]))")
    }
    
    func maxCoins(_ nums: [Int]) -> Int {
        let nums2 = [1] + nums + [1]
        var memo = [[Int]](repeating: [Int](repeating: 0, count: nums2.count), count: nums2.count)
        return dp(nums2, 0, nums2.count-1, &memo)
    }
    
    func dp(_ nums: [Int], _ i: Int, _ j: Int, _ memo: inout [[Int]]) -> Int {
        
        if i+1 == j {
            return 0
        }
        
        if memo[i][j] > 0 {
            return memo[i][j]
        }
        
        var mx = 0
        for k in i+1..<j {
            mx = max(mx, nums[i]*nums[k]*nums[j] + dp(nums, i, k, &memo) + dp(nums, k, j, &memo))
        }
        memo[i][j] = mx
        return mx
    }
}
