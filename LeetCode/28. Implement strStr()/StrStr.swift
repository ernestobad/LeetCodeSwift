//
//  StrStr.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/6/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class StrStr {
    
    static func run() {
        print("Expected: 0, Actual: \(StrStr().strStr("hello", ""))")
        print("Expected: -1, Actual: \(StrStr().strStr("", "a"))")
        print("Expected: 2, Actual: \(StrStr().strStr("hello", "ll"))")
        print("Expected: -1, Actual: \(StrStr().strStr("hello", "lll"))")
        print("Expected: 1, Actual: \(StrStr().strStr("hello", "ello"))")
        print("Expected: 0, Actual: \(StrStr().strStr("hello", "hello"))")
        print("Expected: 0, Actual: \(StrStr().strStr("hello", "he"))")
        print("Expected: 0, Actual: \(StrStr().strStr("hello", "hell"))")
        print("Expected: 0, Actual: \(StrStr().strStr("hellohello", "hell"))")
        print("Expected: 4, Actual: \(StrStr().strStr("hellohello", "oh"))")
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        guard haystack.count >= needle.count else {
            return -1
        }
        
        let lastIdx = haystack.index(haystack.endIndex, offsetBy: (needle.count * -1)+1)
        for idx in haystack.indices[haystack.startIndex..<lastIdx] {
            var needleIdx = needle.startIndex
            var haystackIdx = idx
            var match = true
            for _ in 0..<needle.count {
                if haystack[haystackIdx] != needle[needleIdx] {
                    match = false
                    break
                }
                haystackIdx = haystack.index(after: haystackIdx)
                needleIdx = needle.index(after: needleIdx)
            }
            if match {
                return idx.utf16Offset(in: haystack)
            }
        }
        return -1
    }
}
