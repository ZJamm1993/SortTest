//
//  HeapSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

// https://www.geeksforgeeks.org/heap-sort/

struct HeapSort<E: Comparable>: Sort {
    var items: [E]
    
    init(array: [E]) {
        items = array
    }
    
    private mutating func heapify(size: Int, root: Int) {
        // 自下而上的下溢
        var largest = root
        let left = 2 * root + 1
        let right = 2 * root + 2
        if left < size && items[left] > items[largest] {
            largest = left
        }
        if right < size && items[right] > items[largest] {
            largest = right
        }
        if largest != root {
            swapItem(at: root, toIndex: largest)
            heapify(size: size, root: largest)
        }
    }
    
    private mutating func heapSort() {
        // 原地建堆
        let size = items.count
        for i in stride(from: size / 2 - 1, through: 0, by: -1) {
            heapify(size: size, root: i)
        }
        
        // 堆顶移到最后
        for i in stride(from: size - 1, to: 0, by: -1) {
            swapItem(at: 0, toIndex: i)
            heapify(size: i, root: 0)
        }
    }
    
    mutating func sorted() -> [E] {
        heapSort()
        return items
    }
    
    mutating func swapItem(at index: Int, toIndex: Int) {
        let t = items[index]
        items[index] = items[toIndex]
        items[toIndex] = t
    }
}
