//
//  SubarraySumEqualsKSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/24/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class SubarraySumEqualsKSolution {
    static func run() {
        print("expected: 2, actual: \(SubarraySumEqualsKSolution().subarraySum([1,1,1], 2))")
    }
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var dict = [Int:Int]()
        var sum = 0
        for n in nums {
            sum += n
            dict[sum] = (dict[sum] ?? 0) + 1
        }
        
        var count = 0
        sum = 0
        for n in nums {
            count += dict[k + sum] ?? 0
            sum += n
            dict[sum] = (dict[sum] ?? 0) - 1
        }
        
        return count
    }
}
