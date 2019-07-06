//
//  CountAndSay.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/5/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class CountAndSay {
    static func run() {
        print("Expected: 1, Actual: \(CountAndSay().countAndSay(1))")
        print("Expected: 11, Actual: \(CountAndSay().countAndSay(2))")
        print("Expected: 21, Actual: \(CountAndSay().countAndSay(3))")
        print("Expected: 1211, Actual: \(CountAndSay().countAndSay(4))")
        print("Expected: 111221, Actual: \(CountAndSay().countAndSay(5))")
        print("Expected: 312211, Actual: \(CountAndSay().countAndSay(6))")
    }
    
    func countAndSay(_ n: Int) -> String {
        var str = "1"
        
        guard n > 1 else { return str }
        
        for _ in 2...n {
            str = self.next(str)
        }
        return str
    }
    
    func next(_ str: String) -> String {
        
        var result = ""
        
        var curr: Character? = nil
        var currCount = 0
        
        for idx in str.indices {
            let ch = str[idx]
            
            if ch == curr {
                currCount += 1
            } else if let c = curr {
                result.append("\(currCount)\(c)")
                curr = ch
                currCount = 1
            } else {
                curr = ch
                currCount = 1
            }
        }
        
        if let c = curr {
            result.append("\(currCount)\(c)")
        }
        
        return result
    }
}
