//
//  AddTwoNumbersSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/10/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class AddTwoNumbersSolution {
    
    static func run() {
        
        //Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
        //Output: 7 -> 0 -> 8
        //Explanation: 342 + 465 = 807.
        var l1: ListNode
        var l2: ListNode
        var r: ListNode?
        
        // 342 + 465 = 807.
        l1 = ListNode(2, ListNode(4, ListNode(3, nil)))
        l2 = ListNode(5, ListNode(6, ListNode(4, nil)))
        r = AddTwoNumbersSolution().addTwoNumbers(l1, l2)
        print("expected: 7 -> 0 -> 8, actual: " + (r?.description ?? "<nil>"))
        
        // 0 + 0 = 0
        l1 = ListNode(0, nil)
        l2 = ListNode(0, nil)
        r = AddTwoNumbersSolution().addTwoNumbers(l1, l2)
        print("expected: 0, actual: " + (r?.description ?? "<nil>"))
        
        // 0 + 1 = 1
        l1 = ListNode(0, nil)
        l2 = ListNode(1, nil)
        r = AddTwoNumbersSolution().addTwoNumbers(l1, l2)
        print("expected: 1, actual: " + (r?.description ?? "<nil>"))
        
        // 999 + 1 = 1000
        l1 = ListNode(1, nil)
        l2 = ListNode(9, ListNode(9, ListNode(9, nil)))
        r = AddTwoNumbersSolution().addTwoNumbers(l1, l2)
        print("expected: 0 -> 0 -> 0 -> 1, actual: " + (r?.description ?? "<nil>"))
        
        // 9999 + 999 = 10998.
        l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, nil))))
        l2 = ListNode(9, ListNode(9, ListNode(9, nil)))
        r = AddTwoNumbersSolution().addTwoNumbers(l1, l2)
        print("expected: 8 -> 9 -> 9 -> 0 -> 1, actual: " + (r?.description ?? "<nil>"))
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addTwoNumbers(l1, l2, acc: 0)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, acc: Int) -> ListNode? {
        if l1 != nil || l2 != nil {
            let total = (l1?.val ?? 0) + (l2?.val ?? 0) + acc
            let newNode = ListNode(total % 10)
            let newAcc = total / 10
            newNode.next = addTwoNumbers(l1?.next, l2?.next, acc: newAcc)
            return newNode
        } else if acc > 0 {
            return ListNode(acc)
        } else {
            return nil
        }
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

