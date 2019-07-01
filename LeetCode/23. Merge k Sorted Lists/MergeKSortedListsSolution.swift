//
//  MergeKSortedListsSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/17/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MergeKSortedListsSolution {
    
    static func run() {
        
//        Input:
//        [
//        1->4->5,
//        1->3->4,
//        2->6
//        ]
//        Output: 1->1->2->3->4->4->5->6
        
        let lists: [ListNode?] = [
            ListNode(1, ListNode(4, ListNode(5, nil))),
            ListNode(1, ListNode(3, ListNode(4, nil))),
            ListNode(2, ListNode(6, nil))
        ]
        let output = MergeKSortedListsSolution().mergeKLists(lists)
        print("expected: 1->1->2->3->4->4->5->6, actual: \(output!.description)")
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var first: ListNode?
        var last: ListNode?
        
        var ordered : [ListNode] = lists.compactMap { $0 } .sorted { $0.val <= $1.val }
        
        while let nextValue = nextValue(&ordered) {
            let newNode = ListNode(nextValue)
            if first == nil {
                first = newNode
                last = newNode
            } else {
                last?.next = newNode
                last = newNode
            }
        }
        
        return first
    }
    
    private func nextValue(_ ordered: inout [ListNode]) -> Int? {
        guard let firstListFirstNode = ordered.first else {
            return nil
        }
        
        guard let firstListNextNode = ordered.first?.next else {
            ordered.removeFirst()
            return firstListFirstNode.val
        }
        
        ordered[0] = firstListNextNode
        
        guard let nextListFirstNode = (ordered.count > 1 ? ordered[1] : nil) else {
            return firstListFirstNode.val
        }
        
        if firstListNextNode.val > nextListFirstNode.val {
            ordered.removeFirst()
            self.orderedInsert(&ordered, node: firstListNextNode)
        }
        
        return firstListFirstNode.val
    }
    
    private func orderedInsert(_ ordered: inout [ListNode], node: ListNode) {
        // Note: this should be binary search insertion
        var pos = ordered.count
        for (i, currNode) in ordered.enumerated() {
            if node.val <= currNode.val {
                pos = i
                break
            }
        }
        ordered.insert(node, at: pos)
    }
    
    class ListNode {
        var val: Int
        var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
        
        var description: String {
            var str = String()
            var nodeOrNil : ListNode? = self
            while let node = nodeOrNil {
                str.append("\(node.val)")
                if node.next != nil {
                    str.append("->")
                }
                nodeOrNil = node.next
            }
            return str
        }
    }
}
