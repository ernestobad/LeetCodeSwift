//
//  MergeIntervalsSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/11/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MergeIntervalsSolution {
    
    static func run() {
        // [[1,3],[2,6],[8,10],[15,18]] -> [[1,6],[8,10],[15,18]]
        print("expected: [[1,6],[8,10],[15,18]] actual: " +
        MergeIntervalsSolution().merge([Interval(1,3), Interval(2, 6), Interval(8, 10), Interval(15, 18)]).description)
        
        // [[1,4],[4,5]] -> [[1,5]]
        print("expected: [[1,5]] actual: " +
            MergeIntervalsSolution().merge([Interval(1,4), Interval(4, 5)]).description)
        
        // [[1,4],[1,4]] -> [[1,4]]
        print("expected: [[1,4]] actual: " +
            MergeIntervalsSolution().merge([Interval(1,4), Interval(1, 4)]).description)
        
        // [[1,4]] -> [[1,4]]
        print("expected: [[1,4]] actual: " +
            MergeIntervalsSolution().merge([Interval(1,4)]).description)
        
        // [[1,4],[2,3]] -> [[1,4]]
        print("expected: [[1,4]] actual: " +
            MergeIntervalsSolution().merge([Interval(1,4), Interval(2,3)]).description)
        
        // [[2,3],[4,5],[6,7],[8,9],[1,10]] -> [[1,10]]
        print("expected: [[1,10]] actual: " +
            MergeIntervalsSolution().merge([Interval(2,3), Interval(4,5), Interval(6,7), Interval(8,9), Interval(1,10)]).description)
    }
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        var newIntervals = [Interval]()
        
        for curr in  intervals.sorted(by: { $0.start <= $1.start }) {
            if let prev = newIntervals.last {
                if let merged = merge(prev, curr) {
                    newIntervals.removeLast()
                    newIntervals.append(merged)
                } else {
                    newIntervals.append(curr)
                }
            } else {
                newIntervals.append(curr)
            }
        }
        
        return newIntervals
    }
    
    func merge(_ interval1: Interval, _ interval2: Interval) -> Interval? {
        let a = interval1.start <= interval2.start ? interval1 : interval2
        let b = interval1.start <= interval2.start ? interval2 : interval1
        if a.end < b.start {
            return nil
        } else {
            return Interval(a.start, max(a.end, b.end))
        }
    }
    
    class Interval {
        public var start: Int
        public var end: Int
        public init(_ start: Int, _ end: Int) {
            self.start = start
            self.end = end
        }
        var description: String {
            return "[\(start),\(end)]"
        }
    }
}

