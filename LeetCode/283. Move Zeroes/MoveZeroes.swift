//
//  MoveZeroes.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/2/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MoveZeroes {
    static func run() {
        var nums = [0,1,0,3,12]
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [1, 3, 12, 0, 0], Actual: \(nums)")
        nums = [0,1]
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [1, 0], Actual: \(nums)")
        nums = [0]
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [0], Actual: \(nums)")
        nums = [1]
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [1], Actual: \(nums)")
        nums = [0, 1]
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [1, 0], Actual: \(nums)")
        nums = []
        MoveZeroes().moveZeroes(&nums)
        print("Expected: [], Actual: \(nums)")
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        var zc = 0
        for i in nums.indices {
            if nums[i] == 0 {
                zc += 1
            } else if zc > 0 {
                nums[i-zc] = nums[i]
                nums[i] = 0
            }
        }
    }
}
