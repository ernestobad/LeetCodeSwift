//
//  LowestCommonAncestorOfABinarySearchTree.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/7/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LowestCommonAncestorOfABinarySearchTree {
    static func run() {
        
        //        4
        //       / \
        //      2   5
        //     / \   \
        //    1   3   6
        let root1 = TreeNode(4,
                             TreeNode(2, TreeNode(1), TreeNode(3)),
                             TreeNode(5, nil, TreeNode(6)))
        
        print("expected: 4, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(4), TreeNode(5))!.val)")

        print("expected: 4, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(6), TreeNode(4))!.val)")
        
        print("expected: 5, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(6), TreeNode(5))!.val)")
        
        print("expected: 4, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(1), TreeNode(5))!.val)")

        print("expected: 4, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(3), TreeNode(4))!.val)")

        print("expected: 2, actual: \(LowestCommonAncestorOfABinarySearchTree().lowestCommonAncestor(root1, TreeNode(1), TreeNode(2))!.val)")
    }
    
    func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        if root.val == p.val || root.val == q.val { return root }
        else if (root.val < p.val) != (root.val < q.val) { return root }
        else if root.val < p.val {
            guard let right = root.right else {
                return nil
            }
            return lowestCommonAncestor(right, p, q)
        } else {
            guard let left = root.left else {
                return nil
            }
            return lowestCommonAncestor(left, p, q)
        }
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
