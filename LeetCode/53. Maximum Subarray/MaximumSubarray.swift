//
//  MaximumSubarray.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/3/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MaximumSubarray {
    static func run() {
        print("Expected: 6, Actual: \(MaximumSubarray().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))")
        print("Expected: 4, Actual: \(MaximumSubarray().maxSubArray([-2,-1,-3,4,-2,-3]))")
        print("Expected: 0, Actual: \(MaximumSubarray().maxSubArray([-1,0]))")
        print("Expected: 3, Actual: \(MaximumSubarray().maxSubArray([1,2]))")
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var maxSubArraySum: Int? = nil
        var minSum: Int = 0
        
        for n in nums {
            sum += n
            if let m = maxSubArraySum {
                maxSubArraySum = max(m, sum - minSum)
            } else {
                maxSubArraySum = sum - minSum
            }
            
            minSum = min(minSum, sum)
        }
        
        return maxSubArraySum ?? 0
    }
}
