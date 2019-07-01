//
//  LRUCacheSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/17/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class LRUCacheSolution {
    
    static func run() {
        let cache1 = LRUCache(2);
        cache1.put(1, 1);
        cache1.put(2, 2);
        print("expected: 1, acutal: \(cache1.get(1))")
        cache1.put(3, 3);    // evicts key 2
        print("expected: -1, acutal: \(cache1.get(2))")
        cache1.put(4, 4);    // evicts key 1
        print("expected: -1, acutal: \(cache1.get(1))")
        print("expected: 3, acutal: \(cache1.get(3))")
        print("expected: 4, acutal: \(cache1.get(4))")
        
        let cache2 = LRUCache(0);
        cache2.put(1, 1);
        cache2.put(2, 2);
        print("expected: -1, acutal: \(cache2.get(1))")
        cache2.put(3, 3);    // evicts key 2
        print("expected: -1, acutal: \(cache2.get(2))")
        cache2.put(4, 4);    // evicts key 1
        print("expected: -1, acutal: \(cache2.get(1))")
        print("expected: -1, acutal: \(cache2.get(3))")
        print("expected: -1, acutal: \(cache2.get(4))")
        
        let cache3 = LRUCache(1);
        cache3.put(1, 1);
        cache3.put(2, 2); // evicts key 1
        print("expected: -1, acutal: \(cache3.get(1))")
        cache3.put(3, 3);    // evicts key 2
        print("expected: -1, acutal: \(cache3.get(2))")
        cache3.put(4, 4);    // evicts key 1
        print("expected: -1, acutal: \(cache3.get(1))")
        print("expected: -1, acutal: \(cache3.get(3))")
        print("expected: 4, acutal: \(cache3.get(4))")
    }
    
    class LRUCacheNode {
        let key: Int
        var next: LRUCacheNode?
        var prev: LRUCacheNode?
        init(_ key: Int) {
            self.key = key
        }
    }
    
    class LRUCache {
        
        let capacity: Int
        
        var keyToVal = [Int: Int]()
        
        var first: LRUCacheNode?
        var last: LRUCacheNode?
        var keyToNode = [Int: LRUCacheNode]()
        
        init(_ capacity: Int) {
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            if let value = self.keyToVal[key] {
                self.moveToFist(key)
                return value
            }
            
            return -1
        }
        
        func put(_ key: Int, _ value: Int) {
            self.keyToVal[key] = value
            self.moveToFist(key)
            
            if self.keyToVal.count > self.capacity {
                self.removeLast()
            }
        }
        
        private func removeLast() {
            guard let lastNode = self.last else {
                return
            }
            self.keyToVal[lastNode.key] = nil
            self.keyToNode[lastNode.key] = nil
            self.last = lastNode.prev
            lastNode.prev?.next = nil
            if lastNode.key == self.first?.key {
                self.first = nil
            }
        }
        
        private func moveToFist(_ key: Int) -> Void {
            let node: LRUCacheNode
            if let existingNode = self.keyToNode[key] {
                guard existingNode !== self.first else {
                    return
                }
                if self.last?.key == existingNode.key {
                    self.last = existingNode.prev
                }
                existingNode.prev?.next = existingNode.next
                existingNode.next?.prev = existingNode.prev
                node = existingNode
            } else {
                node = LRUCacheNode(key)
            }
            self.keyToNode[key] = node
            node.next = self.first
            node.prev = nil
            self.first?.prev = node
            self.first = node
            if self.last == nil {
                self.last = node
            }
        }
    }
}



