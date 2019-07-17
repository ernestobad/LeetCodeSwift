//
//  SearchA2DMatrix2.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 7/10/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class SearchA2DMatrix2 {
    
    static func run() {
        let matrix = [
            [1,   4,  7, 11, 15],
            [2,   5,  8, 12, 19],
            [3,   6,  9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30]
        ]
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 1))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 15))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 2))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 19))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 10))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 24))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 18))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 30))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 5))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 16))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 17))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 24))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 21))")
        print("Expected: true, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 6))")
        
        print("Expected: false, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 20))")
        print("Expected: false, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 31))")
        print("Expected: false, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 0))")
        print("Expected: false, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 25))")
        print("Expected: false, actual: \(SearchA2DMatrix2().searchMatrix(matrix, 20))")
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        guard !matrix.isEmpty else {
            return false
        }
        
        var lastIndex: Array<Int>.Index = matrix[0].endIndex
        for i in matrix.indices {
            let idx = binarySearch(matrix[i][..<lastIndex], target)
            if idx != matrix[i].endIndex {
                if matrix[i][idx] == target {
                    return true
                } else {
                    lastIndex = idx
                }
            }
        }
        
        return false
    }
    
    public func binarySearch<E : Comparable>(_ arr: ArraySlice<E>, _ targetValue: E) -> Array<E>.Index {
        var lowIndex = arr.startIndex
        var highIndex = arr.endIndex
        while lowIndex != highIndex {
            let midIndex = arr.index(lowIndex, offsetBy: arr.distance(from: lowIndex, to: highIndex)/2)
            if targetValue <= arr[midIndex] {
                highIndex = midIndex
            } else {
                lowIndex = arr.index(after: midIndex)
            }
        }
        return lowIndex
    }
}
