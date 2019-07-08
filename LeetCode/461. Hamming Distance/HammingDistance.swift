//
//  HammingDistance.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/7/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class HammingDistance {
    static func run() {
        print("Expected: 2, Actual: \(HammingDistance().hammingDistance(1, 4))")
        print("Expected: 1, Actual: \(HammingDistance().hammingDistance(0, 8))")
        print("Expected: 0, Actual: \(HammingDistance().hammingDistance(0, 0))")
        print("Expected: 0, Actual: \(HammingDistance().hammingDistance(4, 4))")
        print("Expected: 5, Actual: \(HammingDistance().hammingDistance(25, 255))")
    }
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var r = x ^ y
        var count = 0
        while r != 0 {
            if (r & 1) != 0 {
                count += 1
            }
            r >>= 1
        }
        return count
    }
}
