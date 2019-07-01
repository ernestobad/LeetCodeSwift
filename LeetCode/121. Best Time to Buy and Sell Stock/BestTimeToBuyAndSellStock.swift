//
//  BestTimeToBuyAndSellStock.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/14/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStock {
    static func run() {
        print("expected: 5 actual: \(BestTimeToBuyAndSellStock().maxProfit([7,1,5,3,6,4]))")
        print("expected: 0 actual: \(BestTimeToBuyAndSellStock().maxProfit([7,6,4,3,1]))")
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var minValueOrNil: Int? = nil
        var maxProfit = 0
        
        for price in prices {
            guard let minValue = minValueOrNil else {
                minValueOrNil = price
                continue
            }
            minValueOrNil = min(minValue, price)
            let profit = price - minValue
            maxProfit = max(maxProfit, profit)
        }
        
        return maxProfit
    }
}
