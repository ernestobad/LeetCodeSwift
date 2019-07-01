//
//  LongestConsecutiveSequence.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/31/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LongestConsecutiveSequenceSolution {
    
    static func run() {
//        let nums1 = [100, 4, 200, 1, 3, 2]
//        print("expected: 4, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums1))")
//
//        let nums2 = [3]
//        print("expected: 1, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums2))")
//
//        let nums3 = [Int]()
//        print("expected: 0, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums3))")
//
//        let nums4 = [1, 1, 1, 2, 2, 3, 100, 4, 4, 4, 5]
//        print("expected: 5, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums4))")
//
//        let nums5 = [0,3,7,2,5,8,4,6,0,1]
//        print("expected: 9, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums5))")
        
        // -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6
        //           1  1 1  2  2 2 2 2 3
        let nums6 = [-6,6,-9,-7,0,3,4,-2,2,-1,9,-9,5,-3,6,1,5,-1,-2,9,-9,-4,-6,-5,6,-1,3]
        print("expected: 14, actual: \(LongestConsecutiveSequenceSolution().longestConsecutive(nums6))")
    }
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        
        var startMap = [Int:Entry]()
        var endMap = [Int:Entry]()
        var longest = 0
        
        for n in nums {
            let currEntry = Entry(n)
            _ = currEntry.extend(startMap[n+1])
            _ = currEntry.extend(endMap[n-1])
            startMap[currEntry.start] = currEntry
            endMap[currEntry.end] = currEntry
            longest = max(longest, currEntry.count)
        }
        
        return longest
    }
    
    class Entry {
        
        private(set) var start: Int
        
        private(set) var end: Int
        
        init(_ val: Int) {
            start = val
            end = val
        }
        
        var count: Int {
            return (end - start) + 1
        }
        
        func extend(_ entry: Entry?) -> Bool {
            guard let entry = entry else {
                return false
            }
            let oldCount = self.count
            self.start = min(self.start, entry.start)
            self.end = max(self.end, entry.end)
            return self.count > oldCount
        }
    }
}
