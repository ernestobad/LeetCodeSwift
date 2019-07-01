//
//  MeetingRoomsIISolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/16/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MeetingRoomsIISolution {
    
//    Example 1:
//    Input: [[0, 30],[5, 10],[15, 20]]
//    Output: 2
//    Example 2:
//
//    Input: [[7,10],[2,4]]
//    Output: 1
    
    static func run() {
        let intervals1 = [Interval(0, 30), Interval(5, 10), Interval(15, 20)]
        print("expected: 2, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals1))")

        let intervals2 = [Interval(7, 10), Interval(2, 4)]
        print("expected: 1, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals2))")

        let intervals3 = [Interval(7, 10)]
        print("expected: 1, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals3))")

        let intervals4 = [Interval]()
        print("expected: 0, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals4))")
        
        // [[5,8],[6,8]]
        let intervals5 = [Interval(5, 8), Interval(6, 8)]
        print("expected: 2, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals5))")
        
        // [[13,15],[1,13]]
        let intervals6 = [Interval(13, 15), Interval(1, 13)]
        print("expected: 1, actual: \(MeetingRoomsIISolution().minMeetingRooms(intervals6))")
    }
    
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        var nSet = Set<Int>()
        var starts = [Int:Int]()
        var ends = [Int:Int]()
        var maxCount = 0
        
        for interval in intervals {
            starts[interval.start] = (starts[interval.start] ?? 0) + 1
            ends[interval.end-1] = (ends[interval.end-1] ?? 0) + 1
            nSet.insert(interval.start)
            nSet.insert(interval.end-1)
        }
        
        var openCount = 0
        for n in nSet.sorted() {
            openCount += (starts[n] ?? 0)
            maxCount = max(maxCount, openCount)
            openCount -= (ends[n] ?? 0)
        }
        
        return maxCount
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
