//
//  RomanToInteger.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/18/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class RomanToInteger {
    static func run() {
        print("Expected: 3, Actual: \(RomanToInteger().romanToInt("III"))")
        print("Expected: 4, Actual: \(RomanToInteger().romanToInt("IV"))")
        print("Expected: 9, Actual: \(RomanToInteger().romanToInt("IX"))")
        print("Expected: 58, Actual: \(RomanToInteger().romanToInt("LVIII"))")
        print("Expected: 1994, Actual: \(RomanToInteger().romanToInt("MCMXCIV"))")
    }
    
    static let map : [Character:Int] = [ "I": 1,
                                         "V": 5,
                                         "X": 10,
                                         "L": 50,
                                         "C": 100,
                                         "D": 500,
                                         "M": 1000 ]
    
    static let smap : [Character: [Character: Int]] = [ "I": [ "V": 4, "X": 9 ],
                                                        "X": [ "L": 40, "C": 90 ],
                                                        "C": [ "D": 400, "M": 900 ] ]
    
    func romanToInt(_ s: String) -> Int {
        
        var result = 0
        var skip = false
        
        for idx in s.indices {
            if skip {
                skip = false
                continue
            }
            let nextIdx = s.index(after: idx)
            let ch = s[idx]
            if nextIdx != s.endIndex, let m = type(of: self).smap[ch], let val = m[s[nextIdx]] {
                skip = true
                result += val
            } else if let val = type(of: self).map[ch] {
                result += val
            }
        }
        
        return result
    }
}
