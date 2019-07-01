//
//  BinarySearchTreeIterator.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/30/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation



class BinarySearchTreeIterator {
    
    static func run() {
        let root = TreeNode(7, TreeNode(3), TreeNode(15, TreeNode(9), TreeNode(20)))
        let it = BSTIterator(root)
        print("expected: \(true) actual: \(it.hasNext())")
        print("expected: \(3) actual: \(it.next())")
        print("expected: \(true) actual: \(it.hasNext())")
        print("expected: \(7) actual: \(it.next())")
        print("expected: \(true) actual: \(it.hasNext())")
        print("expected: \(9) actual: \(it.next())")
        print("expected: \(true) actual: \(it.hasNext())")
        print("expected: \(15) actual: \(it.next())")
        print("expected: \(true) actual: \(it.hasNext())")
        print("expected: \(20) actual: \(it.next())")
        print("expected: \(false) actual: \(it.hasNext())")
    }
    
    class BSTIterator {
        
        var stack = [Entry]()
        
        init(_ root: TreeNode?) {
            if let root = root {
                stack.append(Entry(root, .initial))
                processStack()
            }
        }
        
        /** @return the next smallest number */
        func next() -> Int {
            guard let head = stack.last else {
                return 0
            }
            let val = head.node.val
            head.state = .selfVisited
            processStack()
            return val
        }
        
        /** @return whether we have a next smallest number */
        func hasNext() -> Bool {
            return !stack.isEmpty
        }
        
        private func processStack() {
            guard let head = stack.last else {
                return
            }
            switch head.state {
            case .initial:
                if let left = head.node.left {
                    stack.append(Entry(left, .initial))
                }
                head.state = .leftVisited
                processStack()
            case .leftVisited:
                break
            case .selfVisited:
                if let right = head.node.right {
                    stack.append(Entry(right, .initial))
                }
                head.state = .rightVisited
                processStack()
            case .rightVisited:
                _ = stack.popLast()
                processStack()
            }
        }
    }
    
    class Entry {
        
        let node: TreeNode
        var state: State
        
        init(_ node: TreeNode, _ state: State) {
            self.node = node
            self.state = state
        }
    }
    
    enum State {
        case initial
        case leftVisited
        case selfVisited
        case rightVisited
    }
    
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
        
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
        
        var description: String {
            var str = String()
            str += "("
            str += self.val.description
            if self.left != nil || self.right != nil {
                str += " l:\(self.left?.description ?? "null") r:\(self.right?.description ?? "null"))"
            }
            str += ")"
            return str
        }
    }
}
