//
//  MergeSortedArray.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/1/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MergeSortedArray {
    
    class func run() {
        var nums1 = [Int]()
        
        nums1 = [1, 2, 3, 0, 0, 0]
        MergeSortedArray().merge(&nums1, 3, [2, 5, 6], 3)
        print("Expected: [1,2,2,3,5,6], Actual: \(nums1)")

        nums1 = [1]
        MergeSortedArray().merge(&nums1, 1, [], 0)
        print("Expected: [1], Actual: \(nums1)")
        
        nums1 = [0]
        MergeSortedArray().merge(&nums1, 0, [1], 1)
        print("Expected: [1], Actual: \(nums1)")
        
        nums1 = [1,2,4,5,6,0]
        MergeSortedArray().merge(&nums1, 5, [3], 1)
        print("Expected: [1,2,3,4,5,6], Actual: \(nums1)")
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        guard n > 0 else {
            return
        }
        
        var rIdx1 = m - 1
        var rIdx2 = n - 1
        var wIdx1 = nums1.count - 1

        for _ in 0..<n+m {
            if rIdx1 >= 0, rIdx2 >= 0 {
                if nums1[rIdx1] > nums2[rIdx2] { nums1[wIdx1] = nums1[rIdx1]; rIdx1 -= 1 }
                else { nums1[wIdx1] = nums2[rIdx2]; rIdx2 -= 1 }
            } else if rIdx1 >= 0 {
                nums1[wIdx1] = nums1[rIdx1]; rIdx1 -= 1
            } else if rIdx2 >= 0 {
                nums1[wIdx1] = nums2[rIdx2]; rIdx2 -= 1
            }
            wIdx1 -= 1
        }
    }
}
