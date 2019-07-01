//
//  KClosestPointsToOrigin.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/8/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class KClosestPointsToOrigin {
    static func run() {
        let points = [[3,3],[5,-1],[-2,4]]
        print("expected: [[3,3], [-2,4]], actual: \(KClosestPointsToOrigin().kClosest(points, 2))")
        print("expected: [[3,3], [-2,4], [5,-1]], actual: \(KClosestPointsToOrigin().kClosest(points, 3))")
        print("expected: [[3,3]], actual: \(KClosestPointsToOrigin().kClosest(points, 1))")
        let points2 = [[1,3],[-2,2],[2,-2]]
        print("expected: [[-2,2], [-2,2]], actual: \(KClosestPointsToOrigin().kClosest(points2, 2))")
        let points3 = [[-6,-8],[4,-2],[4,5],[5,7],[3,1]]
        print("expected: [[3,1],[4,-2],[4,5],[5,7]], actual: \(KClosestPointsToOrigin().kClosest(points3, 4))")
    }
    
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
       
        guard K > 0 else {
            return [[Int]]()
        }
        
        guard points.count > K else {
            return points
        }
        
        let midDist = dist(points.randomElement()!)
        var lowSet = [[Int]]()
        var midSet = [[Int]]()
        var highSet = [[Int]]()
        
        for p in points {
            let d = dist(p)
            if d == midDist {
                midSet.append(p)
            } else if d < midDist {
                lowSet.append(p)
            } else {
                highSet.append(p)
            }
        }
        
        if lowSet.count == K {
            return lowSet
        } else if lowSet.count < K, lowSet.count + midSet.count >= K {
            lowSet.append(contentsOf: midSet.prefix(K - lowSet.count))
            return lowSet
        } else if lowSet.count > K {
            return kClosest(lowSet, K)
        } else { // K > lowSet.count
            lowSet.append(contentsOf: midSet)
            lowSet.append(contentsOf: kClosest(highSet, K-lowSet.count))
            return lowSet
        }
    }
    
    func dist(_ point: [Int]) -> Double {
        return sqrt(pow(Double(point[0]), 2.0) + pow(Double(point[1]), 2.0))
    }
    
    func kClosest2(_ points: [[Int]], _ K: Int) -> [[Int]] {
        
        guard K > 0 else {
            return [[Int]]()
        }
        
        var klist = [Double]()
        for p in points {
            let d = dist(p)
            if klist.count < K || d < klist[K-1] {
                orderedInsert(&klist, d)
            }
            if klist.count > K {
                klist.removeLast()
            }
        }
        
        let kval = klist[K-1]
        var res = [[Int]]()
        
        for p in points {
            let d = dist(p)
            if d <= kval {
                res.append(p)
            }
            if res.count >= K {
                break
            }
        }
        
        return res
    }
    
    public func orderedInsert<E : Comparable>(_ arr: inout [E], _ value: E) {
        let idx = binarySearch(arr, value)
        arr.insert(value, at: idx)
    }
    
    public func binarySearch<E : Comparable>(_ arr: [E], _ targetValue: E) -> Array<E>.Index {
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
