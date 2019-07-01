//
//  FlattenNestedListIteratorSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/31/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class FlattenNestedListIteratorSolution {
    static func run() {
        // [[1,1],2,[1,1]]
        let list : [NestedInteger] = [NestedInteger([NestedInteger(1), NestedInteger(1)]),
                                      NestedInteger(2),
                                      NestedInteger([NestedInteger(1), NestedInteger(1)])]
        let it = NestedIterator(list)
        print("expected: true, actual: \(it.hasNext())")
        print("expected: 1, actual: \(it.next())")
        print("expected: true, actual: \(it.hasNext())")
        print("expected: 1, actual: \(it.next())")
        print("expected: true, actual: \(it.hasNext())")
        print("expected: 2, actual: \(it.next())")
        print("expected: true, actual: \(it.hasNext())")
        print("expected: 1, actual: \(it.next())")
        print("expected: true, actual: \(it.hasNext())")
        print("expected: 1, actual: \(it.next())")
        print("expected: false, actual: \(it.hasNext())")
    }
    
    class NestedIterator {
        
        var stack = [StackEntry]()
        
        init(_ nestedList: [NestedInteger]) {
            self.stack.append(StackEntry(nestedList, 0))
            self.moveToInt()
        }
        
        func next() -> Int {
            guard let head = self.stack.last, head.i < head.list.count, head.list[head.i].isInteger() else {
                return 0
            }
            let val = head.list[head.i].getInteger()
            head.i += 1
            self.moveToInt()
            return val
        }
        
        func hasNext() -> Bool {
            return !self.stack.isEmpty
        }
        
        private func moveToInt() {
            guard let head = self.stack.last else {
                return
            }
            if head.list.isEmpty || head.i >= head.list.count {
                _ = self.stack.popLast()
                self.stack.last?.i += 1
                self.moveToInt()
            } else if !head.list[head.i].isInteger() {
                self.stack.append(StackEntry(head.list[head.i].getList(), 0))
                self.moveToInt()
            } else {
                // int, nothing to do.
            }
        }
    }
    
    class StackEntry {
        let list: [NestedInteger]
        var i: Int
        init(_ list: [NestedInteger], _ i: Int) {
            self.list = list
            self.i = 0
        }
    }
    
    class NestedInteger {
        
        private var int: Int?
        private var list: [NestedInteger]
        
        init(_ int: Int) {
            self.int = int
            self.list = [NestedInteger]()
        }
        
        init(_ list: [NestedInteger]) {
            self.int = nil
            self.list = list
        }
        
        // Return true if this NestedInteger holds a single integer, rather than a nested list.
        public func isInteger() -> Bool {
            return self.int != nil
        }
        
        // Return the single integer that this NestedInteger holds, if it holds a single integer
        // The result is undefined if this NestedInteger holds a nested list
        public func getInteger() -> Int {
            return self.int ?? 0
        }
        
        // Set this NestedInteger to hold a single integer.
        public func setInteger(value: Int) {
            self.int = value
        }
        
        // Set this NestedInteger to hold a nested list and adds a nested integer to it.
        public func add(elem: NestedInteger) {
            self.list.append(elem)
        }
        
        // Return the nested list that this NestedInteger holds, if it holds a nested list
        // The result is undefined if this NestedInteger holds a single integer
        public func getList() -> [NestedInteger] {
            return self.list
        }
    }
}
