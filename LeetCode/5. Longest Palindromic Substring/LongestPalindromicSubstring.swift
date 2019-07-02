//
//  LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/1/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LongestPalindromicSubstring {
    
    static func run() {
        let lps = LongestPalindromicSubstring()
        print("Expected: bab, Actual: \(lps.longestPalindrome("babad"))")
    }
    
    func longestPalindrome(_ s: String) -> String {
        
        var longestPalindrome = String.SubSequence("")
        
        for i in s.indices {
            if let palindrome = self.longestPalindrome(s, i, i), palindrome.count > longestPalindrome.count {
                longestPalindrome = palindrome
            }
            if let palindrome = self.longestPalindrome(s, i, s.index(after: i)), palindrome.count > longestPalindrome.count {
                longestPalindrome = palindrome
            }
        }
        
        return String(longestPalindrome)
    }
    
    func longestPalindrome(_ s: String, _ iStart: String.Index, _ jStart: String.Index) -> String.SubSequence? {
        var i = iStart
        var j = jStart
        var startIdx: String.Index?
        var endIdx: String.Index?
        while j != s.endIndex {
            guard s[i] == s[j] else { break }
            startIdx = i
            endIdx = j
            j = s.index(after: j)
            guard i != s.startIndex else { break }
            i = s.index(before: i)
        }
        if let startIdx = startIdx, let endIdx = endIdx {
            return s[startIdx...endIdx]
        } else {
            return nil
        }
    }
}
