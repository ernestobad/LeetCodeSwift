//
//  LowestCommonAncestorOfABinaryTree.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/3/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LowestCommonAncestorOfABinaryTree {
    
    
    static func run() {
        
        //        1
        //       / \
        //      2   3
        //     / \   \
        //    4   5   6
        let root1 = TreeNode(1,
                             TreeNode(2, TreeNode(4), TreeNode(5)),
                             TreeNode(3, nil, TreeNode(6)))
        
        print("expected: 2, actual: \(LowestCommonAncestorOfABinaryTree().lowestCommonAncestor(root1, TreeNode(4), TreeNode(5))!.val)")
        
        print("expected: 3, actual: \(LowestCommonAncestorOfABinaryTree().lowestCommonAncestor(root1, TreeNode(6), TreeNode(3))!.val)")
        
        print("expected: 1, actual: \(LowestCommonAncestorOfABinaryTree().lowestCommonAncestor(root1, TreeNode(6), TreeNode(4))!.val)")
        
        print("expected: 1, actual: \(LowestCommonAncestorOfABinaryTree().lowestCommonAncestor(root1, TreeNode(1), TreeNode(5))!.val)")
    }
    
    var lowestCommonAncestor: TreeNode?
    
    func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        _ = findLowestCommonAcestor(root, p, q)
        return self.lowestCommonAncestor
    }
    
    func findLowestCommonAcestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> Int {
        var r = 0
        if root.val == p.val || root.val == q.val {
            r += 1
        }
        
        if let left = root.left {
            r += findLowestCommonAcestor(left, p, q)
        }
        
        if r >= 2 {
            if self.lowestCommonAncestor == nil { self.lowestCommonAncestor = root }
            return r
        }
        
        if let right = root.right {
            r += findLowestCommonAcestor(right, p, q)
        }
        
        if r >= 2, self.lowestCommonAncestor == nil {
            self.lowestCommonAncestor = root
        }
        
        return r
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
