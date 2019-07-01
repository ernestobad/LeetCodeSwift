//
//  PowXNSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/30/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Darwin

class PowXNSolution {
    static func run() {
        
        print("expected: \(pow(2.5, -2)), actual: \(PowXNSolution().myPow(2.5, -2))")
        print("expected: \(pow(2.5, 0)), actual: \(PowXNSolution().myPow(2.5, 0))")
        print("expected: \(pow(2.5, 1)), actual: \(PowXNSolution().myPow(2.5, 1))")
        print("expected: \(pow(2.5, 2)), actual: \(PowXNSolution().myPow(2.5, 2))")
        print("expected: \(pow(2.5, 10)), actual: \(PowXNSolution().myPow(2.5, 10))")
        print("expected: \(pow(2.5, 15)), actual: \(PowXNSolution().myPow(2.5, 15))")
        print("expected: \(pow(2.5, 13)), actual: \(PowXNSolution().myPow(2.5, 13))")
        print("expected: \(pow(2.5, 16)), actual: \(PowXNSolution().myPow(2.5, 16))")
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        } else if n < 0 {
            let r = myPowPositive(x, n * -1)
            return 1 / r
        } else {
            return myPowPositive(x, n)
        }
    }
    
    func myPowPositive(_ x: Double, _ n: Int) -> Double {
        var rn = n
        var p = x
        var i = 1
        var res = Double(1)
        while rn >= 1 {
            if ((rn - i) % (i*2)) == 0 {
                rn = rn - i
                res = res * p
            }
            p = p*p
            i = i*2
        }
        return res
    }
}
