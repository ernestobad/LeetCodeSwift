//
//  MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/1/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class MergeTwoSortedLists {
    class func run() {
        // 1->2->4
        let l1 = ListNode(1, ListNode(2, ListNode(4, nil)))
        // 1->3->4
        let l2 = ListNode(1, ListNode(3, ListNode(4, nil)))
        print("Expected: 1->1->2->3->4->4, Actual: \(MergeTwoSortedLists().mergeTwoLists(l1, l2)?.description ?? "")")
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head1 = l1
        var head2 = l2
        var head: ListNode?
        var tail: ListNode?
        
        let append = { (_ val: Int) in
            let newNode = ListNode(val)
            tail?.next = newNode
            tail = newNode
            if head == nil { head = newNode }
        }
        
        while head1 != nil || head2 != nil {
            if let val1 = head1?.val, let val2 = head2?.val {
                if val1 < val2 { append(val1); head1 = head1?.next }
                else { append(val2); head2 = head2?.next }
            } else if let val1 = head1?.val {
                append(val1); head1 = head1?.next
            } else if let val2 = head2?.val {
                append(val2); head2 = head2?.next
            }
        }
        
        return head
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
