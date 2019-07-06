//
//  MissingNumber.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/5/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MissingNumber {
    
    static func run() {
        print("Expected: 1, Actual: \(MissingNumber().missingNumber([0]))")
        print("Expected: 0, Actual: \(MissingNumber().missingNumber([1]))")
        print("Expected: 1, Actual: \(MissingNumber().missingNumber([0,2]))")
        print("Expected: 2, Actual: \(MissingNumber().missingNumber([3,0,1]))")
        print("Expected: 3, Actual: \(MissingNumber().missingNumber([0,1,2]))")
        print("Expected: 8, Actual: \(MissingNumber().missingNumber([9,6,4,2,3,5,7,0,1]))")
    }
    
    func missingNumber(_ nums: [Int]) -> Int {
        
        var sum = 0
        var maxn = 0
        for n in nums {
            sum += n
            maxn = max(maxn, n)
        }
        
        let target = (maxn * (maxn + 1)) / 2
        
        if sum == target, nums.count == maxn+1 {
            return maxn+1
        }
        
        return target - sum
    }
}
