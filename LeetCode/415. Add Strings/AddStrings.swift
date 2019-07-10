//
//  AddStrings.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/9/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class AddStrings {
    static func run() {
        print("Expected: 246, Actual: \(AddStrings().addStrings("123", "123"))")
        print("Expected: 1087, Actual: \(AddStrings().addStrings("88", "999"))")
        print("Expected: 124, Actual: \(AddStrings().addStrings("1", "123"))")
        print("Expected: 2, Actual: \(AddStrings().addStrings("1", "1"))")
        print("Expected: 1, Actual: \(AddStrings().addStrings("0", "1"))")
        print("Expected: 0, Actual: \(AddStrings().addStrings("0", "0"))")
        print("Expected: 10, Actual: \(AddStrings().addStrings("1", "9"))")
        print("Expected: 199999999999999998, Actual: \(AddStrings().addStrings("99999999999999999", "99999999999999999"))")
    }
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        var res = String()
        let maxLength = max(num1.count, num2.count)
        var idx1 = num1.endIndex
        var idx2 = num2.endIndex
        var rem = 0
        for _ in (0..<maxLength) {
            let d1: Int
            if idx1 == num1.startIndex {
                d1 = 0
            } else {
                idx1 = num1.index(before: idx1)
                d1 = Int(String(num1[idx1]))!
            }
            
            let d2: Int
            if idx2 == num2.startIndex {
                d2 = 0
            } else {
                idx2 = num2.index(before: idx2)
                d2 = Int(String(num2[idx2]))!
            }
            
            let sum = d1 + d2 + rem
            rem = sum >= 10 ? 1 : 0
            let newD = sum % 10
            let newDStr = "\(newD)"
            res.insert(newDStr[newDStr.startIndex], at: res.startIndex)
        }
        
        if rem > 0 {
            let newDStr = "\(rem)"
            res.insert(newDStr[newDStr.startIndex], at: res.startIndex)
        }
        
        return res
    }
}
