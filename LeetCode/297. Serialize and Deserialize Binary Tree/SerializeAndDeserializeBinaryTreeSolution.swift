//
//  SerializeAndDeserializeBinaryTreeSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/23/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class SerializeAndDeserializeBinaryTreeSolution {
    
    static func run() {
        let root = TreeNode(2, TreeNode(2), TreeNode(5, TreeNode(4), TreeNode(2)))
        print("\(root.description)")
        let serialized = SerializeAndDeserializeBinaryTreeSolution().serialize(root)
        print(serialized)
        let deserialized = SerializeAndDeserializeBinaryTreeSolution().deserialize(serialized)
        print(deserialized?.description ?? "")
    }
    
    func serialize(_ node: TreeNode?) -> String {
        var str = String()
        self.serialize(node, &str)
        return str
    }
    
    func deserialize(_ str: String) -> TreeNode? {
        var offset = str.startIndex
        return self.deserialize(str, offset: &offset)
    }
    
    private func serialize(_ node: TreeNode?, _ str: inout String) {
        guard let node = node else {
            str += "nil,"
            return
        }
        str += "\(node.val),"
        self.serialize(node.left, &str)
        self.serialize(node.right, &str)
    }
    
    private func deserialize(_ str: String, offset: inout String.Index) -> TreeNode? {
        guard offset < str.endIndex else { return nil }
        if let val = self.nextInt(str, offset: &offset) {
            return TreeNode(val, deserialize(str, offset: &offset), deserialize(str, offset: &offset))
        } else {
            return nil
        }
    }
    
    private func nextInt(_ str: String, offset: inout String.Index) -> Int? {
        var intStr = String()
        var ch: Character
        while offset < str.endIndex {
            ch = str[offset]
            offset = str.index(after: offset)
            guard ch != "," else { break }
            intStr.append(ch)
        }
        return intStr == "nil" ? nil : Int(intStr)
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
