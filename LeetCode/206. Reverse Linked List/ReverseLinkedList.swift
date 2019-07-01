//
//  ReverseLinkedList.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/3/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ReverseLinkedList {
    
    static func run() {
        print("expected: 1, actual: \(ReverseLinkedList().reverseList(ListNode(1))!.description)")
        print("expected: 1, actual: \(ReverseLinkedList().reverseList2(ListNode(1))!.description)")
        
        print("expected: 2 -> 1, actual: \(ReverseLinkedList().reverseList(ListNode(1, ListNode(2)))!.description)")
        print("expected: 2 -> 1, actual: \(ReverseLinkedList().reverseList2(ListNode(1, ListNode(2)))!.description)")
        
        print("expected: 3 -> 2 -> 1, actual: \(ReverseLinkedList().reverseList(ListNode(1, ListNode(2, ListNode(3))))!.description)")
        print("expected: 3 -> 2 -> 1, actual: \(ReverseLinkedList().reverseList2(ListNode(1, ListNode(2, ListNode(3))))!.description)")
    }
   
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let next = head?.next else {
            return head
        }
        
        let reversed = reverseList(next)
        next.next = head
        head?.next = nil
        return reversed
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        
        var p2 = head
        var p1 = head?.next
        var p0 = p1?.next
        
        while p1 != nil {
            p1?.next = p2
            p2 = p1
            p1 = p0
            p0 = p0?.next
        }
        
        head?.next = nil
        return p1 ?? p2
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
                    str.append(" -> ")
                }
                nodeOrNil = node.next
            }
            return str
        }
    }

}
