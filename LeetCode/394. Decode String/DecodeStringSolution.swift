//
//  DecodeStringSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/26/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class DecodeStringSolution {
    static func run() {
        print("expected: , actual: \(DecodeStringSolution().decodeString(""))")
        print("expected: a, actual: \(DecodeStringSolution().decodeString("a"))")
        print("expected: aaabcbc, actual: \(DecodeStringSolution().decodeString("3[a]2[bc]"))")
        print("expected: accaccacc, actual: \(DecodeStringSolution().decodeString("3[a2[c]]"))")
        print("expected: abcabccdcdcdef, actual: \(DecodeStringSolution().decodeString("2[abc]3[cd]ef"))")
    }
    
    func decodeString(_ s: String) -> String {
        var idx = s.startIndex
        return parse(s, &idx)
    }
    
    func parse(_ s: String, _ idx: inout String.Index) -> String {
        var k = 1
        var result = ""
        
        loop: while let token = nextToken(s, &idx) {
            switch token {
            case .letter(let ch):
                result += String(ch)
            case .num(let n):
                k = n
            case .open:
                let tempStr = parse(s, &idx)
                var tempResult = String(tempStr)
                for _ in 1..<k {
                    tempResult += tempStr
                }
                result += tempResult
            case .close:
                break loop
            }
        }
        
        return result
    }
    
    func nextToken(_ s: String, _ idx: inout String.Index) -> Token? {
        guard idx != s.endIndex else {
            return nil
        }
        
        var numStr = String()
        repeat {
            let ch = s[idx]
            if ch >= "0", ch <= "9" {
                numStr += String(ch)
                idx = s.index(after: idx)
            } else if !numStr.isEmpty {
                return .num(value: Int(numStr)!)
            } else {
                var token: Token?
                switch ch {
                case "[": token = .open
                case "]": token = .close
                default: token = .letter(ch: ch)
                }
                idx = s.index(after: idx)
                return token
            }
        } while idx != s.endIndex
        
        return nil
    }
    
    enum Token {
        case num(value: Int)
        case open
        case close
        case letter(ch: Character)
    }
}
