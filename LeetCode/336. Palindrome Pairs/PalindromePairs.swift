//
//  PalindromePairs.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/27/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class PalindromePairs {
    
    static func run() {
        
        let words1 = ["abcd","dcba","lls","s","sssll"] // sssll lls
        print("expected: [[0,1],[1,0],[3,2],[2,4]] actual: \(PalindromePairs().palindromePairs(words1))")

        let words2 = ["bat","tab","cat"]
        print("expected: [[0,1],[1,0]], actual: \(PalindromePairs().palindromePairs(words2))")
        
        let words3 = ["a",""]
        print("expected: [[0,1],[1,0]], actual: \(PalindromePairs().palindromePairs(words3))")
        
        let words4 = ["a","abc","aba",""]
        print("expected: [[0,3],[3,0],[2,3],[3,2]], actual: \(PalindromePairs().palindromePairs(words4))")
    }
    
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var wordMap = [String:[Int]]()
        for (i, word) in words.enumerated() {
            if wordMap[word] == nil {
                wordMap[word] = [i]
            } else {
                wordMap[word]?.append(i)
            }
        }
        
        var result = [[Int]]()
        
        let addPalindromes = { (word: String, wordIndex: Int, i: Int, j: Int) -> Void in
            if let (str, side) = self.substringFor(word, i, j), let indices = wordMap[str] {
                for idx in indices {
                    if idx != wordIndex {
                        switch side {
                        case .left: result.append([idx, wordIndex])
                        case .right: result.append([wordIndex, idx])
                        case .both:
                            result.append([idx, wordIndex])
                            result.append([wordIndex, idx])
                        }
                    }
                }
            }
        }
        
        for (wordIndex, word) in words.enumerated() {
            for i in 0 ..< word.count {
                addPalindromes(word, wordIndex, i-1, i)
                addPalindromes(word, wordIndex, i, i)
            }
        }
        
        return result
    }
    
    func substringFor(_ word: String, _ i: Int, _ j: Int) -> (String, Side)? {
        for o in 0 ..< word.count {
            let ip = i + (o * -1)
            let jp = j + o
            guard 0 <= ip, jp < word.count else {
                break
            }
            let ipidx = word.index(word.startIndex, offsetBy: ip)
            let jpidx = word.index(word.startIndex, offsetBy: jp)
            guard word[ipidx] == word[jpidx] else {
                return nil
            }
        }
        let leftLength = i
        let rightLength = (word.count - 1) - j
        if leftLength > rightLength {
            return (String(word.prefix(i-rightLength).reversed()), Side.right)
        } else if leftLength < rightLength {
            return (String(word.suffix(word.count - (j+leftLength+1)).reversed()), Side.left)
        } else {
            return ("", Side.both)
        }
    }
    
    enum Side {
        case left
        case right
        case both
    }
}
