//
//  SockMerchantSolution.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 3/7/21.
//  Copyright © 2021 Ernesto Badillo. All rights reserved.
//

import Foundation

class HackerRankSolutions {
    static func run() {
        TwoSumSolution2.run()
        //BubbleSort.run()
        //RansomNote.run()
        //TwoDimArraySolution.run()
        //SockMerchantSolution.run()
    }
}

class TwoSumSolution2 {
    
    static func run() {
        
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [Int]()
    }
}

class BubbleSort {
    
    static func run() {
        BubbleSort().countSwaps(a: [3, 2, 1])
    }
    
    // Complete the countSwaps function below.
    func countSwaps(a: [Int]) -> Void {
        
        var swaps = 0

        var ma = a
        for i in 0..<ma.count {
            for j in i..<ma.count-1 {
                if ma[i] > ma[j+1] {
                    let tmp = ma[i]
                    ma[i] = ma[j+1]
                    ma[j+1] = tmp
                    swaps += 1
                }
            }
        }
        
        print("Array is sorted in \(swaps) swaps.")
        print("First Element: \(ma[0])")
        print("Last Element: \(ma[ma.count-1])")
    }
    
}

class RansomNote {
    
    static func run() {
        
        let m1 = ["two", "times", "three", "is", "not", "four"]
        let n1 = ["two", "times", "two", "is", "four"]
        let r1 = RansomNote().checkMagazine(magazine: m1, note: n1)
        print("Expected: false, Actual: \(r1)")
        
        let m2 = ["give", "me", "one", "grand", "today", "night"]
        let n2 = ["give", "one", "grand", "today"]
        let r2 = RansomNote().checkMagazine(magazine: m2, note: n2)
        print("Expected: true, Actual: \(r2)")
    }
    
    // Complete the checkMagazine function below.
    func checkMagazine(magazine: [String], note: [String]) -> Bool {
        //
        var dict = [String: Int]()
        for word in magazine {
            dict[word] = 1 + (dict[word] ?? 0)
        }
        
        for word in note {
            
            guard let count = dict[word] else {
                return false
            }
            dict[word] = count-1
            
            if count < 1 {
                return false
            }
        }
        return true
    }
    
}

// https://www.hackerrank.com/challenges/2d-array/problem
class TwoDimArraySolution {
    
    static func run() {
        
//        1 1 1 0 0 0
//        0 1 0 0 0 0
//        1 1 1 0 0 0
//        0 0 2 4 4 0
//        0 0 0 2 0 0
//        0 0 1 2 4 0
  
        let arr1 = [[1, 1, 1, 0, 0, 0],
                    [0, 1, 0, 0, 0, 0],
                    [1, 1, 1, 0, 0, 0],
                    [0, 0, 2, 4, 4, 0],
                    [0, 0, 0, 2, 0, 0],
                    [0, 0, 1, 2, 4, 0]]
        let r1 = TwoDimArraySolution().hourglassSum(arr: arr1)
        print("Expected: 19, Actual: \(r1)")
    }
    
    func hourglassSum(arr: [[Int]]) -> Int {
        var maxSum: Int? = nil
        for r in 0..<4 {
            for c in 0..<4 {
                
                var sum = 0
                for i in 0..<3 {
                    sum += arr[r][c+i]
                    sum += arr[r+2][c+i]
                }
                sum += arr[r+1][c+1]
                
                if let maxs = maxSum {
                    maxSum = max(maxs, sum)
                } else {
                    maxSum = sum
                }
            }
        }
        return maxSum ?? 0
    }
}

// https://www.hackerrank.com/challenges/sock-merchant/problem
class SockMerchantSolution {
    
    static func run() {
        
        let ar1 = [10, 20, 20, 10, 10, 30, 50, 10, 20]
        let n1 = 9
        let r1 = SockMerchantSolution().sockMerchant(n: n1, ar: ar1)
        
        print("Expected: 3 actual: \(r1)")
    }
    
    func sockMerchant(n: Int, ar: [Int]) -> Int {
        var dict = [Int:Bool]()
        var count = 0
        for n in ar {
            let pendingMatch = dict[n] ?? false
            dict[n] = !pendingMatch
            if pendingMatch {
                count += 1
            }
        }
        return count
    }
    
}

