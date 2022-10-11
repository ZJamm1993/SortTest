//
//  NSSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/31.
//

import Foundation

class NSArraySort<E: Comparable> : BaseSort<E> {
    override func sorted() -> [E] {
        let arr = (self.items as! [Int] as NSArray).sortedArray(using: [NSSortDescriptor(key: nil, ascending: true)])
        return arr as! [E]
    }
}

class SwiftArraySort<E: Comparable> : BaseSort<E> {
    
    override func sorted() -> [E] {
        self.items.sort()
        return self.items
    }
}

