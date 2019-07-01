//
//  NextPermutationSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/19/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class NextPermutationSolution {
    static func run() {
        var nums = [1,2,3]
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [1, 3, 2] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [2, 1, 3] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [2, 3, 1] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [3, 1, 2] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [3, 2, 1] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [1, 2, 3] actual: \(nums)")
        
        nums = [1,2]
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [2, 1] actual: \(nums)")
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [1, 2] actual: \(nums)")
        
        nums = [1, 1]
        NextPermutationSolution().nextPermutation(&nums)
        print("expected: [1, 1] actual: \(nums)")
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        
        guard nums.count >= 2 else {
            return
        }
        
        let n = nums.count-1
        var k: Int = -1
        var max: Int = -1
        for i in (0..<nums.count).reversed() {
            if i == nums.count-1 {
                max = nums[i]
            } else {
                if nums[i] < max {
                    k = i
                    break
                } else {
                    max = nums[i]
                }
            }
        }
        
        guard k != -1, k+1 < nums.count else {
            nums.sort()
            return
        }
        
        var min: Int = -1
        var l: Int = -1
        for i in k+1..<nums.count {
            let diff = nums[i]-nums[k]
            if diff > 0, min == -1 || diff < min {
                min = diff
                l = i
            }
        }
        
        let t = nums[k]
        nums[k] = nums[l]
        nums[l] = t
        
        nums[k+1...n].sort()
    }
}
