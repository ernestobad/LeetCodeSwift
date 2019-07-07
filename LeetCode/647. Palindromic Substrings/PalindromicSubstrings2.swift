//
//  PalindromicSubstrings.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/6/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class PalindromicSubstrings2 {
    static func run() {
        print("Expected: 1, Actual: \(PalindromicSubstrings2().countSubstrings("a"))")
        print("Expected: 2, Actual: \(PalindromicSubstrings2().countSubstrings("ab"))")
        print("Expected: 4, Actual: \(PalindromicSubstrings2().countSubstrings("aba"))")
        print("Expected: 3, Actual: \(PalindromicSubstrings2().countSubstrings("abc"))")
        print("Expected: 6, Actual: \(PalindromicSubstrings2().countSubstrings("aaa"))")
        print("Expected: 7, Actual: \(PalindromicSubstrings2().countSubstrings("axvxa"))")
    }
    
    func countSubstrings(_ s: String) -> Int {
        var dict = [Int:Set<Int>]()
        var count = 0
        
        for idx in s.indices {
            let ch = s[idx]
            let idxOffset = idx.utf16Offset(in: s)
            markPalindrome(idxOffset, 1, &dict)
            count += 1
            for idx2 in s.indices[s.startIndex..<idx] {
                let ch2 = s[idx2]
                let idx2Offset = idx2.utf16Offset(in: s)
                let subpalindromeLength = (idxOffset - idx2Offset)+1
                if ch == ch2, isPalindrome(idxOffset-1, subpalindromeLength-2, &dict) {
                    markPalindrome(idxOffset, subpalindromeLength, &dict)
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func markPalindrome(_ endOffset: Int, _ length: Int, _ dict: inout [Int:Set<Int>]) {
        if dict[endOffset] == nil {
            dict[endOffset] = Set<Int>()
        }
        dict[endOffset]?.insert(length)
    }
    
    func isPalindrome(_ endOffset: Int, _ length: Int, _ dict: inout [Int:Set<Int>]) -> Bool {
        guard length > 1 else { return true }
        return dict[endOffset]?.contains(length) ?? false
    }
}
