//
//  NSSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/31.
//

import Foundation

class NSArraySort<E: Comparable> : BaseSort<E> {
    override func sorted() -> [E] {
        let arr = self.nsarray.sortedArray(using: [NSSortDescriptor(key: nil, ascending: true)])
        return arr as! [E]
    }
}

class SwiftArraySort<E: Comparable> : BaseSort<E> {
    var swiftarray = [E]()
    required init(array: [E]) {
        super.init(array: array)
        self.swiftarray.append(contentsOf: array)
    }
    
    override func sorted() -> [E] {
        self.swiftarray.sort()
        return self.swiftarray
    }
}

