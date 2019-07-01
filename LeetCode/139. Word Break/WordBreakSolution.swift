//
//  WordBreakSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/10/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class WordBreakSolution {
    
    static func run() {
        print("expected: true, actual: " + WordBreakSolution().wordBreak("leetcode", ["leet", "code"]).description)
        print("expected: true, actual: " + WordBreakSolution().wordBreak("applepenapple", ["apple", "pen"]).description)
        print("expected: false, actual: " + WordBreakSolution().wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]).description)
        
        print("expected: true, actual: " + WordBreakSolution().wordBreak("catsanddog", ["cats", "dog", "sand", "and", "cat"]).description)
        print("expected: true, actual: " + WordBreakSolution().wordBreak("bb", ["a","b","bbb","bbbb"]).description)
        
        // Note: Time limit exceeded if memoization (failedOffsets) is not used
        print("expected: false, actual: " + WordBreakSolution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]).description)
    }
    
    var failedOffsets = Set<String.Index>()
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        failedOffsets.removeAll()
        var dict = [String:Bool]()
        for word in wordDict {
            var substr = String()
            for ch in word {
                substr.append(ch)
                if let isFullWord = dict[substr], isFullWord {
                    dict[substr] = true
                } else {
                    dict[substr] = substr.count == word.count
                }
            }
        }
        return canBreakWord(s, s.startIndex, dict)
    }
    
    func canBreakWord(_ s: String, _ offset: String.Index, _ dict: [String: Bool]) -> Bool {
        
        if offset >= s.endIndex {
            return true
        } else if failedOffsets.contains(offset) {
            return false
        }
        
        var substr = String()
        for i in s.indices[offset..<s.endIndex] {
            substr.append(s[i])
            if let isFullWord = dict[substr] {
                if isFullWord, canBreakWord(s, s.index(after: i), dict) {
                    return true
                }
            } else {
                failedOffsets.insert(offset)
                return false
            }
        }
        
        failedOffsets.insert(offset)
        return false
    }
}

