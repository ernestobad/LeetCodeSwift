//
//  MultiplyStrings.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/4/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MultiplyStrings {
    
    static func run() {
        print("Expected: 305525, Actual: \(MultiplyStrings().multiply("5555", "55"))")
        print("Expected: 0, Actual: \(MultiplyStrings().multiply("0", "0"))")
        print("Expected: 305525, Actual: \(MultiplyStrings().multiply("55", "5555"))")
        print("Expected: 0, Actual: \(MultiplyStrings().multiply("0", "55"))")
        print("Expected: 1, Actual: \(MultiplyStrings().multiply("1", "1"))")
    }

    func multiply(_ num1: String, _ num2: String) -> String {
        var result = "0"
        var idx2 = num2.endIndex
        var i = 0
        while true {
            guard let digit2 = nextValue(num2, lastIdx: &idx2) else {
                break
            }
            var str = self.multiply(num1, digit2)
            
            if str != "0" {
                for _ in 0..<i {
                    str.append("0")
                }
            }
            result = self.sum(result, str)

            i += 1
        }
        
        return result
    }
    
    func multiply(_ num1: String, _ digit: Int) -> String {
        
        guard digit != 0 else {
            return "0"
        }
        
        var result = ""
        var idx1 = num1.endIndex
        var c = 0
        while true {
            guard let digit2 = nextValue(num1, lastIdx: &idx1) else {
                break
            }
            let r = (digit * digit2) + c
            let d = r % 10
            c = r/10
            let dstr = "\(d)"
            result.insert(dstr[dstr.startIndex], at: result.startIndex)
        }
        
        if (c != 0) {
            let dstr = "\(c)"
            result = dstr + result
        }
        
        return result
    }
    
    func sum(_ num1: String, _ num2: String) -> String {
        
        guard !num1.isEmpty else { return num2 }
        guard !num2.isEmpty else { return num1 }
        
        var idx1 = num1.endIndex
        var idx2 = num2.endIndex
        
        var result = ""
        var c = 0
        
        while true {
            let digitOrNil1 = nextValue(num1, lastIdx: &idx1)
            let digitOrNil2 = nextValue(num2, lastIdx: &idx2)
            
            guard digitOrNil1 != nil || digitOrNil2 != nil else {
                break
            }
            
            let r = (digitOrNil1 ?? 0) + (digitOrNil2 ?? 0) + c
            let d = r % 10
            c = r/10
            let dstr = "\(d)"
            result.insert(dstr[dstr.startIndex], at: result.startIndex)
        }
        
        if (c != 0) {
            let dstr = "\(c)"
            result.insert(dstr[dstr.startIndex], at: result.startIndex)
        }
        
        return result
    }
    
    func nextValue(_ num: String, lastIdx: inout String.Index) -> Int? {
        guard lastIdx != num.startIndex else {
            return nil
        }
        
        let idx = num.index(before: lastIdx)
        guard let digit = Int(String(num[idx])), digit >= 0, digit <= 9 else {
            return nil
        }
        
        lastIdx = idx
        return digit
    }
    
}
