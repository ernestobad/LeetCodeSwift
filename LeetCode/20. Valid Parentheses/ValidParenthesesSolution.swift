//
//  ValidParenthesesSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/18/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ValidParenthesesSolution {
    
    static func run() {
        print("expected: true, actual: \(ValidParenthesesSolution().isValid(""))")
        print("expected: true, actual: \(ValidParenthesesSolution().isValid("()"))")
        print("expected: true, actual: \(ValidParenthesesSolution().isValid("({})[]{{()}}"))")
        print("expected: false, actual: \(ValidParenthesesSolution().isValid("({})[]{()}}"))")
        print("expected: false, actual: \(ValidParenthesesSolution().isValid("([)]"))")
    }
    
    func isValid(_ s: String) -> Bool {
        let matchingDict: [Character:Character] = [")": "(", "}": "{", "]": "["]
        var stack = [Character]()
        for ch in s {
            switch ch {
            case "(", "{", "[":
                stack.append(ch)
            case ")", "}", "]":
                guard !stack.isEmpty, matchingDict[ch] == stack.removeLast() else {
                    return false
                }
            default:
                return false
            }
        }
        return stack.isEmpty
    }
}
