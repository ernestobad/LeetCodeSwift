//
//  LongestUnivaluePathSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/10/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LongestUnivaluePathSolution {
        
    static func run() {
        
        //        5
        //       / \
        //      4   5
        //     / \   \
        //    1   1   5
        let root1 = TreeNode(5,
                             TreeNode(4, TreeNode(1), TreeNode(1)),
                             TreeNode(5, nil, TreeNode(5)))
        print("expected: 2, actual: " + LongestUnivaluePathSolution().longestUnivaluePath(root1).description)

        //        1
        //       / \
        //      4   5
        //     / \   \
        //    4   4   5
        let root2 = TreeNode(1,
                             TreeNode(4, TreeNode(4), TreeNode(4)),
                             TreeNode(5, nil, TreeNode(5)))
        print("expected: 2, actual: " + LongestUnivaluePathSolution().longestUnivaluePath(root2).description)
        
        //        1
        //       / \
        //      1   1
        let root3 = TreeNode(1, TreeNode(1), TreeNode(1))
        print("expected: 2, actual: " + LongestUnivaluePathSolution().longestUnivaluePath(root3).description)
        
        
        //        5
        //       / \
        //      5   5
        //     / \   \
        //    4   5   5
        let root4 = TreeNode(5,
                             TreeNode(5, TreeNode(4), TreeNode(5)),
                             TreeNode(5, nil, TreeNode(5)))
        print("expected: 4, actual: " + LongestUnivaluePathSolution().longestUnivaluePath(root4).description)
        
        
        let root5 = TreeNode(5)
        print("expected: 0, actual: " + LongestUnivaluePathSolution().longestUnivaluePath(root5).description)
    }
    
    var luvp: Int = 0
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        _ = longestOneSidePath(root)
        return luvp
    }
    
    func longestOneSidePath(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let leftLOSP = longestOneSidePath(node.left)
        let left: Int
        if node.val == node.left?.val {
            left = leftLOSP + 1
        } else {
            left = 0
        }
        
        let rightLOSP = longestOneSidePath(node.right)
        let right: Int
        if node.val == node.right?.val {
            right = rightLOSP + 1
        } else {
            right = 0
        }
        
        luvp = max(luvp, left + right)
        
        return max(left, right)
    }

    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
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
    }

}
