//
//  UniqueEmailAddressesSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/9/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class UniqueEmailAddressesSolution {
    
    static func run() {
        let emails = [ "test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com" ]
        print(UniqueEmailAddressesSolution().numUniqueEmails(emails))
    }
    
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set = Set<String>()
        for email in emails {
            set.insert(self.normalize(email))
        }
        return set.count
    }
    
    func normalize(_ email: String) -> String {
        var sb = String()
        var isInLocalName = true
        var isAfterPlus = false
        for c in email {
            if isInLocalName {
                if c == "@" {
                    isInLocalName = false
                } else if c == "." || isAfterPlus {
                    continue
                } else if c == "+" {
                    isAfterPlus = true
                    continue
                }
                sb.append(c)
            } else {
                sb.append(c)
            }
        }
        return sb
    }
}
