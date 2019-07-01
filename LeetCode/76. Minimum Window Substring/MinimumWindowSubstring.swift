//
//  MinimumWindowSubstring.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/15/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MinimumWindowSubstring {
    static func run() {
        print("Expected: BANC, Actual: \(MinimumWindowSubstring().minWindow("ADOBECODEBANC", "ABC"))")
        print("Expected: ADOBEC, Actual: \(MinimumWindowSubstring().minWindow("ADOBECODEANC", "ABC"))")
        print("Expected: COBA, Actual: \(MinimumWindowSubstring().minWindow("ADOBECOBAN", "ABC"))")
        print("Expected: ABC, Actual: \(MinimumWindowSubstring().minWindow("ABC", "ABC"))")
        print("Expected: ABC, Actual: \(MinimumWindowSubstring().minWindow("ABCD", "ABC"))")
        print("Expected: D, Actual: \(MinimumWindowSubstring().minWindow("ABCD", "D"))")
        print("Expected: AA, Actual: \(MinimumWindowSubstring().minWindow("AA", "AA"))")
        print("Expected: BECODEBA, Actual: \(MinimumWindowSubstring().minWindow("ADOBECODEBANC", "ABBC"))")
    }
    
    func minWindow(_ s: String, _ t: String) -> String {
        
        guard !s.isEmpty, !t.isEmpty else {
            return ""
        }
        
        guard s.count >= t.count else {
            return ""
        }
        
        var tdict = [Character:Int]()
        for ch in t { tdict[ch] = (tdict[ch] ?? 0) + 1 }
        
        var windowDict = [Character:Int]()
        
        // completed chars count (should be of size tdict.keys.count)
        // a char ch is completed iif windowDict[ch] == tdict[ch]
        var windowCount = 0
        
        var windowSize = 0
        
        var a = s.startIndex
        var b = s.startIndex
        
        if let targetCount = tdict[s[b]] {
            windowDict[s[b]] = 1
            if targetCount == 1 {
                windowCount = 1
            }
        }
        windowSize = 1
        
        // extends the window to the right until all chars are contained
        let extendRight = { () -> Bool in
            while windowCount < tdict.keys.count {
                b = s.index(after: b)
                if b == s.endIndex { break }
                windowSize += 1
                let ch = s[b]
                if let targetCount = tdict[ch] {
                    let newVal = (windowDict[ch] ?? 0) + 1
                    windowDict[ch] = newVal
                    if newVal == targetCount {
                        windowCount += 1
                    }
                }
            }
            return b != s.endIndex
        }
        
        // contracts the window from the left until no more chars can be removed
        let contractLeft = { () -> Bool in
            while a != s.endIndex {
                let ch = s[a]
                if let targetCount = tdict[ch] {
                    let newVal = (windowDict[ch] ?? 0) - 1
                    if newVal < targetCount {
                        break
                    } else {
                        windowDict[ch] = newVal
                    }
                }
                a = s.index(after: a)
                windowSize -= 1
            }
            return a != s.endIndex
        }
        
        // removes one tchar from the left
        let removeOneLeft = { () -> Void in
            while windowCount == tdict.keys.count {
                let ch = s[a]
                a = s.index(after: a)
                if a == s.endIndex { break }
                if let targetCount = tdict[ch] {
                    let newVal = (windowDict[ch] ?? 0) - 1
                    if newVal == targetCount-1 {
                        windowCount -= 1
                    }
                    windowDict[ch] = newVal
                }
                windowSize -= 1
            }
        }
        
        var minWindow : (String.Index, String.Index)?
        var minWindowSize = 0
        while extendRight(), contractLeft() {
            if minWindow == nil || windowSize < minWindowSize {
                minWindow = (a, b)
                minWindowSize = windowSize
            }
            removeOneLeft()
        }
        
        if let minWindow = minWindow {
            return String(s[minWindow.0...minWindow.1])
        } else {
            return ""
        }
    }
}
