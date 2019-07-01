//
//  BasicCalculator.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/25/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation


class BasicCalculatorSolution {
    static func run() {
        print("expected: 2, actual: \(BasicCalculatorSolution().calculate("1 + 1"))")
        print("expected: 3, actual: \(BasicCalculatorSolution().calculate(" 2-1 + 2 "))")
        print("expected: 23, actual: \(BasicCalculatorSolution().calculate("(1+(4+5+2)-3)+(6+8)"))")
        print("expected: 1, actual: \(BasicCalculatorSolution().calculate("1"))")
        print("expected: 12324, actual: \(BasicCalculatorSolution().calculate("12324"))")
        print("expected: 2, actual: \(BasicCalculatorSolution().calculate("( 1 + 1 + ( ( ((2) - (2))) ) )"))")
        print("expected: 11, actual: \(BasicCalculatorSolution().calculate("(7)-(0)+(4)"))")
    }
    
    func calculate(_ s: String) -> Int {
        var index = s.startIndex
        let expr = parse(s, &index)
        return expr!.eval()
    }
    
    func parse(_ str: String, _ index: inout String.Index) -> Expression? {
        var rootExpr: Expression?
        
        loop: while let token = nextToken(str, &index) {
            switch token {
            case .openParenthesis:
                if rootExpr == nil {
                    rootExpr = parse(str, &index)
                } else if let opExpr = rootExpr as? OperationExpr {
                    opExpr.right = parse(str, &index)!
                }
            case .closeParenthesis:
                break loop
            case .operation(let op):
                let leftExpr = rootExpr
                let opExpr = OperationExpr(op)
                opExpr.left = leftExpr!
                rootExpr = opExpr
            case .num(let value):
                if rootExpr == nil {
                    rootExpr = ValueExpr(value)
                } else if let opExpr = rootExpr as? OperationExpr {
                    opExpr.right = ValueExpr(value)
                }
            }
        }
        
        return rootExpr
    }
    
    func nextToken(_ str: String, _ index: inout String.Index) -> Token? {
        
        guard index != str.endIndex else {
            return nil
        }
        
        while index != str.endIndex, str[index] == " " {
            index = str.index(after: index)
        }
        
        guard index != str.endIndex else {
            return nil
        }
        
        var ch = str[index]
        switch ch {
        case "(":
            index = str.index(after: index)
            return .openParenthesis
        case ")":
            index = str.index(after: index)
            return .closeParenthesis
        case "+":
            index = str.index(after: index)
            return .operation(op: .addition)
        case "-":
            index = str.index(after: index)
            return .operation(op: .substraction)
        default:
            var numStr = String()
            
            repeat {
                ch = str[index]
                guard ch >= "0", ch <= "9" else {
                    break
                }
                numStr.append(ch)
                index = str.index(after: index)
            } while index != str.endIndex
            
            return .num(value: Int(numStr)!)
        }
    }
}

protocol Expression {
    func eval() -> Int
}

enum Token {
    case openParenthesis
    case closeParenthesis
    case operation(op: Operator)
    case num(value: Int)
}

enum Operator {
    case addition
    case substraction
}

class OperationExpr: Expression {
    let op: Operator
    var left: Expression?
    var right: Expression?
    init(_ op: Operator) {
        self.op = op
        self.left = nil
        self.right = nil
    }
    func eval() -> Int {
        switch op {
        case .addition:
            return left!.eval() + right!.eval()
        case .substraction:
            return left!.eval() - right!.eval()
        }
    }
}

class ValueExpr: Expression {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
    func eval() -> Int {
        return self.value
    }
}
