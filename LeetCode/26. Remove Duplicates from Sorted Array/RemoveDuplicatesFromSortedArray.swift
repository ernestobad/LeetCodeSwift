//
//  RemoveDuplicatesFromSortedArray.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/7/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedArray {
    static func run() {
        
        var nums1 = [0,0,1,1,1,2,2,3,3,4]
        let r1 = RemoveDuplicatesFromSortedArray().removeDuplicates(&nums1)
        print("Expected: 5 - [0, 1, 2, 3, 4, 2, 2, 3, 3, 4], Actual: \(r1) - \(nums1)")
        
        var nums2 = [0,0,1,1,1,2,2,3,3,4,4]
        let r2 = RemoveDuplicatesFromSortedArray().removeDuplicates(&nums2)
        print("Expected: 5 - [0, 1, 2, 3, 4, 2, 2, 3, 3, 4, 4], Actual: \(r2) - \(nums2)")
        
        var nums3 = [0, 0, 0]
        let r3 = RemoveDuplicatesFromSortedArray().removeDuplicates(&nums3)
        print("Expected: 1 - [0, 0, 0], Actual: \(r3) - \(nums3)")
        
        var nums4 = [4, 5 ,6]
        let r4 = RemoveDuplicatesFromSortedArray().removeDuplicates(&nums4)
        print("Expected: 3 - [4, 5, 6], Actual: \(r4) - \(nums4)")
        
        var nums5 = [4]
        let r5 = RemoveDuplicatesFromSortedArray().removeDuplicates(&nums5)
        print("Expected: 1 - [4], Actual: \(r5) - \(nums5)")
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var repeatedCount = 0
        var currNum: Int? = nil
        for idx in 0..<nums.count {
            let n = nums[idx]
            if currNum == n {
                repeatedCount += 1
            } else {
                currNum = n
                if repeatedCount > 0 {
                    nums[idx - repeatedCount] = n
                }
            }
        }
        return nums.count - repeatedCount
    }
}
