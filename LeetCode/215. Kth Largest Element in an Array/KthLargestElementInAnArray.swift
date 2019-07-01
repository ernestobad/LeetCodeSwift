//
//  KthLargestElementInAnArray.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/13/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class KthLargestElementInAnArray {
    
    static func run() {
        print("expected: 5, actual: \(KthLargestElementInAnArray().findKthLargest([3,2,1,5,6,4], 2))")
        print("expected: 4, actual: \(KthLargestElementInAnArray().findKthLargest([3,2,3,1,2,4,5,5,6], 4))")
        print("expected: 1, actual: \(KthLargestElementInAnArray().findKthLargest([1], 1))")
        print("expected: 1, actual: \(KthLargestElementInAnArray().findKthLargest([1,1,1], 1))")
        print("expected: 2, actual: \(KthLargestElementInAnArray().findKthLargest([1,2,2,3], 2))")
        print("expected: 2, actual: \(KthLargestElementInAnArray().findKthLargest([1,2,2,3], 3))")
        print("expected: 1, actual: \(KthLargestElementInAnArray().findKthLargest([1,2,2,3], 4))")
        print("expected: 2, actual: \(KthLargestElementInAnArray().findKthLargest([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 20))")
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return nums.max()! }
        guard k < nums.count else { return nums.min()! }
        
        let ax = nums.randomElement()!
        
        var lowSet = [Int]()
        var midSet = [Int]()
        var highSet = [Int]()
        
        for num in nums {
            if num == ax { midSet.append(num) }
            else if num < ax { lowSet.append(num) }
            else { highSet.append(num) }
        }
        
        let idx = nums.count - k
        if lowSet.count + midSet.count <= idx {
            return findKthLargest(highSet, k)
        } else if lowSet.count <= idx {
            return midSet.first!
        } else {
            return findKthLargest(lowSet, k - (midSet.count + highSet.count))
        }
    }
}
