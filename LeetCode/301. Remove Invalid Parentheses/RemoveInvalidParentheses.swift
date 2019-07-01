//
//  RemoveInvalidParentheses.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/14/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class RemoveInvalidParentheses {
    
    static func run() {
        print("expected: [\"()()()\", \"(())()\"], actual: \(RemoveInvalidParentheses().removeInvalidParentheses("()())()"))")
        print("expected: [\"(a)()()\", \"(a())()\"], actual: \(RemoveInvalidParentheses().removeInvalidParentheses("(a)())()"))")
        print("expected: [\"\"], actual: \(RemoveInvalidParentheses().removeInvalidParentheses(")("))")
        print("expected: [\"\"], actual: \(RemoveInvalidParentheses().removeInvalidParentheses("))"))")
    }
    
    func removeInvalidParentheses(_ s: String) -> [String] {
        var result = [String]()
        let (invalidLeft, invalidRight) = countInvalidParentheses(s)
        var prefix = String()
        var suffix = s
        removeInvalidParentheses(&prefix, &suffix, 0, invalidLeft, invalidRight, nil, &result)
        return result
    }
    
    func removeInvalidParentheses(_ prefix: inout String,
                                  _ suffix: inout String,
                                  _ open: Int,
                                  _ removableLeft: Int,
                                  _ removableRight: Int,
                                  _ nonRemovable: Character?,
                                  _ result: inout [String]) {
        
        guard let ch = suffix.first else {
            if removableLeft == 0, removableRight == 0 {
                result.append(String(prefix))
            }
            return
        }
        
        guard suffix.count >= removableLeft + removableRight else {
            return
        }
        
        var newOpen = open
        var newNonRemovable: Character? = nil
        
        if ch == "(" {
            if removableLeft > 0, nonRemovable != "(" {
                suffix.removeFirst()
                removeInvalidParentheses(&prefix, &suffix, open, removableLeft-1, removableRight, nil, &result)
                suffix.insert(ch, at: suffix.startIndex)
                newNonRemovable = "("
            } else if nonRemovable == "(" {
                newNonRemovable = "("
            }
            newOpen += 1
        } else if ch == ")" {
            if removableRight > 0, nonRemovable != ")" {
                suffix.removeFirst()
                removeInvalidParentheses(&prefix, &suffix, open, removableLeft, removableRight-1, nil, &result)
                suffix.insert(ch, at: suffix.startIndex)
                newNonRemovable = ")"
            } else if nonRemovable == ")" {
                newNonRemovable = ")"
            }
            if newOpen > 0 {
                newOpen -= 1
            } else {
                return
            }
        }
        
        prefix.append(suffix.removeFirst())
        removeInvalidParentheses(&prefix, &suffix, newOpen, removableLeft, removableRight, newNonRemovable, &result)
        suffix.insert(prefix.removeLast(), at: suffix.startIndex)
    }
    
    func countInvalidParentheses(_ s: String) -> (Int, Int) {
        var left = 0
        var right = 0
        for ch in s {
            if ch == "(" {
                left += 1
            } else if ch == ")" {
                if left > 0 {
                    left -= 1
                } else {
                    right += 1
                }
            }
        }
        return (left, right)
    }
}
