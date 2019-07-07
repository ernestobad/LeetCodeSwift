//
//  Sqrtx.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/6/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class Sqrtx {
    static func run() {
        print("Expected: 0, Actual: \(Sqrtx().mySqrt(0))")
        print("Expected: 1, Actual: \(Sqrtx().mySqrt(1))")
        print("Expected: 2, Actual: \(Sqrtx().mySqrt(4))")
        print("Expected: 2, Actual: \(Sqrtx().mySqrt(8))")
        print("Expected: 3, Actual: \(Sqrtx().mySqrt(9))")
        print("Expected: 4, Actual: \(Sqrtx().mySqrt(16))")
        print("Expected: 5, Actual: \(Sqrtx().mySqrt(25))")
        print("Expected: 6, Actual: \(Sqrtx().mySqrt(36))")
        print("Expected: 6, Actual: \(Sqrtx().mySqrt(48))")
        print("Expected: 7, Actual: \(Sqrtx().mySqrt(49))")
        print("Expected: 7, Actual: \(Sqrtx().mySqrt(63))")
        print("Expected: 8, Actual: \(Sqrtx().mySqrt(64))")
        print("Expected: 8, Actual: \(Sqrtx().mySqrt(65))")
        print("Expected: 8, Actual: \(Sqrtx().mySqrt(80))")
        print("Expected: 9, Actual: \(Sqrtx().mySqrt(81))")
    }
    
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        else if x == 1 { return 1 }
        else { return binarySearch(0, x/2 + 1, x) { $0 < ($1 * $1) } - 1 }
    }
    
    public func binarySearch(_ low: Int, _ high: Int, _ target: Int, _ isLessOrEqual: ((Int, Int) -> Bool)) -> Int {
        var lowIndex = low
        var highIndex = high
        while lowIndex != highIndex {
            let midIndex = lowIndex + (highIndex-lowIndex)/2
            if isLessOrEqual(target, midIndex) {
                highIndex = midIndex
            } else {
                lowIndex = midIndex+1
            }
        }
        return lowIndex
    }
}
