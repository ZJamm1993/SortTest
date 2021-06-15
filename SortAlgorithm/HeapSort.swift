//
//  HeapSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

// https://www.geeksforgeeks.org/heap-sort/

class HeapSort <E: Comparable> {
    var array = NSMutableArray()
    
    init(array: [E]) {
        for i in array {
            self.array.add(i)
        }
    }

    private func heapify(size: Int, root: Int) {
        // 自下而上的下溢
        var largest = root
        let left = 2 * root + 1
        let right = 2 * root + 2
        if left < size && self.array[left] as! E > self.array[largest] as! E {
            largest = left
        }
        if right < size && self.array[right] as! E > self.array[largest] as! E {
            largest = right
        }
        if largest != root {
            swap(index: root, toIndex: largest)
            heapify(size: size, root: largest)
        }
    }
    
    private func swap(index: Int, toIndex: Int) {
        let t = self.array[index]
        self.array[index] = self.array[toIndex]
        self.array[toIndex] = t
    }
    
    private func heapSort() {
        // 原地建堆
        let size = self.array.count
        for i in stride(from: size / 2 - 1, through: 0, by: -1) {
            heapify(size: size, root: i)
        }
        
        // 堆顶移到最后
        for i in stride(from: size - 1, to: 0, by: -1) {
            swap(index: 0, toIndex: i)
            heapify(size: i, root: 0)
        }
    }
    
    func sorted() -> [E] {
        self.heapSort()
        return self.array as! [E]
    }
}
