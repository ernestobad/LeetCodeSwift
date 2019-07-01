//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/16/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class GroupAnagrams {
    static func run() {
        print("Expected: [ [ate, eat, tea], [nat, tan], [bat] ], Actual: \(GroupAnagrams().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))")
    }
    
    let chars: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String:[String]]()
        for str in strs {
            let nstr = normalized(str)
            if map[nstr] == nil {
                map[nstr] = [String]()
            }
            map[nstr]?.append(str)
        }
        return Array(map.values)
    }
    
    func normalized(_ str: String) -> String {
        var map = [Character:Int]()
        for ch in str {
            map[ch] = (map[ch] ?? 0) + 1
        }
        var nstr = String()
        
        for ch in chars {
            nstr.append((map[ch] ?? 0).description)
            nstr.append(":")
        }
        
        return nstr
    }
}
