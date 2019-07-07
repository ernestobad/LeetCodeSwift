//
//  BinaryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/5/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class BinaryTreeLevelOrderTraversal {
    
    static func run() {
        
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if let root = root {
            nextLevel([root], &res)
        }
        return res
    }
    
    func nextLevel(_ nodes: [TreeNode], _ res: inout [[Int]]) {
        
        guard !nodes.isEmpty else { return }
        
        var nextLevelNodes = [TreeNode]()
        var levelValues = [Int]()
        
        for n in nodes {
            levelValues.append(n.val)
            if let left = n.left { nextLevelNodes.append(left) }
            if let right = n.right { nextLevelNodes.append(right) }
        }
        
        guard !levelValues.isEmpty else { return }
        
        res.append(levelValues)
        nextLevel(nextLevelNodes, &res)
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
