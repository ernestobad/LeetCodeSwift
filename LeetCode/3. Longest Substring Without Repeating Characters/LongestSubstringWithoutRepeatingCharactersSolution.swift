//
//  LongestSubstringWithoutRepeatingCharactersSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/9/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LongestSubstringWithoutRepeatingCharactersSolution {
    static func run() {
        let solution = LongestSubstringWithoutRepeatingCharactersSolution()
        print(solution.lengthOfLongestSubstring("aaaaaa"))
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLength = 0
        var charToPosMap = [Character:Int]()
        var maxOffset = -1
        var i = 0
        
        for ch in s {
            if let offset = charToPosMap[ch] {
                maxOffset = max(offset, maxOffset)
            }
            let currLength = (i - (maxOffset+1))+1
            maxLength = max(currLength, maxLength)
            charToPosMap[ch] = i
            i += 1
        }
        
        return maxLength
    }
}
