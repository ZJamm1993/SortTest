//
//  BubbleSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

struct BubbleSort<E: Comparable>: Sort {
    var items: [E]
    
    init(array: [E]) {
        items = array
    }
    
    private mutating func bubbleSort() {
        let n = items.count
        for i in 0 ..< n - 1 {
            var swaped = false
            for j in 0 ..< n - i - 1 {
                if items[j] > items[j + 1] {
                    swapItem(at: j, toIndex: j + 1)
                    swaped = true
                }
            }
            if !swaped {
                break
            }
        }
    }
    
    mutating func sorted() -> [E] {
        bubbleSort()
        return items
    }
    
    mutating func swapItem(at index: Int, toIndex: Int) {
        let t = items[index]
        items[index] = items[toIndex]
        items[toIndex] = t
    }
}
