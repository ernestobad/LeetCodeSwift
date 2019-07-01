//
//  ContainsDuplicateIISolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/10/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ContainsDuplicateIISolution {
    
    static func run() {
        
        // Input: nums = [1,2,3,1], k = 3
        // Output: true
        print("expected: true, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1,2,3,1], 3).description)
        
        // Input: nums = [1,0,1,1], k = 1
        // Output: true
        print("expected: true, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1,0,1,1], 1).description)
        
        // Input: nums = [1,2,3,1,2,3], k = 2
        // Output: false
        print("expected: false, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1,2,3,1,2,3], 2).description)
        
        // Input: nums = [1], k = 0
        // Output: true
        print("expected: true, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1], 0).description)
        
        // Input: nums = [1,1], k = 1
        // Output: true
        print("expected: true, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1,1], 1).description)
        
        // Input: nums = [1,0,1], k = 1
        // Output: false
        print("expected: false, actual: " + ContainsDuplicateIISolution().containsNearbyDuplicate([1,0,1], 1).description)
    }
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        if k == 0 {
            return false // arbitrary
        }
        
        var set = Set<Int>()
        for (j, n) in nums.enumerated() {
            
            let h = j-(k+1)
            if h >= 0 {
                set.remove(nums[h])
            }
            
            if set.contains(n) {
                return true
            } else {
                set.insert(n)
            }
        }
        return false
    }
}
