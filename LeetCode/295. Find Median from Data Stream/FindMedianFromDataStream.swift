//
//  FindMedianFromDataStream.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/8/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class FindMedianFromDataStream {
    
    static func run() {
        
    }
    
    var arr = [Int]()
    
    init() {
    }
    
    func addNum(_ num: Int) {
        orderedInsert(&arr, num) { $0 <= $1 }
    }
    
    func findMedian() -> Double {
        guard arr.count > 0 else {
            return Double(0)
        }
        let hmid = arr.count/2
        if ((arr.count % 2) == 0) {
            return (Double(arr[hmid]) + Double(arr[hmid-1]))/Double(2)
        } else {
            return Double(arr[hmid])
        }
    }
    
    public func orderedInsert<E>(_ arr: inout [E], _ value: E, _ isLessOrEqual: ((E, E) -> Bool)) {
        let idx = binarySearch(arr, value, isLessOrEqual)
        arr.insert(value, at: idx)
    }
    
    public func binarySearch<E>(_ arr: [E], _ targetValue: E, _ isLessOrEqual: ((E, E) -> Bool)) -> Array<E>.Index {
        var lowIndex = arr.startIndex
        var highIndex = arr.endIndex
        while lowIndex != highIndex {
            let midIndex = arr.index(lowIndex, offsetBy: arr.distance(from: lowIndex, to: highIndex)/2)
            if isLessOrEqual(targetValue, arr[midIndex]) {
                highIndex = midIndex
            } else {
                lowIndex = arr.index(after: midIndex)
            }
        }
        return lowIndex
    }
}
