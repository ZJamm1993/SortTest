//
//  HeapSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

// https://www.geeksforgeeks.org/heap-sort/

class HeapSort<E: Comparable> : BaseSort<E> {
    private func heapify(size: Int, root: Int) {
        // 自下而上的下溢
        var largest = root
        let left = 2 * root + 1
        let right = 2 * root + 2
        if left < size && self.nsarray[left] as! E > self.nsarray[largest] as! E {
            largest = left
        }
        if right < size && self.nsarray[right] as! E > self.nsarray[largest] as! E {
            largest = right
        }
        if largest != root {
            swapItem(at: root, toIndex: largest)
            heapify(size: size, root: largest)
        }
    }
    
    private func heapSort() {
        // 原地建堆
        let size = self.nsarray.count
        for i in stride(from: size / 2 - 1, through: 0, by: -1) {
            heapify(size: size, root: i)
        }
        
        // 堆顶移到最后
        for i in stride(from: size - 1, to: 0, by: -1) {
            swapItem(at: 0, toIndex: i)
            heapify(size: i, root: 0)
        }
    }
    
    override func sorted() -> [E] {
        self.heapSort()
        return self.nsarray as! [E]
    }
}
