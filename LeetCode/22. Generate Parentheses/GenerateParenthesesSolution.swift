//
//  GenerateParenthesesSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/21/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class GenerateParenthesesSolution {
    
    static func run() {
        let x = GenerateParenthesesSolution().generateParenthesis(4)
        print(x)
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var list = [String]()
        self.gen("", 0, n, n, list: &list)
        return list
    }
    
    func gen(_ prefix: String, _ open: Int, _ left: Int, _ right: Int, list: inout [String]) {
        
        guard left > 0 || right > 0 else {
            list.append(prefix)
            return
        }
        
        if open > 0, right > 0 { // )
            self.gen(prefix + ")", open-1, left, right-1, list: &list)
        }
        
        if left > 0 { // (
            self.gen(prefix + "(", open+1, left-1, right, list: &list)
        }
    }
}
