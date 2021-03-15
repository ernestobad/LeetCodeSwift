//
//  DesignHashMapSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/8/21.
//  Copyright © 2021 Ernesto Badillo. All rights reserved.
//

import Foundation

class DesignHashMapSolution {
    
    static func run() {
        
    }
    
}


class MyHashMap {
    
    class Node {
        var key: Int
        var val: Int
        var next: Node?
        
        init(key: Int, val: Int, next: Node? = nil) {
            self.key = key
            self.val = val
            self.next = next
        }
    }
    
    static let size = 100
    
    var list = [Node?](repeating: nil, count: MyHashMap.size)

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let idx = key % MyHashMap.size
        if let node = list[idx] {
            insertOrReplace(head: node, key: key, value: value)
        } else {
            list[idx] = Node(key: key, val: value)
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let idx = key % MyHashMap.size
        if let root = list[idx] {
            return find(head: root, key: key)?.val ?? -1
        } else {
            return -1
        }
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        
    }
    
    private func insertOrReplace(head: Node, key: Int, value: Int) {
        
    }
    
    private func find(head: Node, key: Int) -> Node? {
        return nil
    }
    
    private func remove(head: Node, key: Int) {
        
    }
}

