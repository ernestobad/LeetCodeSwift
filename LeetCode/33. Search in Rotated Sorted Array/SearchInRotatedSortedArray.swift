//
//  SearchInRotatedSortedArray.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/14/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class SearchInRotatedSortedArray {
    
    static func run() {
        print("Expected: 4, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 0))")
        print("Expected: -1, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 3))")
        print("Expected: 0, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 4))")
        print("Expected: 1, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 5))")
        print("Expected: 3, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 7))")
        print("Expected: 6, Actual: \(SearchInRotatedSortedArray().search([4,5,6,7,0,1,2], 2))")
        print("Expected: -1, Actual: \(SearchInRotatedSortedArray().search([], 2))")
        print("Expected: -1, Actual: \(SearchInRotatedSortedArray().search([1], 2))")
        print("Expected: 0, Actual: \(SearchInRotatedSortedArray().search([1], 1))")
        print("Expected: 0, Actual: \(SearchInRotatedSortedArray().search([1, 2], 1))")
        print("Expected: 1, Actual: \(SearchInRotatedSortedArray().search([1, 2], 2))")
        print("Expected: -1, Actual: \(SearchInRotatedSortedArray().search([1, 3], 2))")
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        return searchInSlice(nums[0..<nums.count], target)
    }
    
    func searchInSlice(_ nums: ArraySlice<Int>, _ target: Int) -> Int {
        
        guard !nums.isEmpty else {
            return -1
        }
        
        guard nums.count > 1 else {
            return nums[nums.startIndex] == target ? nums.startIndex : -1
        }
        
        let firstidx = nums.startIndex
        let lastidx = nums.index(before: nums.endIndex)
        
        let pidx = nums.startIndex + (nums.count-1)/2
        let pnextidx = nums.index(after: pidx)
        
        if nums[pidx] == target { return pidx }
        
        if isInRotatedRange(nums[firstidx], nums[pidx], target) {
            return searchInSlice(nums[firstidx...pidx], target)
        } else if isInRotatedRange(nums[pnextidx], nums[lastidx], target) {
            return searchInSlice(nums[pnextidx...lastidx], target)
        } else {
            return -1
        }
    }
    
    func isInRotatedRange(_ x0: Int, _ x1: Int, _ t: Int) -> Bool {
        if t == x0 || t == x1 {
            return true
        } else if x0 < x1, x0 < t, t < x1 {
            return true
        } else if x0 > x1, x0 < t || t < x1  {
            return true
        } else {
            return false
        }
    }
    
}
