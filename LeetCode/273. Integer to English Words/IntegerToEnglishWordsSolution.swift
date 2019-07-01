//
//  IntegerToEnglishWordsSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/2/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class IntegerToEnglishWordsSolution {
    static func run() {
        let s = IntegerToEnglishWordsSolution()
        print("Expected: One, actual: \(s.numberToWords(1))")
        print("Expected: Ten, actual: \(s.numberToWords(10))")
        print("Expected: Eleven, actual: \(s.numberToWords(11))")
        print("Expected: Twenty, actual: \(s.numberToWords(20))")
        print("Expected: Thirty One, actual: \(s.numberToWords(31))")
        print("Expected: Ninenty Nine, actual: \(s.numberToWords(99))")
        print("Expected: One Hundred, actual: \(s.numberToWords(100))")
        print("Expected: One Hundred Twenty Three, actual: \(s.numberToWords(123))")
        print("Expected: Twelve Thousand Three Hundred Forty Five, actual: \(s.numberToWords(12345))")
        print("Expected: One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven, actual: \(s.numberToWords(1234567))")
        print("Expected: One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One, actual: \(s.numberToWords(1234567891))")
    }
    
    func numberToWords(_ num: Int) -> String {
        if (num == 0) {
            return "Zero"
        } else {
            return bToW(num / 1000000000, num % 1000000000)
        }
    }
    
    func uToW(_ i1 : Int) -> String {
        switch i1 {
        case 0: return ""
        case 1: return "One"
        case 2: return "Two"
        case 3: return "Three"
        case 4: return "Four"
        case 5: return "Five"
        case 6: return "Six"
        case 7: return "Seven"
        case 8: return "Eight"
        case 9: return "Nine"
        default: preconditionFailure()
        }
    }
    
    func dToW(_ i1 : Int, _ r1: Int) -> String {
        let space = r1 > 0 ? " " : ""
        switch i1 {
        case 0: return "\(uToW(r1))"
        case 1:
            switch r1 {
            case 0: return "Ten"
            case 1: return "Eleven"
            case 2: return "Twelve"
            case 3: return "Thirteen"
            case 4: return "Fourteen"
            case 5: return "Fifteen"
            case 6: return "Sixteen"
            case 7: return "Seventeen"
            case 8: return "Eighteen"
            case 9: return "Nineteen"
            default: return "-"
            }
        case 2: return "Twenty\(space)\(uToW(r1))"
        case 3: return "Thirty\(space)\(uToW(r1))"
        case 4: return "Forty\(space)\(uToW(r1))"
        case 5: return "Fifty\(space)\(uToW(r1))"
        case 6: return "Sixty\(space)\(uToW(r1))"
        case 7: return "Seventy\(space)\(uToW(r1))"
        case 8: return "Eighty\(space)\(uToW(r1))"
        case 9: return "Ninety\(space)\(uToW(r1))"
        default: preconditionFailure()
        }
    }
    
    func hToW(_ i1 : Int, _ r2: Int) -> String {
        let space = r2 > 0 ? " " : ""
        if i1 > 0 {
            return "\(uToW(i1)) Hundred\(space)\(dToW(r2 / 10, r2 % 10))"
        } else {
            return dToW(r2 / 10, r2 % 10)
        }
    }
    
    func tToW(_ i3 : Int, _ r3: Int) -> String {
        let space = r3 > 0 ? " " : ""
        if i3 > 0 {
            return "\(hToW(i3 / 100, i3 % 100)) Thousand\(space)\(hToW(r3 / 100, r3 % 100))"
        } else {
            return hToW(r3 / 100, r3 % 100)
        }
    }
    
    func mToW(_ i4 : Int, _ r6: Int) -> String {
        let space = r6 > 0 ? " " : ""
        if i4 > 0 {
            return "\(tToW(i4 / 1000, i4 % 1000)) Million\(space)\(tToW(r6 / 1000, r6 % 1000))"
        } else {
            return tToW(r6 / 1000, r6 % 1000)
        }
    }
    
    func bToW(_ i1: Int, _ r7: Int) -> String {
        let space = r7 > 0 ? " " : ""
        if i1 > 0 {
            return "\(uToW(i1)) Billion\(space)\(mToW(r7 / 1000000, r7 % 1000000))"
        } else {
            return mToW(r7 / 1000000, r7 % 1000000)
        }
    }
}
