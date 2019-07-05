//
//  EncodeAndDecodeTinyURL.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/4/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class EncodeAndDecodeTinyURL {
    
    static func run() {
        
        let ed = EncodeAndDecodeTinyURL()
        let shortUrl1 = ed.encode("http://google.com")
        let shortUrl2 = ed.encode("http://leetcode.com")
        print("Expected: http://google.com, Actual: \(ed.decode(shortUrl1)!) ")
        print("Expected: http://leetcode.com, Actual: \(ed.decode(shortUrl2)!) ")
    }
    
    let baseUrl = "http://tinyurl.com/"
    
    var list = [String]()
    
    func encode(_ longUrl: String) -> String {
        list.append(longUrl)
        let idx = list.count-1
        return "\(baseUrl)\(idx)"
    }
    
    func decode(_ shortUrl: String) -> String? {
        guard shortUrl.lowercased().starts(with: baseUrl), shortUrl.count > baseUrl.count else {
            return nil
        }
        
        guard let tokenIdx = shortUrl.lastIndex(of: "/") else {
            return nil
        }
        
        let startIdx = shortUrl.index(after: tokenIdx)
        
        guard startIdx != shortUrl.endIndex else {
            return nil
        }
        
        guard let idx = Int(String(shortUrl[startIdx...])) else {
            return nil
        }
        
        guard idx >= 0, idx < list.count else {
            return nil
        }
        
        return list[idx]
    }
}
