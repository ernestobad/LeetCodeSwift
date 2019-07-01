//
//  ProductOfArrayExceptSelf.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/14/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ProductOfArrayExceptSelf {
    static func run() {
        print("Expected: [24,12,8,6], Actual: \(ProductOfArrayExceptSelf().productExceptSelf([1,2,3,4]))")
    }
    
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var acc = 1
        var result = [Int](repeating: 1, count: nums.count)
        
        for (i, num) in nums.enumerated() {
            if i > 0 {
                result[i] = acc
            }
            acc *= num
        }
        
        acc = 1
        for i in (0..<nums.count).reversed() {
            let num = nums[i]
            if i < nums.count-1 {
                result[i] = result[i]*acc
            }
            acc *= num
        }
        
        return result
    }
}
