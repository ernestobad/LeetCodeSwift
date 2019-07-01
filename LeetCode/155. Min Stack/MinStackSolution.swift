//
//  MinStackSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/31/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MinStackSolution {
    static func run() {
        
    }
    
    class MinStack {
        
        var min: Int?
        var last: Entry?
        
        /** initialize your data structure here. */
        init() {
            
        }
        
        func push(_ x: Int) {
            let newMin = Swift.min(x, self.min ?? x)
            self.min = newMin
            let entry = Entry(x, newMin)
            entry.prev = self.last
            self.last = entry
        }
        
        func pop() {
            self.last = self.last?.prev
            self.min = self.last?.min
        }
        
        func top() -> Int {
            return self.last?.val ?? 0
        }
        
        func getMin() -> Int {
            return self.last?.min ?? 0
        }
    }
    
    class Entry {
        var val: Int
        var min: Int
        var prev: Entry?
        init (_ val: Int, _ min: Int) {
            self.val = val
            self.min = min
        }
    }
}

class MinStack {
    
    var min: Int?
    var last: Entry?
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        let newMin = Swift.min(x, self.min ?? x)
        self.min = newMin
        let entry = Entry(x, newMin)
        entry.prev = self.last
        self.last = entry
    }
    
    func pop() {
        self.last = self.last?.prev
        self.min = self.last?.min
    }
    
    func top() -> Int {
        return self.last?.val ?? 0
    }
    
    func getMin() -> Int {
        return self.last?.min ?? 0
    }
}

class Entry {
    var val: Int
    var min: Int
    var prev: Entry?
    init (_ val: Int, _ min: Int) {
        self.val = val
        self.min = min
    }
}
