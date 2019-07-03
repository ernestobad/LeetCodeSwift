//
//  ReverseNodesInKGroup.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/2/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class ReverseNodesInKGroup {
    
    static func run() {
        
        var list: ListNode?
        list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
        print("Expected: 2->1->4->3->5, Actual: \(ReverseNodesInKGroup().reverseKGroup(list, 2)!.description)")
        list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
        print("Expected: 3->2->1->4->5, Actual: \(ReverseNodesInKGroup().reverseKGroup(list, 3)!.description)")
        list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
        print("Expected: 1->2->3->4->5, Actual: \(ReverseNodesInKGroup().reverseKGroup(list, 1)!.description)")
    }
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var newHead: ListNode? = head
        var prevRevGroupLast: ListNode? = nil
        var currGroupHead: ListNode? = nil
        var curr = head
        var i = 0
        var g = 0
        while curr != nil {
            i += 1
            let next = curr?.next
            if currGroupHead == nil {
                currGroupHead = curr
            }
            if i == k {
                g += 1
                if g == 1 { newHead = curr }
                let currRevGroupHead = self.reverse(currGroupHead, k)
                prevRevGroupLast?.next = currRevGroupHead
                currGroupHead?.next = next
                prevRevGroupLast = currGroupHead
                currGroupHead = nil
                i = 0
            }
            curr = next
        }
        return newHead
    }
    
    func reverse(_ head: ListNode?, _ k: Int) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil
        var newHead: ListNode?
        var i = 0
        while curr != nil, i < k {
            i += 1
            newHead = curr
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return newHead
    }
    
    class ListNode {
        var val: Int
        var next: ListNode?
        
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        
        init(_ val: Int, _ next: ListNode?) {
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
