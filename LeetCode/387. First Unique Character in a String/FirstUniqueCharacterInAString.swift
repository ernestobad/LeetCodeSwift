//
//  FirstUniqueCharacterInAString.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/9/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class FirstUniqueCharacterInAString {
    static func run() {
        print("Expected: 0, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("leetcode"))")
        print("Expected: 2, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("loveleetcode"))")
        print("Expected: -1, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("leeccooddl"))")
        print("Expected: 6, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("abcabcx"))")
        print("Expected: -1, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("abccba"))")
        print("Expected: 0, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("xabccba"))")
        print("Expected: 1, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("xdyzzyx"))")
        print("Expected: -1, Actual: \(FirstUniqueCharacterInAString().firstUniqChar(""))")
        print("Expected: 0, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("a"))")
        print("Expected: 0, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("ab"))")
        print("Expected: 61, Actual: \(FirstUniqueCharacterInAString().firstUniqChar("itwqbtcdprfsuprkrjkausiterybzncbmdvkgljxuekizvaivszowqtmrttiihervpncztuoljftlxybpgwnjb"))")
    }
    
    func firstUniqChar(_ s: String) -> Int {
     
        var dict = [Character:ListNode]()
        var head: ListNode?
        var last: ListNode?
        
        for (idx, ch) in s.enumerated() {
            if let node = dict[ch] {
                node.prev?.next = node.next
                node.next?.prev = node.prev
                if node === head { head = node.next }
                if node === last { last = node.prev }
                node.next = nil
                node.prev = nil
            } else {
                let node = ListNode(idx, ch)
                if last == nil {
                    head = node
                    last = node
                } else {
                    last?.next = node
                    node.prev = last
                    last = node
                }
                dict[ch] = node
            }
        }
        
        return head?.offset ?? -1
    }
    
    class ListNode {
        var prev: ListNode?
        var next: ListNode?
        var offset: Int
        var ch: Character
        init(_ offset: Int, _ ch: Character) {
            self.offset = offset
            self.ch = ch
        }
    }
}
