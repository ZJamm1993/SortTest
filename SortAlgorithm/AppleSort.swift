//
//  NSSort.swift
//  SortTest
//
//  Created by zjj on 2021/5/31.
//

import Foundation

struct NSArraySort<E: Comparable>: Sort {
    var items: [E]
    
    init(array: [E]) {
        items = array
    }
    
    mutating func sorted() -> [E] {
        let nsarray = items as NSArray
        let nsarraySorted = nsarray.sortedArray(using: [NSSortDescriptor(key: nil, ascending: true)])
        items = nsarraySorted as! [E]
        return items
    }
}

struct SwiftArraySort<E: Comparable>: Sort {
    var items: [E]
    
    init(array: [E]) {
        items = array
    }
    
    mutating func sorted() -> [E] {
        items.sort { k1, k2 in
            return k1 < k2
        }
        return items
    }
}

