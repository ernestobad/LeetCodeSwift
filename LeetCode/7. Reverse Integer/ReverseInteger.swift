//
//  ReverseInteger.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/8/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ReverseInteger {
    static func run() {
        print("Expected: 1, Actual: \(ReverseInteger().reverse(1))")
        print("Expected: -1, Actual: \(ReverseInteger().reverse(-1))")
        print("Expected: 0, Actual: \(ReverseInteger().reverse(0))")
        print("Expected: 1, Actual: \(ReverseInteger().reverse(10))")
        print("Expected: -1, Actual: \(ReverseInteger().reverse(-10))")
        print("Expected: 321, Actual: \(ReverseInteger().reverse(123))")
        print("Expected: -321, Actual: \(ReverseInteger().reverse(-123))")
        print("Expected: 21, Actual: \(ReverseInteger().reverse(120))")
        print("Expected: 21, Actual: \(ReverseInteger().reverse(120))")
    }
    
    func reverse(_ x: Int) -> Int {
        
        guard x != 0 else { return 0 }
        
        let sign : Int64 = x < 0 ? -1 : 1
        let digitCount = Int(floor(log10(Double(abs(x)))))+1
        var res : Int64 = 0
        for i in 0..<digitCount {
            let d = digit(at: i, x)
            let p = (pow(Double(10), Double((digitCount-1) - i)))
            res += Int64(d) * Int64(p)
        }
        
        res = res * sign
        
        guard res >= Int32.min, res <= Int32.max else {
            return 0
        }
        
        return Int(res)
    }
    
    func digit(at pos: Int, _ x: Int) -> Int {
        return (Int(abs(x)) % Int(pow(Double(10), Double(pos+1)))) / Int(pow(Double(10), Double(pos)))
    }
}
