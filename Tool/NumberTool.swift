//
//  NumberTool.swift
//  SortTest
//
//  Created by zjj on 2021/5/26.
//

import Foundation

struct NumberTool {
    static func randomInts(count: Int) -> [Int] {
        var arr = [Int]()
        for _ in (0 ..< count) {
            let ra = Int.random(in: 0 ..< 9999999)
            arr.append(ra)
        }
        return arr
    }
    
    static func sortInts(begin: Int, end: Int) -> [Int] {
        var arr = [Int]()
        for i in (begin ... end) {
            let ra = i
            arr.append(ra)
        }
        return arr
    }
    
    static func isSorted(arr: [Int]) -> Bool {
        let count = arr.count
        if count < 2 {
            return true
        }
        for i in (1 ..< count) {
            if arr[i] < arr[i - 1] {
                return false
            }
        }
        return true
    }
}
