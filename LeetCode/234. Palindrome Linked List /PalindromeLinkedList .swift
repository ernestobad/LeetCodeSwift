//
//  PalindromeLinkedList .swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/5/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class PalindromeLinkedList {
    
    static func run() {
        let list1 = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
        print("Expected: true, actual: \(PalindromeLinkedList().isPalindrome(list1))")
        
        let list2 = ListNode(1, ListNode(2, ListNode(2)))
        print("Expected: false, actual: \(PalindromeLinkedList().isPalindrome(list2))")
        
        let list3 = ListNode(1)
        print("Expected: true, actual: \(PalindromeLinkedList().isPalindrome(list3))")
        
        let list4 = ListNode(1, ListNode(2, ListNode(1)))
        print("Expected: true, actual: \(PalindromeLinkedList().isPalindrome(list4))")
        
        let list5 = ListNode(1, ListNode(2, ListNode(2, ListNode(3))))
        print("Expected: false, actual: \(PalindromeLinkedList().isPalindrome(list5))")
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        var i = 0
        var curr = head
        while curr != nil {
            i += 1
            curr = curr?.next
        }
        
        let size = i
        let targetSize = Int(ceil(Double(size)/2.0))
        
        var revHead: ListNode? = nil
        var newHead: ListNode? = nil
        
        var prev: ListNode? = nil
        curr = head
        i = 0
        while curr != nil {
            i += 1
            let next = curr?.next
            curr?.next = prev
            revHead = curr
            prev = curr
            curr = next
            newHead = next
            if targetSize == i {
                break
            }
        }
        
        var curr1 = size % 2 == 0 ? revHead : revHead?.next
        var curr2 = newHead
        while curr1 != nil, curr2 != nil {
            if curr1?.val != curr2?.val {
                return false
            }
            curr1 = curr1?.next
            curr2 = curr2?.next
        }
        
        return true
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

