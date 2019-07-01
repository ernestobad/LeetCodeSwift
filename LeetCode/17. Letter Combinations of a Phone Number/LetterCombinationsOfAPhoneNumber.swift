//
//  LetterCombinationsOfAPhoneNumber.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/24/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LetterCombinationsOfAPhoneNumber {
    static func run() {
        print("expected: [\"ad\", \"ae\", \"af\", \"bd\", \"be\", \"bf\", \"cd\", \"ce\", \"cf\"] actual: \(Solution().letterCombinations("23"))")
    }
    
    class Solution {
        
        func letterCombinations(_ digits: String) -> [String] {
            var result = [String]()
            var str = String()
            self.genCombinations(digits, digits.startIndex, &str, &result)
            return result
        }
        
        let dict: [Character: [Character]] =
            ["2": ["a", "b", "c"],
             "3": ["d", "e", "f"],
             "4": ["g", "h", "i"],
             "5": ["j", "k", "l"],
             "6": ["m", "n", "o"],
             "7": ["p", "q", "r", "s"],
             "8": ["t", "u", "v"],
             "9": ["w", "x", "y", "z"]]
        
        func genCombinations(_ digits: String, _ offset: String.Index, _ str: inout String, _ result: inout [String]) {
            guard digits.indices.contains(offset) else {
                if !str.isEmpty {
                    result.append(String(str))
                }
                return
            }
            
            let digit = digits[offset]
            let chars = self.dict[digit] ?? [Character]()
            for char in chars {
                str.append(char)
                self.genCombinations(digits, digits.index(after: offset), &str, &result)
                str.removeLast()
            }
        }
    }
}
