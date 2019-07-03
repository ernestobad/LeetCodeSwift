//
//  AddBinary.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/2/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class AddBinary {
    static func run() {
        print("Expected: 100, Actual: \(AddBinary().addBinary("11", "1"))")
        print("Expected: 10101, Actual: \(AddBinary().addBinary("1010", "1011"))")
        print("Expected: 0, Actual: \(AddBinary().addBinary("0", "0"))")
        print("Expected: 1, Actual: \(AddBinary().addBinary("1", "0"))")
        print("Expected: 10, Actual: \(AddBinary().addBinary("1", "1"))")
    }
    
    func addBinary(_ a: String, _ b: String) -> String {
        var res = ""
        
        var aidx = a.endIndex
        var bidx = b.endIndex
        var c = 0
        
        while aidx != a.startIndex || bidx != b.startIndex {
            let av = (aidx != a.startIndex ? a[a.index(before: aidx)] == "1" : false) ? 1 : 0
            let bv = (bidx != b.startIndex ? b[b.index(before: bidx)] == "1" : false) ? 1 : 0
            
            switch av + bv + c {
            case 0: res.insert("0", at: res.startIndex); c = 0
            case 1: res.insert("1", at: res.startIndex); c = 0
            case 2: res.insert("0", at: res.startIndex); c = 1
            case 3: res.insert("1", at: res.startIndex); c = 1
            default: return "ERROR"
            }
            
            if aidx != a.startIndex { aidx = a.index(before: aidx) }
            if bidx != a.startIndex { bidx = b.index(before: bidx) }
        }
        
        if c == 1 { res.insert("1", at: res.startIndex); c = 0 }
        else if res.isEmpty { res.insert("0", at: res.startIndex); c = 0  }
        
        return res
    }
}
