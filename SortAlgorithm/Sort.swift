//
//  Sort.swift
//  SortTest
//
//  Created by zjj on 2021/6/16.
//

import Foundation

protocol Sort {
    associatedtype Element: Comparable
    
    var items: [Element] { get set }
    
    init(array: [Element])
    mutating func sorted() -> [Element]
}

extension Sort {
    
    // MARK: - TEST

    static func testSort(arr: [Element]) {
        let name = String(describing: self)
        print("Begin", name, "...")
        let start = Date()
        var sortInstance = self.init(array: arr)
        let result = sortInstance.sorted()
        let end = Date()
        print("Finish", name)
        print("TimeInterval",end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate)
        print("Checked", isSorted(arr: result))
        print("\n")
    }
    
    static func isSorted(arr: [Element]) -> Bool {
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
