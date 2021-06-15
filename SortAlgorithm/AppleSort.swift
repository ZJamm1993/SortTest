//
//  NSSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/31.
//

import Foundation

class NSArraySort<E: Comparable> {
    var array = NSMutableArray()
    init(array: [E]) {
        for i in array {
            self.array.add(i)
        }
    }
    
    func sorted() -> [E] {
        let arr = self.array.sortedArray(using: [NSSortDescriptor(key: nil, ascending: true)])
        return arr as! [E]
    }
}

class SwiftArraySort<E: Comparable> {
    var array = [E]()
    init(array: [E]) {
        self.array.append(contentsOf: array)
    }
    
    func sorted() -> [E] {
        self.array.sort()
        return self.array
    }
}

