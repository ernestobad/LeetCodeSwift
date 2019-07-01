//
//  LargestRectangleInHistogram.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/25/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LargestRectangleInHistogram {
    static func run() {
        print("Expected: \(10), Actual: \(LargestRectangleInHistogram().largestRectangleArea([2,1,5,6,2,3]))")
        print("Expected: \(4), Actual: \(LargestRectangleInHistogram().largestRectangleArea([2,3]))")
        print("Expected: \(2), Actual: \(LargestRectangleInHistogram().largestRectangleArea([2]))")
        print("Expected: \(0), Actual: \(LargestRectangleInHistogram().largestRectangleArea([]))")
        print("Expected: \(3), Actual: \(LargestRectangleInHistogram().largestRectangleArea([2,1,2]))")
    }
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var largest: Int = 0
        var list = [Entry]()
        
        for (i, height) in heights.enumerated() {
            addEntry(Entry(offset: i, height: height), &list, &largest)
        }
        addEntry(Entry(offset: heights.count, height: 0), &list, &largest)
        
        return largest
    }
    
    func addEntry(_ entry: Entry, _ list: inout [Entry], _ largest: inout Int) {
        
        // note: list.enumerated().reversed() is O(n)
        var i = list.count-1
        while i >= 0 {
            let ex = list[i]
            
            guard ex.height > entry.height else {
                break
            }
            
            let base = ((entry.offset-1) - ex.offset)+1
            let area = base * ex.height
            largest = max(largest, area)
            list[i].height = entry.height
            
            i -= 1
        }
        
        list.append(entry)
    }
    
    struct Entry {
        let offset: Int
        var height: Int
    }
}
