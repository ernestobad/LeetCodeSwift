//
//  PalindromicSubstrings.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/6/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class PalindromicSubstrings {
    static func run() {
        print("Expected: 1, Actual: \(PalindromicSubstrings().countSubstrings("a"))")
        print("Expected: 2, Actual: \(PalindromicSubstrings().countSubstrings("ab"))")
        print("Expected: 4, Actual: \(PalindromicSubstrings().countSubstrings("aba"))")
        print("Expected: 3, Actual: \(PalindromicSubstrings().countSubstrings("abc"))")
        print("Expected: 6, Actual: \(PalindromicSubstrings().countSubstrings("aaa"))")
        print("Expected: 7, Actual: \(PalindromicSubstrings().countSubstrings("axvxa"))")
    }
    
    func countSubstrings(_ s: String) -> Int {
        
        var count = 0
        
        for idx in s.indices {
            count += countPalindromes(s, c1: idx, c2: idx)
            let nextIdx = s.index(after: idx)
            if nextIdx != s.endIndex {
                count += countPalindromes(s, c1: idx, c2: nextIdx)
            }
        }
        
        return count
    }
    
    func countPalindromes(_ s: String, c1: String.Index, c2: String.Index) -> Int {
        var count = 0
        var curr1 = c1
        var curr2 = c2
        repeat {
            
            let ch1 = s[curr1]
            let ch2 = s[curr2]
            
            if ch1 == ch2 { count += 1 }
            else { break }
            
            if curr1 == s.startIndex { break }
            curr1 = s.index(before: curr1)
            curr2 = s.index(after: curr2)
            if curr2 == s.endIndex { break }
            
        } while true
        
        return count
    }
}
