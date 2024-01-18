//
//  QuickSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

// https://www.geeksforgeeks.org/quick-sort/

struct QuickSort<E: Comparable>: Sort {
    var items: [E]
    
    init(array: [E]) {
        items = array
    }
    
    private mutating func partition(begin: Int, end: Int) -> Int {
        // 使用随机位置坐轴点
        let randomIndex = Int.random(in: begin ..< end)
        swapItem(at: randomIndex, toIndex: end - 1)
        
        let pivot = items[end - 1]
        var i = begin - 1
        for j in stride(from: begin, to: end - 1, by: 1) {
            if (items[j]) < pivot {
                i += 1
                swapItem(at: i, toIndex: j)
            }
        }
        swapItem(at: i + 1, toIndex: end - 1)
        return i + 1
    }
    
    private mutating func quickSort(begin: Int, end: Int) {
        if begin < end - 1 {
            let pi = partition(begin: begin, end: end)
            quickSort(begin: begin, end: pi)
            quickSort(begin: pi + 1, end: end)
        }
    }
    
    mutating func sorted() -> [E] {
        quickSort(begin: 0, end: items.count)
        return items
    }
    
    mutating func swapItem(at index: Int, toIndex: Int) {
        let t = items[index]
        items[index] = items[toIndex]
        items[toIndex] = t
    }
}
